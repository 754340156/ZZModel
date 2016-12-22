//
//  NSObject+Extension.m
//  ZZModel
//
//  Created by zhaozhe on 16/12/21.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//


#import "NSObject+Extension.h"
#import <objc/runtime.h>


#define classType @"classType" //类型字符串
#define type @"type" //类型

static NSString * const zz_classType_basic = @"基本类型";
static NSString * const zz_classType_object = @"对象类型";
static NSString * const zz_classType_other = @"其他类型";


@implementation NSObject (Extension)
#pragma mark - 核心方法
+ (instancetype)zz_objectWithKeyValues:(id)keyValues
{
    NSAssert([keyValues isKindOfClass:[NSDictionary class]], @"不是字典");
    
    id obj = [[self alloc] init];
    
    unsigned int count ;
    objc_property_t *propertyArr  = class_copyPropertyList([self class], &count);
    for (NSInteger i = 0 ; i < count; i++) {
        objc_property_t property = propertyArr[i];
        
        NSString * strPro =   [NSString stringWithUTF8String:property_getName(property)];
        //获取属性值判断是什么类型
        id propertyValue = keyValues[strPro];
        
        
        NSDictionary * propertyTypeDic = [self propertyTypeFromProperty:property];
        //
        NSString *propertyClassType = propertyTypeDic[classType];
        NSString *propertyType = propertyTypeDic[type];
        
        if ([propertyType isEqualToString:zz_classType_basic]) {
            //基本数据类型
            if ([propertyClassType isEqualToString:@"c"]) {
                //bool类型
                NSString *boolValue = [propertyValue lowercaseString];
                if ([boolValue isEqualToString:@"yes"] || [boolValue isEqualToString:@"true"]) {
                    propertyValue = @(YES);
                } else if ([boolValue isEqualToString:@"no"] || [boolValue isEqualToString:@"false"]) {
                    propertyValue = @(NO);
                }
            }
            else {
                propertyValue = [[[NSNumberFormatter alloc] init] numberFromString:propertyValue];
            }
            
            if (propertyValue != nil) {
                [obj setValue:propertyValue forKey:strPro];
            }
            
        }else if([propertyType isEqualToString:zz_classType_object])
        {
            //对象数据类型
            if ([propertyClassType isEqualToString:@"NSArray"]|| [propertyClassType isEqualToString:@"NSMutableArray"]) {
                
            }else if ([propertyClassType isEqualToString:@"NSDictionary"]||[propertyClassType isEqualToString:@"NSMutableDictionary"])
            {
                //模型中有字典没处理
                NSLog(@"不能处理字典");
            }else if ([propertyClassType isEqualToString:@"NSString"]||[propertyClassType isEqualToString:@"NSMutableString"]) {
            
                if (propertyValue != nil) {
                    [obj setValue:propertyValue forKey:strPro];
                }
            }
            
            else{
                //自定义类型
                propertyValue = [NSClassFromString(propertyClassType) zz_objectWithKeyValues:propertyValue];
                if (propertyValue != nil) {
                    [obj setValue:propertyValue forKey:strPro];
                }
            }
        }else
        {
            //其他类型
        }
        
        if (property != nil) {
            continue;
        }
    }
    free(propertyArr);
    return obj;
}
+ (NSMutableArray *)zz_keyValuesArrayWithObjectArray:(NSArray *)objectArray
{
    NSAssert([objectArray isKindOfClass:[NSArray class]], @"不是数组");
    NSMutableArray *array = [NSMutableArray array];
    [objectArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSArray class]]) {
            [array addObject:[self zz_keyValuesArrayWithObjectArray:obj]];
        }else
        {
            id object = [self zz_objectWithKeyValues:obj];
            [array addObject:object];
        }
    }];
    return array;
}
#pragma mark - 公共方法
//获取属性是什么类型
+ (NSDictionary *)propertyTypeFromProperty:(objc_property_t)property
{
    
    NSString *propertyAttrs = @(property_getAttributes(property));
    
    NSMutableDictionary *dicPropertyType = [NSMutableDictionary dictionary];
    
    //截取类型
    NSRange commaRange = [propertyAttrs rangeOfString:@","];
    NSString *propertyType = [propertyAttrs substringWithRange:NSMakeRange(1, commaRange.location - 1)];
    //打印
//    NSLog(@"属性类型:%@, %@", propertyAttrs, propertyType);
    
    if ([propertyType hasPrefix:@"@"] && propertyType.length > 2) {
        //对象类型
        NSString *propertyClassType = [propertyType substringWithRange:NSMakeRange(2, propertyType.length - 3)];
        [dicPropertyType setObject:propertyClassType forKey:classType];
        [dicPropertyType setObject:zz_classType_object forKey:type];
    }
    else if ([propertyType isEqualToString:@"q"]) {
        //NSInteger类型
        [dicPropertyType setObject:@"NSInteger" forKey:classType];
        [dicPropertyType setObject:zz_classType_basic forKey:type];
    }
    else if ([propertyType isEqualToString:@"d"]) {
        //CGFloat类型
        [dicPropertyType setObject:@"CGFloat" forKey:classType];
        [dicPropertyType setObject:zz_classType_basic forKey:type];
    }
    else if ([propertyType isEqualToString:@"c"]) {
        //BOOL类型
        [dicPropertyType setObject:@"BOOL" forKey:classType];
        [dicPropertyType setObject:zz_classType_basic forKey:type];
    }
    else {
        [dicPropertyType setObject:zz_classType_other forKey:type];
    }
    return dicPropertyType;
}
@end

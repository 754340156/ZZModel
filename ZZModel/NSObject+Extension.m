//
//  NSObject+Extension.m
//  ZZModel
//
//  Created by zhaozhe on 16/12/21.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//


#import "NSObject+Extension.h"
#import "NSObject+Property.h"

@implementation NSObject (Extension)
#pragma mark - 核心方法
+ (instancetype)zz_objectWithKeyValues:(id)keyValues
{
    id realKeyValues = [keyValues JSONObject];
    NSAssert([realKeyValues isKindOfClass:[NSDictionary class]], @"不是字典");
    
    id object = [[[self alloc] init] zz_objectWithKeyValues:realKeyValues];
    return object;
}
- (instancetype)zz_objectWithKeyValues:(id)keyValues
{
    for (Property *property in [self.class properties]) {
        Class typeClass = property.type.typeClass;
        
        id value = [keyValues valueForKey:[self.class realPropertyKey:property.name]];
        if (!value) continue;
        if (!property.type.isFromFoundation && typeClass) {
            
            value = [typeClass zz_objectWithKeyValues:value];
            
        }else if ([self respondsToSelector:@selector(objectClassInArray)])
        {
            id object = [self.class objectClassInArray][property.name];
            if ([object isKindOfClass:[NSString  class]]) {
                object = NSStringFromClass(object);
            }
            if (object) {
                // 返回一个装了模型的数组
                value = [object zz_keyValuesArrayWithObjectArray:value];
            }
            
        }else if (property.type.isNumberType){
            NSString *oldValue = value;
            if ([value isKindOfClass:[NSString class]]){
                value = [[[NSNumberFormatter alloc] init] numberFromString:value];
                if (property.type.isBoolType) {
                    NSString *lower = [oldValue lowercaseString];
                    if ([lower isEqualToString:@"yes"] || [lower isEqualToString:@"true"] ) {
                        value = @YES;
                    } else if ([lower isEqualToString:@"no"] || [lower isEqualToString:@"false"]) {
                        value = @NO;
                    }
                }
            }
        }else{
            if (typeClass == [NSString class]) {
                if ([value isKindOfClass:[NSNumber class]]) {
                    value = [value description];
                }else if ([value isKindOfClass:[NSURL class]]){
                    value = [value absoluteString];
                }
            }
        }

        [self setValue:value forKey:property.name];
    }
    return self;
}

#pragma mark - 公共方法
//  根据字典/JSON返回模型数组
+ (NSMutableArray *)zz_keyValuesArrayWithObjectArray:(NSArray *)objectArray
{
    
    if ([Foundation isClassFromFoundation:self])
        return objectArray.mutableCopy;
    
    objectArray = [objectArray JSONObject];
    NSMutableArray *modelArray = [NSMutableArray array];
    for (NSDictionary *keyValues in objectArray) {
        id model;
        model = [self zz_objectWithKeyValues:keyValues];
        if (model) {
            [modelArray addObject:model];
        }
    }
    
    return modelArray;
    
}
//处理json的格式
- (id)JSONObject
{
    id obj ;
    if ([self isKindOfClass:[NSString class]]) {
        return [NSJSONSerialization JSONObjectWithData:[(NSString *)self dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
    }else if([self isKindOfClass:[NSData class]])
    {
        return [NSJSONSerialization JSONObjectWithData:(NSData *)self options:kNilOptions error:nil];
    }
    return obj? :self;
}
//如果修改了名字替换
+ (NSString *)realPropertyKey:(NSString *)propertyName{
    NSString *key;
    if ([self respondsToSelector:@selector(replacedKeyFromPropertyName)]) {
        key = [self replacedKeyFromPropertyName][propertyName];
    }
    return key?:propertyName;
}
@end

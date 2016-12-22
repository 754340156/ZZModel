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
    NSAssert([keyValues isKindOfClass:[NSDictionary class]], @"不是字典");
    
    id obj = [[self alloc] init];
    
    [[self properties] enumerateObjectsUsingBlock:^(Property * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Class typeClass = obj.type.typeClass;
        if (obj.type.isBoolType) {
            NSLog(@"bool");
        }else if (obj.type.isIdType){
            NSLog(@"ID");
        }else if (obj.type.isNumberType){
            NSLog(@"Number");
        }else{
            NSLog(@"%@",typeClass);
        }
    }];
    
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

@end

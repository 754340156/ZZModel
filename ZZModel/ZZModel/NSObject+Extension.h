//
//  NSObject+Extension.h
//  ZZModel
//
//  Created by zhaozhe on 16/12/21.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ZZKeyValue <NSObject>
@optional
//返回字典告诉数组里面装的是什么
+ (NSDictionary *)objectClassInArray;
+ (NSDictionary *)replacedKeyFromPropertyName;
@end


@interface NSObject (Extension)<ZZKeyValue>
#pragma mark - 字典转模型
/**
 *  通过字典来创建一个模型
 *  @param keyValues 字典(可以是NSDictionary、NSData、NSString)
 *  @return 新建的对象
 */
+ (instancetype)zz_objectWithKeyValues:(id)keyValues;
/**
 *  通过模型数组来创建一个字典数组
 *  @param objectArray 模型数组
 *  @return 字典数组
 */
+ (NSMutableArray *)zz_keyValuesArrayWithObjectArray:(NSArray *)objectArray;
@end

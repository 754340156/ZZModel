//
//  Property.h
//  ZZModel
//
//  Created by zhaozhe on 16/12/22.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "PropertyType.h"
//存储类
@interface Property : NSObject
/**  成员属性的名字 */
@property (nonatomic, readonly) NSString *name;
/**  成员属性的类型 */
@property (nonatomic, readonly) PropertyType *type;
/**  初始化根据属性名获取类的相关信息 */
+ (instancetype)propertyWithProperty:(objc_property_t)property;
@end

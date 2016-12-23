//
//  NSObject+Property.m
//  ZZModel
//
//  Created by zhaozhe on 16/12/22.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "NSObject+Property.h"

@implementation NSObject (Property)
+ (NSArray <Property *> *)properties
{
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int outCount  = 0;
    objc_property_t * propertyArray = class_copyPropertyList(self, &outCount);
    for (unsigned int i = 0; i < outCount; i++) {
        objc_property_t property = propertyArray[i];
        Property *propertyObj = [Property propertyWithProperty:property];
        [array addObject:propertyObj];
    }
    free(propertyArray);
    
    return array;
}
@end

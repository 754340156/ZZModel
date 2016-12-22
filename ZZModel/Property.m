//
//  Property.m
//  ZZModel
//
//  Created by zhaozhe on 16/12/22.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "Property.h"

@implementation Property
+ (instancetype)propertyWithProperty:(objc_property_t)property
{
    return  [[Property alloc] initWithProperty:property];
}


- (instancetype)initWithProperty:(objc_property_t)property{
    if (self = [super init]) {
        _name = @(property_getName(property));
        _type = [PropertyType propertyTypeWithAttributeString:@(property_getAttributes(property))];;
    }
    return self;
}
@end

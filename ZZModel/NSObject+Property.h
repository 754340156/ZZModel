//
//  NSObject+Property.h
//  ZZModel
//
//  Created by zhaozhe on 16/12/22.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Property.h"
@interface NSObject (Property)
+ (NSArray <Property *> *)properties;
@end

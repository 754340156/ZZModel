//
//  Foundation.h
//  ZZModel
//
//  Created by zhaozhe on 16/12/23.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <Foundation/Foundation.h>
//判断是不是Foundation下的类，主要是做判断去递归
@interface Foundation : NSObject
+ (BOOL)isClassFromFoundation:(Class)typeClass;
@end

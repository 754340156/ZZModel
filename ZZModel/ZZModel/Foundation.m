//
//  Foundation.m
//  ZZModel
//
//  Created by zhaozhe on 16/12/23.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "Foundation.h"
static NSSet *foundationClasses;
@implementation Foundation

+ (NSSet *)foundationClasses
{
    if (!foundationClasses) {
        foundationClasses = [NSSet setWithObjects:
                             [NSURL class],
                             [NSDate class],
                             [NSValue class],
                             [NSData class],
                             [NSError class],
                             [NSArray class],
                             [NSDictionary class],
                             [NSString class],
                             [NSAttributedString class],nil];
    }
    return foundationClasses;
}

+ (BOOL)isClassFromFoundation:(Class)typeClass
{
    //nsobject特殊处理
    if (typeClass == [NSObject class]) return YES;
    
    __block BOOL result = NO;
    [[self foundationClasses] enumerateObjectsUsingBlock:^(Class foundationClass, BOOL *stop) {
        if ([typeClass isSubclassOfClass:foundationClass]) {
            result = YES;
            *stop = YES;
        }
    }];
    return result;
}
@end

//
//  Person.h
//  ZZModel
//
//  Created by zhaozhe on 16/12/23.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;
@interface Person : NSObject
/**  名字 */
@property(nonatomic,copy) NSString * name;
/**  头像 */
@property(nonatomic,copy) NSString * icon;
/**  身高 */
@property(nonatomic,copy) NSNumber * height;
/**  性别 */
@property(nonatomic,assign) BOOL  isMan;
/**  <#注释#> */
@property(nonatomic,strong) NSArray<Dog *> * dog;

@end

@interface Dog : NSObject
/**  名字 */
@property(nonatomic,copy) NSString * name;
/**  头像 */
@property(nonatomic,copy) NSString * icon;
/**  身高 */
@property(nonatomic,copy) NSNumber * height;
/**  性别 */
@property(nonatomic,assign) BOOL * isMan;
@end

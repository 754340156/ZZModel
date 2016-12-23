//
//  ViewController.m
//  ZZModel
//
//  Created by zhaozhe on 16/12/21.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "ZZModel.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@{@"name":@"小王",
                         @"icon":@"123456789",
                         @"height":@183,
                         @"isMan":@"1",
                         @"dog":@[@{@"name":@"小王的dog1",
                                    @"icon":@"123456789",
                                    @"height":@183,
                                    @"isMan":@"1"},
                                  @{@"name":@"小王的dog2",
                                    @"icon":@"123456789",
                                    @"height":@183,
                                    @"isMan":@"1"},
                                  @{@"name":@"小王的dog3",
                                    @"icon":@"123456789",
                                    @"height":@183,
                                    @"isMan":@"1"}]},
                       @{@"name":@"小李",
                         @"icon":@"123456789",
                         @"height":@183,
                         @"isMan":@"1",
                         @"dog":@[@{@"name":@"小李的dog1",
                                    @"icon":@"123456789",
                                    @"height":@183,
                                    @"isMan":@"1"},
                                  @{@"name":@"小李的dog2",
                                    @"icon":@"123456789",
                                    @"height":@183,
                                    @"isMan":@"1"},
                                  @{@"name":@"小李的dog3",
                                    @"icon":@"123456789",
                                    @"height":@183,
                                    @"isMan":@"1"}]}];
    NSArray *realArray =  [Person zz_keyValuesArrayWithObjectArray:array];
    
}




@end

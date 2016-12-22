//
//  ViewController.m
//  ZZModel
//
//  Created by zhaozhe on 16/12/21.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "NSObject+Extension.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dict = @{
                           @"name" : @"Jack",
                           @"icon" : @"lufy.png",
                           @"age" : @"20",
                           @"height" : @1.55,
                           @"money" : @"100.9",
                           @"sex" : @(SexFemale),
                           @"gay" : @"1"
                           };
     [User zz_objectWithKeyValues:dict];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

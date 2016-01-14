//
//  RootViewController.m
//  ZanShang
//
//  Created by wey on 16/1/14.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "RootViewController.h"
#import "SoftwareViewController.h"
#import "MeViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController:[SoftwareViewController class] title:@"软件" selectImg:placeHolder img:placeHolder];
    [self addChildViewController:[MeViewController class] title:@"设置" selectImg:placeHolder img:placeHolder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildViewController:(Class )class title:(NSString *)str selectImg:(NSString *)selectImg img:(NSString *)img {
    
    UIViewController *childController = [[class alloc]init];
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:childController];
    // 隐藏 tabbar
    if (childController.childViewControllers.count > 0) {
        childController.hidesBottomBarWhenPushed = YES;
    }
    childController.title = str;
    childController.tabBarItem = [[UITabBarItem alloc]initWithTitle:str image:[UIImage imageNamed:img] selectedImage:[UIImage imageNamed:selectImg]];
    [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10 weight:16]} forState:UIControlStateNormal];
    [self addChildViewController:nvc];
}

@end

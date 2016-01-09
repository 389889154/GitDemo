//
//  RootViewController.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "RootViewController.h"
#import "ActivityTableViewController.h"
#import "MovieTableViewController.h"
#import "CinemaTableViewController.h"
#import "MyTableViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ActivityTableViewController *activityVC = [[ActivityTableViewController alloc]init];
    [self addChildViewController:activityVC title:@"活动" imgName:@"activity.png"];
    
    MovieTableViewController *movieVC = [[MovieTableViewController alloc]init];
    [self addChildViewController:movieVC title:@"电影" imgName:@"movie"];
    
    CinemaTableViewController *cinemaVC = [[CinemaTableViewController alloc]init];
    [self addChildViewController:cinemaVC title:@"影院" imgName:@"cinema.png"];
    
    MyTableViewController *myVC = [[MyTableViewController alloc]init];
    [self addChildViewController:myVC title:@"我的" imgName:@"user.png"];
    
    self.selectedIndex = 0;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 49)];
    view.backgroundColor = kThemeColor;
    [self.tabBar setTintColor:[UIColor whiteColor]];
    [self.tabBar insertSubview:view atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imgName:(NSString *)imgName {
    
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:childController];
    childController.title = title;
    childController.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:imgName] selectedImage:[UIImage imageNamed:imgName]];
    [self addChildViewController:nvc];
}


@end

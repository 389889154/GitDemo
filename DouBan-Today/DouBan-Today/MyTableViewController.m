//
//  MyTableViewController.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "MyTableViewController.h"
#import "User.h"
#import "LoginViewController.h"
@interface MyTableViewController ()
@property (nonatomic ,assign) BOOL isLogin;
@property (nonatomic, strong) NSString *itemTitle;
@property (nonatomic, strong) UIBarButtonItem *barItem;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self check];
    self.view.backgroundColor = kThemeColor;
    self.tableView.rowHeight = 60.f;
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _barItem = [[UIBarButtonItem alloc]initWithTitle:_itemTitle style:UIBarButtonItemStyleDone target:self action:@selector(rightAction:)];
    self.navigationItem.rightBarButtonItem = _barItem;
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = @[@"我的活动",@"我的电影",@"清楚缓存"][indexPath.row];
    cell.backgroundColor = kThemeColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)rightAction:(UIBarButtonItem *)sender {
    if ([self.barItem.title isEqualToString:@"注销"]) {
        UIAlertController *resignVC = [UIAlertController alertControllerWithTitle:@"提 示" message:@"是否确认注销" preferredStyle:UIAlertControllerStyleAlert];
        [resignVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [resignVC addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[NSUserDefaults standardUserDefaults] setObject:@"offLine" forKey:kUserStatus];
            self.barItem.title = @"登录";
        }]];
        [self presentViewController:resignVC animated:YES completion:nil];
        
    } else {
        
        UIAlertController *loginVC = [UIAlertController alertControllerWithTitle:@"提 示" message:@"是否确认登录" preferredStyle:UIAlertControllerStyleAlert];
        [loginVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [loginVC addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            LoginViewController *lvc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"login"];
            lvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController showViewController:lvc sender:nil];
            self.barItem.title = @"注销";
        }]];
        [self presentViewController:loginVC animated:YES completion:nil];
    }
 
}

- (void)viewWillAppear:(BOOL)animated {

    [self check];
}

- (void)check {
    if ([DataHelper isOnline]) {
        _isLogin = YES;
        self.barItem.title = @"注销";
    }else {
        _isLogin = NO;
        self.barItem.title = @"登录";
    }
}
@end

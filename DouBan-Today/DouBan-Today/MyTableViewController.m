//
//  MyTableViewController.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()
@property (nonatomic ,assign) BOOL isLogin;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kThemeColor;
    self.tableView.rowHeight = 60.f;
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注销" style:UIBarButtonItemStyleDone target:self action:@selector(rightAction:)];
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
    _isLogin = !_isLogin;
    if (_isLogin) {
        UIAlertController *resignVC = [UIAlertController alertControllerWithTitle:@"提 示" message:@"是否确认注销" preferredStyle:UIAlertControllerStyleAlert];
        [resignVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [resignVC addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            sender.title = @"登录";
        }]];
        [self presentViewController:resignVC animated:YES completion:nil];
        
    } else {
    
        UIAlertController *loginVC = [UIAlertController alertControllerWithTitle:@"提 示" message:@"是否确认登录" preferredStyle:UIAlertControllerStyleAlert];
        [loginVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [loginVC addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            sender.title = @"注销";
        }]];
        [self presentViewController:loginVC animated:YES completion:nil];
    }

    
    
 
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

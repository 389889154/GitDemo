//
//  ActivityTableViewController.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//



#import "ActivityTableViewController.h"
#import "ActivityModel.h"
#import "ActivityTableViewCell.h"
#import "ActivityDetailViewController.h"
@interface ActivityTableViewController ()
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation ActivityTableViewController

- (NSMutableArray *)items {

    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.bounces = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"ActivityTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
 
    id hud = [[NetWorkHelper shareInstance] createHud];
    kWeakSelf(weakSelf);
    [[NetWorkHelper shareInstance] getDataWithUrlString:activityUrl success:^(NSDictionary *dic) {
        
        
        NSArray *itemArr = dic[@"events"];
        for (NSDictionary *dic in itemArr) {
            ActivityModel *model = [ActivityModel activityWithDic:dic];
            [weakSelf.items addObject:model];
        }
        [weakSelf.tableView reloadData];
        [hud removeFromSuperview];
    } fail:^{
       // 没写
    }];
    
    self.tableView.rowHeight = self.view.frame.size.height/3;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return  self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = _items[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    ActivityDetailViewController *detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"activityNext"];
    detailVC.model = _items[indexPath.row];
    ActivityTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath] ;
    detailVC.img = cell.iconView.image;
    [self.navigationController showViewController:detailVC sender:nil];
    
}
@end

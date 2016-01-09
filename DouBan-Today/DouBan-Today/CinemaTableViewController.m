//
//  CinemaTableViewController.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "CinemaTableViewController.h"
#import "CinemaModel.h"
#import "CinemaTableViewCell.h"
@interface CinemaTableViewController ()
@property (nonatomic, strong) NSMutableArray *items;
@end


@implementation CinemaTableViewController

-(NSMutableArray *)items {

    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.bounces = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"CinemaTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    id hud = [[NetWorkHelper shareInstance] createHud];
    kWeakSelf(weakSelf);
    [[NetWorkHelper shareInstance] getDataWithUrlString:cinemaUrl success:^(NSDictionary *dic) {
        
        
        NSArray *itemArr = dic[@"result"][@"data"];
        for (NSDictionary *dic in itemArr) {
            CinemaModel *model = [CinemaModel cinemaWithDic:dic];
            [weakSelf.items addObject:model];
        }
        [weakSelf.tableView reloadData];
        [hud removeFromSuperview];
    } fail:^{
        // 没写
    }];
    
    self.tableView.rowHeight = self.view.frame.size.height/5;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CinemaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = _items[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
}
@end

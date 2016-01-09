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
    
    
    kWeakSelf(weakSelf);
    [[NetWorkHelper shareInstance] getDataWithUrlString:cinemaUrl success:^(NSDictionary *dic) {
        
        
        NSArray *itemArr = dic[@"result"][@"data"];
        for (NSDictionary *dic in itemArr) {
            CinemaModel *model = [CinemaModel cinemaWithDic:dic];
            [weakSelf.items addObject:model];
        }
        
        [weakSelf.tableView reloadData];
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

    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CinemaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = _items[indexPath.row];
    
    return cell;
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

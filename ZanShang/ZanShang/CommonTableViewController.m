//
//  CommonTableViewController.m
//  ALiPay
//
//  Created by wey on 16/1/12.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "CommonTableViewController.h"
#import "CommonTableViewCell.h"
@interface CommonTableViewController ()

@end

@implementation CommonTableViewController

- (instancetype)init {
    
    if (self = [super init]) {
        _refeshMode = RefeshModeNone;
        _sectionNumber = 1;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:(245 / 255.0) green:(245 / 255.0) blue:(245 / 255.0) alpha:1];
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor darkGrayColor];
    
    
}

- (void)setDataArray:(NSArray *)dataArray {
    
    _dataArray = dataArray;
    ///  刷新
    [self.tableView reloadData];
    // [self.cellClass description]  就是类名
    [self.tableView registerClass:self.cellClass forCellReuseIdentifier:[self.cellClass description]];
   
}

- (void)setRefeshMode:(RefeshMode)refeshMode {
    
    _refeshMode = refeshMode;
    [self pullDownRefreshOperation];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (self.sectionNumber == 1) ? self.dataArray.count : [self.dataArray[section] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self.cellClass description]];
    if (!cell) {
        cell = [[self.cellClass alloc]init];
    }
    if (self.sectionNumber == 1) {
        cell.model = [[self.cellClass alloc] init];
    } else if (self.sectionNumber >1) {
        cell.model = [self.dataArray[indexPath.section] objectAtIndex:indexPath.row];
    }
    return cell;
    
}

// section 高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 20.f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return (section == self.dataArray.count -1) ? 10 : 0;
}

#pragma mark --- 自定义分割线
- (void) tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 5, 0, 5);
    
    // 三个方法并用，实现自定义分割线效果
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = insets;
    }
    
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:insets];
    }
    
    
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }

}

#pragma mark --- 刷新方法
- (void)pullDownRefreshOperation {
    
    switch (_refeshMode) {
        case RefeshModeNone:
            break;
        case RefeshModeHeader:
            [self headerAction];
            break;
        case RefeshModeFooter:
            [self footerAction];
            break;
        default:
            break;
    }
}

- (void)headerAction {
    
    NSLog(@"headerAction");
}

- (void) footerAction {
    
    NSLog(@"footAction");
}


@end

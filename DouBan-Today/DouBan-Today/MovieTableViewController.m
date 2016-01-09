//
//  MovieTableViewController.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "MovieTableViewController.h"
#import "MovieModel.h"
#import "MovieTableViewCell.h"
#import "MovieCollectionViewCell.h"
#import "MovieNextViewController.h"
@interface MovieTableViewController () <UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL flag;

@end

@implementation MovieTableViewController

- (UICollectionView *)collectionView {

    if (!_collectionView) {
        CGSize size = self.view.frame.size;
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((size.width- 20)/3, (size.height - 20)/3);
        layout.minimumInteritemSpacing = 5.f;
        layout.minimumLineSpacing = 5.f;
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
        _collectionView.bounces = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;

    }
    return _collectionView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = self.view.frame.size.height/4;
        _tableView.bounces = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
    
}

- (NSMutableArray *)items {
    
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    id hud = [[NetWorkHelper shareInstance] createHud];
    kWeakSelf(weakSelf);
    [[NetWorkHelper shareInstance] getDataWithUrlString:movieUrl success:^(NSDictionary *dic) {
        
        NSArray *itemArr = dic[@"result"];
        for (NSDictionary *dic in itemArr) {
            MovieModel *model = [MovieModel movieWithDic:dic];
            [weakSelf.items addObject:model];
        }
        [weakSelf.tableView reloadData];
        [hud removeFromSuperview];
    } fail:^{
        // 没写
    }];

    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MovieCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_collection.png"] style:UIBarButtonItemStyleDone target:self action:@selector(rightAction:)];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = _items[indexPath.row];

    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    MovieTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self nextVC:indexPath :cell.iconView.image];
}

#pragma mark -- Collection DataSource 

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCollectionViewCell *cell = (MovieCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    [self nextVC:indexPath :cell.iconView.image];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = _items[indexPath.item];

    return cell;
}


- (void)rightAction:(UIBarButtonItem *)sender {
    
    _flag = !_flag;
    if (_flag) {
        sender.image = [UIImage imageNamed:@"btn_nav_list.png"];
        [self.tableView removeFromSuperview];
        [self.view addSubview:self.collectionView];
    } else {
        sender.image = [UIImage imageNamed:@"btn_nav_collection.png"];
        [self.collectionView removeFromSuperview];
        [self.view addSubview:self.tableView];
    }
    
}

- (void)nextVC:(NSIndexPath *)indexPath :(UIImage *)img{

    MovieNextViewController *VC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"movieNext"];
    MovieModel *model = _items[indexPath.row];
    VC.movieId = model.movieid;
    VC.img = img;
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController showViewController:VC sender:nil];
}

@end

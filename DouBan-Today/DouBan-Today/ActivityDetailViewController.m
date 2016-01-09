//
//  ActivityDetailViewController.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/9.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "ActivityModel.h"
@interface ActivityDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *loclabel;
@property (weak, nonatomic) IBOutlet UILabel *contentlabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _model.title;
    _iconView.image = _img;
    _titlelabel.text = _model.title;
    
    NSString *beginTime = [_model.begin_time substringFromIndex:5];
    NSString *endTime = [_model.end_time substringFromIndex:5];
    _dateLabel.text = [NSString stringWithFormat:@"%@ -- %@",beginTime,endTime];
    _contentlabel.text = _model.content;
    _nameLabel.text = _model.name;
    _loclabel.text = _model.address;
    _typeLabel.text = _model.category_name;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"star_faved.png"] style:UIBarButtonItemStyleDone target:self action:@selector(rightAction:)];
}

- (void)rightAction:(UIBarButtonItem *)sender{
    [NetWorkHelper createHudWith:@"收藏成功"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

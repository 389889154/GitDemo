//
//  MovieNextViewController.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/9.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "MovieNextViewController.h"
#import "MovieDetal.h"
@interface MovieNextViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scorelabel;
@property (weak, nonatomic) IBOutlet UILabel *datelabel;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
/** 制作人 */
@property (weak, nonatomic) IBOutlet UILabel *contentlabel;
/** 电影情节 */
@property (weak, nonatomic) IBOutlet UILabel *contentLabel2;

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (nonatomic, strong) MovieDetal *model;
@end

@implementation MovieNextViewController


- (void)setUpView {
    _scorelabel.text = [NSString stringWithFormat:@"评分: %@   (%@评论)",_model.rating,_model.rating_count];
    _datelabel.text = _model.release_date;
    _timelabel.text = _model.runtime;
    _typeLabel.text = _model.genres;
    _countryLabel.text = _model.country;
    _contentLabel2.text = _model.plot_simple;
    _contentlabel.text = _model.actors;
    _iconView.image = _img;
    self.navigationItem.title = _model.title;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"star_faved.png"] style:UIBarButtonItemStyleDone target:self action:@selector(rightAction:)];
    [[NetWorkHelper shareInstance] getDataWithUrlString:[NSString stringWithFormat:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchmovie.php?movieId=%@",_movieId] success:^(NSDictionary *dic) {
        _model = [MovieDetal movieDetailWithDic:dic[@"result"]];
        [self setUpView];
    } fail:^{
        
    }];
}

- (void)rightAction:(UIBarButtonItem *)sender {
    
}


@end

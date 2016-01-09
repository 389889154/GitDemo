//
//  MovieCollectionViewCell.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "MovieCollectionViewCell.h"
#import "MovieModel.h"
@interface MovieCollectionViewCell ()


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation MovieCollectionViewCell

- (void)setModel:(MovieModel *)model {

    _model = model;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.pic_url] placeholderImage:placeHolderImg options:SDWebImageRetryFailed];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.text = model.movieName;
}

- (void)awakeFromNib {
    self.backgroundColor = kThemeColor;
}

@end

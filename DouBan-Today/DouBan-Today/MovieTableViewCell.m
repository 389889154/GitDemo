//
//  MovieTableViewCell.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "MovieTableViewCell.h"
#import "MovieModel.h"
@interface MovieTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titileLabel;

@end

@implementation MovieTableViewCell

- (void)setModel:(MovieModel *)model {

    _model = model;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.pic_url] placeholderImage:placeHolderImg options:SDWebImageRetryFailed];
    _titileLabel.textColor = [UIColor whiteColor];
    _titileLabel.text = model.movieName;
}

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = kThemeColor;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

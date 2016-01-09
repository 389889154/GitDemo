//
//  ActivityTableViewCell.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "ActivityTableViewCell.h"
#import "ActivityModel.h"
@interface ActivityTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *locLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;



@end

@implementation ActivityTableViewCell

- (void)setModel:(ActivityModel *)model {
    _model = model;
    
    
    NSString *beginTime = [model.begin_time substringFromIndex:5];
    NSString *endTime = [model.end_time substringFromIndex:5];
    _titleLabel.text = model.title;
    _timeLabel.text = [NSString stringWithFormat:@"%@ -- %@",beginTime,endTime];
    _locLabel.text = model.address;
    
    _typeLabel.text = model.category_name;
    _countLabel.text = [NSString stringWithFormat:@"感兴趣: %@  参加: %@",model.participant_count,model.wisher_count];
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.image]placeholderImage:placeHolderImg options:SDWebImageRetryFailed];
    
}

- (void)awakeFromNib {
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1.f;
    self.backgroundColor = kThemeColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

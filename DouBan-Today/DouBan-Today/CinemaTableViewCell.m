//
//  CinemaTableViewCell.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "CinemaTableViewCell.h"
#import "CinemaModel.h"

@interface CinemaTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;

@end

@implementation CinemaTableViewCell

- (void)setModel:(CinemaModel *)model {

    _model = model;
    _titleLabel.text = model.cinemaName;
    _addressLabel.text = model.address;
    _telLabel.text = model.telephone;
    
}

- (void)awakeFromNib {
    self.backgroundColor = kThemeColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

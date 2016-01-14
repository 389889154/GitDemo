//
//  CommonTableViewCell.m
//  ALiPay
//
//  Created by wey on 16/1/12.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "CommonCellModel.h"
@implementation CommonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.textLabel.font = [UIFont boldSystemFontOfSize:16];
    }
    return self;
}
- (void)setModel:(CommonCellModel *)model {

    _model = model;
    self.textLabel.text = model.title;
    self.imageView.image = [UIImage imageNamed:model.imageName];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}



@end

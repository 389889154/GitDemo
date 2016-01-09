//
//  ActivityTableViewCell.h
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ActivityModel;
@interface ActivityTableViewCell : UITableViewCell
@property (nonatomic, strong) ActivityModel *model;
@end

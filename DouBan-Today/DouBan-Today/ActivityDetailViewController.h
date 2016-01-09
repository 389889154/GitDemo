//
//  ActivityDetailViewController.h
//  DouBan-Today
//
//  Created by lanou3g on 16/1/9.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ActivityModel;
@interface ActivityDetailViewController : UIViewController
@property (nonatomic, strong) ActivityModel *model;
@property (nonatomic, strong) UIImage *img;
@end

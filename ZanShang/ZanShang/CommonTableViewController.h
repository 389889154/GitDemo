//
//  CommonTableViewController.h
//  ALiPay
//
//  Created by wey on 16/1/12.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    RefeshModeNone          =  0,
    RefeshModeHeader        =  1 << 0,
    RefeshModeFooter        =  1 << 1
} RefeshMode;

@interface CommonTableViewController : UITableViewController

@property (nonatomic, assign) NSInteger sectionNumber;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, copy) Class cellClass;
@property (nonatomic, assign) RefeshMode refeshMode;

// TODO: 然而并没写  需要刷新 子类需重写此方法
- (void)pullDownRefreshOperation;

@end

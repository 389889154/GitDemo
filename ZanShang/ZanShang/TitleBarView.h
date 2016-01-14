//
//  TitleBarView.h
//  ZanShang
//
//  Created by wey on 16/1/14.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleBarView : UIScrollView
@property (nonatomic, strong) NSMutableArray *titleButton;
@property (nonatomic, assign) NSUInteger currentIndex;
@property (nonatomic, copy) void (^titleButtonClicked)(NSUInteger index);


- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles;
- (void)setTitleButtonsColor;
@end

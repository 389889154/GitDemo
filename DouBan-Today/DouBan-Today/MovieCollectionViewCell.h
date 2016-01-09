//
//  MovieCollectionViewCell.h
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieModel;
@interface MovieCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) MovieModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@end

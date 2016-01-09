//
//  MovieDetal.h
//  DouBan-Today
//
//  Created by lanou3g on 16/1/9.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetal : NSObject

@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *genres;
@property (nonatomic, copy) NSString *runtime;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *poster;
@property (nonatomic, copy) NSString *rating_count;
@property (nonatomic, copy) NSString *plot_simple;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *release_date;
@property (nonatomic, copy) NSString *actors;

+(instancetype) movieDetailWithDic:(NSDictionary *)dic;
@end

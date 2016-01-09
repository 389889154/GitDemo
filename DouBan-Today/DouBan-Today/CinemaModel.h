//
//  CinemaModel.h
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaModel : NSObject
@property (nonatomic, copy) NSString *cinemaName;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *telephone;

+ (instancetype) cinemaWithDic:(NSDictionary *)dic;
@end



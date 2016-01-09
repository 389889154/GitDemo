//
//  CinemaModel.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "CinemaModel.h"

@implementation CinemaModel

+ (instancetype) cinemaWithDic:(NSDictionary *)dic {
    id instance = [[self alloc]init];
    [instance setValuesForKeysWithDictionary:dic];
    return instance;
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
}
@end

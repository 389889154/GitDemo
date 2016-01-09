//
//  User.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/9.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "User.h"

@implementation User

+ (instancetype)userWithDic:(NSDictionary *)dic {

    User *model = [[User alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

@end

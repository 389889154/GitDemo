//
//  MovieDetal.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/9.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "MovieDetal.h"

@implementation MovieDetal

+(instancetype) movieDetailWithDic:(NSDictionary *)dic {

    MovieDetal *model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end

//
//  MovieModel.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel


+ (instancetype) movieWithDic:(NSDictionary *)dic {

    MovieModel *model = [[MovieModel alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {

}

- (void)setValue:(id)value forKey:(NSString *)key {

    [super setValue:value forKey:key];
    if ([key isEqualToString:@"movieId"]) {
        _movieid = [NSString stringWithFormat:@"%ld",[value integerValue]];
    }
}
@end

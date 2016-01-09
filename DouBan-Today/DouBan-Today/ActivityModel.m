//
//  ActivityModel.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel

+ (instancetype)activityWithDic:(NSDictionary *)dic {

    ActivityModel *model = [[ActivityModel alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}

- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"participant_count"]) {
        _participant_count = [NSString stringWithFormat:@"%ld",[value integerValue]];
    } else if ([key isEqualToString:@"wisher_count"]) {
        _wisher_count = [NSString stringWithFormat:@"%ld",[value integerValue]];
    } else if ([key isEqualToString:@"owner"]) {
        _name = value[@"name"];
    }
    
}
@end

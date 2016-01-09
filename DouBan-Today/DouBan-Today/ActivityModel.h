//
//  ActivityModel.h
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityModel : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * begin_time;
@property (nonatomic, copy) NSString * end_time;
@property (nonatomic, copy) NSString * address;
@property (nonatomic, copy) NSString * category_name;
@property (nonatomic, copy) NSString * participant_count;
@property (nonatomic, copy) NSString * image;
@property (nonatomic, copy) NSString * wisher_count;
@property (nonatomic, copy) NSString * name;

+ (instancetype)activityWithDic:(NSDictionary *)dic;


@end


/*
 
 
 title ： 活动标题
 begin_time :  开始时间
 end_time ：结束时间
 address ：地址
 category_name：活动类型
 participant_count：参加人数
 wisher_count：感兴趣人数
 image：活动图像(先显示占位图像)
 name：活动举办方
 category_name：活动类型
 
 
 */
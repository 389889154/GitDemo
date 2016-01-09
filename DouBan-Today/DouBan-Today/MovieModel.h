//
//  MovieModel.h
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject

@property (nonatomic, strong) NSString *movieName;
@property (nonatomic, strong) NSString *pic_url;
@property (nonatomic, strong) NSString *movieid;

+ (instancetype) movieWithDic:(NSDictionary *)dic;
@end


/*
 
 
 movieName：电影名
	pic_url：图片
	movieid：电影编号
 */
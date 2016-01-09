//
//  NetWorkHelper.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "NetWorkHelper.h"

@implementation NetWorkHelper



+ (instancetype) shareInstance {
    
    static NetWorkHelper *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NetWorkHelper alloc]init];
    });
    return instance;
    
}

- (void)getDataWithUrlString:(NSString *)urlStr success:(void (^)(NSDictionary *))successBlock fail:(void (^)())failBlock {
    __block NSDictionary *dic = [NSDictionary dictionary];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (successBlock) {
                successBlock(dic);
            }
        });
    }] resume];
    
}

@end

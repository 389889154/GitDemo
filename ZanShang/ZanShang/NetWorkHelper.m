//
//  NetWorkHelper.m
//  ZanShang
//
//  Created by wey on 16/1/14.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "NetWorkHelper.h"

@implementation NetWorkHelper

+ (instancetype)shareInstance {

    static NetWorkHelper *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]initWithBaseURL:[NSURL URLWithString:@""]];
        NSSet *set =  instance.responseSerializer.acceptableContentTypes;
        NSMutableSet *setM = set.mutableCopy;
        [setM addObject:@"text/html"];
        instance.responseSerializer.acceptableContentTypes = setM.copy;
    });
    return instance;
}

@end

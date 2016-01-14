//
//  CommonCellModel.m
//  ALiPay
//
//  Created by wey on 16/1/12.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "CommonCellModel.h"

@implementation CommonCellModel

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName targetClass:(Class)targetClass {

    if (self = [super init]) {
        self.title = title;
        self.imageName = imageName;
        self.targetClass = targetClass;
    }
    return self;
}

@end

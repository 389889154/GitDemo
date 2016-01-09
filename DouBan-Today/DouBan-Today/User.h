//
//  User.h
//  DouBan-Today
//
//  Created by lanou3g on 16/1/9.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString * username;
@property (nonatomic, copy) NSString * password;
@property (nonatomic, copy) NSString * phoneNum;
@property (nonatomic, copy) NSString * email;

+ (instancetype) userWithDic: (NSDictionary *)dic;

@end

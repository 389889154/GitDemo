//
//  NetWorkHelper.h
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkHelper : NSObject


+ (instancetype) shareInstance;

+ (void) createHudWith:(NSString *)title;

- (id) createHud;

- (void) getDataWithUrlString:(NSString *)urlStr success:(void(^)(NSDictionary * dic))successBlock fail:(void(^)())failBlock;
@end

//
//  DataHelper.h
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FavouriteModel,User;
@interface DataHelper : NSObject


+ (instancetype) shareInstance;

- (void) addFavouriteRecord : (FavouriteModel *)model;
- (void) deleteFavouriteRecord :(FavouriteModel *)model;
- (BOOL) queryFavouriteWithName : (NSString *)name;


- (void) addUser : (User *)model;
- (BOOL) hasExist : (NSString *) username;

@end


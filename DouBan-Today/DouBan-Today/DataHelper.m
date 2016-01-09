//
//  DataHelper.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "DataHelper.h"
#import "User.h"
#import "FavouriteModel.h"
#import <sqlite3.h>
#import "FMDB.h"

static FMDatabaseQueue *_queue;

@implementation DataHelper

+ (instancetype) shareInstance {
    
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

- (void)setDB {
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    _queue = [[FMDatabaseQueue alloc]initWithPath:[docPath stringByAppendingPathComponent:@"DB.sqlite"]];
    [_queue inDatabase:^(FMDatabase *db) {
       BOOL result = [db executeUpdate:@"CREATE TABLE if not exists t_user (uid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, username TEXT, password TEXT, telNum TEXT, email TEXT)"];
        if (result) {
            NSLog(@"success");
        } else {
            NSLog(@"error");
        }
    }];
    NSLog(@"%@",NSHomeDirectory());
}

- (void) addFavouriteRecord : (FavouriteModel *)model {
    
}
- (void) deleteFavouriteRecord :(FavouriteModel *)model {}
- (BOOL) queryFavouriteWithName : (NSString *)name {
    
    return YES;
}


- (void) addUser : (User *)model {
    [_queue inDatabase:^(FMDatabase *db) {
        
        [db executeUpdate:@""];
    }];
    
}
- (BOOL) hasExist : (NSString *) username{
    
    return YES;
}

@end

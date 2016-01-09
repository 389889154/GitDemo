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
        [self setDB];
    });
    return instance;
}

+ (void)setDB {
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    _queue = [[FMDatabaseQueue alloc]initWithPath:[docPath stringByAppendingPathComponent:@"DB.sqlite"]];
    [_queue inDatabase:^(FMDatabase *db) {
       BOOL result = [db executeUpdate:@"CREATE TABLE if not exists t_user (uid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, username TEXT, password TEXT, telNum TEXT, email TEXT)"];
        if (!result) {
        
            NSLog(@"creat fail");
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


- (void) addUser: (User *)model {
    [_queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"insert into t_user (username,password,telNum,email) values (?,?,?,?)",model.username,model.password,model.phoneNum,model.email];
    }];
    
}
- (BOOL) hasExist : (NSString *) username :(NSString *)pwd{
   __block BOOL ishas = NO;
        [_queue inDatabase:^(FMDatabase *db) {
         FMResultSet *result = [db executeQuery:@"select * from t_user where username = ?",username];
            while (result.next) {
                if ([pwd isEqualToString:[result stringForColumn:@"password"]]) {
                    ishas = YES;
                }
            }
        }];
    return ishas;
}


+ (BOOL) isOnline  {
    return [[[NSUserDefaults standardUserDefaults] objectForKey:kUserStatus] isEqualToString:@"online"];
}
@end

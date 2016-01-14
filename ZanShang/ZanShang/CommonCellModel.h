//
//  CommonCellModel.h
//  ALiPay
//
//  Created by wey on 16/1/12.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonCellModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) Class targetClass;

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName targetClass:(Class)targetClass;

@end

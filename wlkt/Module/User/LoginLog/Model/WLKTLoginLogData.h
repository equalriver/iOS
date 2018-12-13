//
//  WLKTLoginLogData.h
//  wlkt
//
//  Created by 尹平江 on 17/3/30.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTLoginLogData : NSObject
/**
 *  登录IP
 */
@property (copy, nonatomic) NSString *loginip;
/**
 *  登录时间
 */
@property (copy, nonatomic) NSString *logintime;
/**
 *  登录位置
 */
@property (copy, nonatomic) NSString *location;
/**
 *  登录方式/设备
 */
@property (copy, nonatomic) NSString *login_way;
/**
 *  登录日期
 */
@property (copy, nonatomic) NSString *day;

@end

//
//  WLKTCDSchinfo.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/29.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTCDSchinfo : NSObject
///学校名称
@property (copy, nonatomic) NSString *schoolname;
@property (copy, nonatomic) NSString *suid;
///课程数量
@property (copy, nonatomic) NSString *coursenum;
///活动数量
@property (copy, nonatomic) NSString *actnum;
///关注人数
@property (copy, nonatomic) NSString *shoucangnum;
///评分值
@property (copy, nonatomic) NSString *pingfen;
@end

//
//  WLKTSaleCourseData.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTSaleCourseData : NSObject
///课程id
@property (copy, nonatomic) NSString *cid;
///课程名称
@property (copy, nonatomic) NSString *coursename;
///课程所属学校
@property (copy, nonatomic) NSString *suid;
///一对一价格
@property (copy, nonatomic) NSString *price;
///班课价格
@property (copy, nonatomic) NSString *bkprice;
///1是一口价,2是课时价
@property (copy, nonatomic) NSString *onecut;
///图片
@property (copy, nonatomic) NSString *img;
///拼接的课时
@property (copy, nonatomic) NSString *showkeshi;
///显示 课时价/一口价
@property (copy, nonatomic) NSString *target;
///显示的价格
@property (copy, nonatomic) NSString *showprice;
///优惠的内容,一维数组
@property (copy, nonatomic) NSArray *youhui;
///如果有折扣优惠,该价格显示的原价
@property (copy, nonatomic) NSString *oldprice;
///折扣
@property (copy, nonatomic) NSString *discount;
@end

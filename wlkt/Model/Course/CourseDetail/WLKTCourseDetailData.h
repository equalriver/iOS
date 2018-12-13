//
//  WLKTCourseDetailData.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTCourse.h"
#import "WLKTCourseActivityData.h"
#import "WLKTCourseCouponData.h"
#import "WLKTAddress.h"
#import "WLKTCoursePriceSystemData.h"
#import "WLKTCourseOnepriceData.h"
#import "WLKTCoursePriceListData.h"
#import "WLKTCourseDetailNew.h"
@interface WLKTCourseDetailData : NSObject
/////报名须知(app如果没设计,可以先不显示)
//@property (copy, nonatomic) NSString *apply_notes;
/////适用学员(app如果没设计,可以先不显示)
//@property (copy, nonatomic) NSString *suitable;
/////教学目标(app如果没设计,可以先不显示)
//@property (copy, nonatomic) NSString *teach_target;
/////教学内容(app如果没设计,可以先不显示)
//@property (copy, nonatomic) NSString *teach_content;
/////课程特色(app如果没设计,可以先不显示)
//@property (copy, nonatomic) NSString *course_feature;

///校区
@property (copy, nonatomic) NSArray<WLKTAddress *> *point;
///默认单个属性最低的价格
@property (strong, nonatomic) WLKTCourseOnepriceData *oneprice;
///课程属性选择
@property (strong, nonatomic) WLKTCoursePriceSystemData *price_system;
///课程促销列表
@property (copy, nonatomic) NSArray<WLKTCourseActivityData *> *course_activity;
///学校优惠券列表(数组中的id字段用于领取优惠券使用)
@property (copy, nonatomic) NSArray<WLKTCourseCouponData *> *course_coupon;
///课程详情
@property (strong, nonatomic) WLKTCourse *list;
///课程详情new
@property (strong, nonatomic) WLKTCourseDetailNew *param;
///价格数组
@property (copy, nonatomic) NSArray<WLKTCoursePriceListData *> *pricelist;

@end

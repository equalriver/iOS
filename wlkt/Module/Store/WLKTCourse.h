//
//  WLKTCourse.h
//  wlkt
//
//  Created by slovelys on 17/3/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCoursePriceRange.h"
#import "WLKTAddress.h"
#import "WLKTHomepageYouhuiItem.h"

typedef NS_ENUM(NSUInteger, WLKTBannerListTye) {
    WLKTBannerListTyeNormal,
    WLKTBannerListTyeSchool,
    WLKTBannerListTyeCourseDetail,
    WLKTBannerListTyeActivityDetail,
    WLKTBannerListTyeURL,
};

@interface WLKTCourse : NSObject
///查看数
@property (nonatomic) NSInteger hits;
///总分
@property (copy, nonatomic) NSString *score;
///效果分
@property (copy, nonatomic) NSString *effect;
///师资分
@property (copy, nonatomic) NSString *teach_score;
///环境分
@property (copy, nonatomic) NSString *environment;
///评论数
@property (nonatomic) NSInteger comment_num;
///购买数
@property (nonatomic) NSInteger buynum;
///适用学员
@property (copy, nonatomic) NSString *suitable;
///教学目标
@property (copy, nonatomic) NSString *teach_target;
///教学安排
@property (copy, nonatomic) NSString *teach_content;
///课程特色
@property (copy, nonatomic) NSString *course_feature;
///适用年龄
@property (copy, nonatomic) NSString *age_area;
///收藏状态 1已收藏  0未收藏
@property (copy, nonatomic) NSString *shoucang;
@property (copy, nonatomic) NSString *zk_msg;
@property (copy, nonatomic) NSString *bkprice;
@property (copy, nonatomic) NSString *coursename;
@property (copy, nonatomic) NSString *uid;
@property (copy, nonatomic) NSString *img;
@property (copy, nonatomic) NSString *price;
@property (copy, nonatomic) NSString *showkeshi;
@property (copy, nonatomic) NSString *showprice;
@property (copy, nonatomic) NSString *shareurl;
@property (copy, nonatomic) NSString *shareappurl;
@property (copy, nonatomic) NSString *oldprice;
///课程类型
@property (copy, nonatomic) NSString *target;
@property (copy, nonatomic) NSString *coursetype;
@property (copy, nonatomic) NSArray *youhui;
@property (copy, nonatomic) NSArray<WLKTHomepageYouhuiItem *> *yharr;
///学校id
@property (copy, nonatomic) NSString *suid;
///学校电话
@property (copy, nonatomic) NSString *schoolphone;
///咨询电话
@property (copy, nonatomic) NSString *phone;
// 更多课程
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *urlmore;

@property (copy, nonatomic) NSString *status;
@property (copy, nonatomic) NSString *schoolname;
/// courseTag
@property (copy, nonatomic) NSString *pattern;
@property (copy, nonatomic) NSString *introduce;
/// 上课地点
@property (copy, nonatomic) NSArray<WLKTAddress *> *point;
@property (copy, nonatomic) NSString *address;
/// 价格区间
@property (copy, nonatomic) NSMutableArray *area;
/**
 *  能否选课时(1为不能选，2为可选)
 */
@property (copy, nonatomic) NSString *onecut;
///分校tag 无值没有分校
@property (copy, nonatomic) NSString *xiaoqu;
///距离
@property (copy, nonatomic) NSString *distance;
//活动banner
@property (copy, nonatomic) NSString *url;
@property (assign, nonatomic) WLKTBannerListTye type;
///客服url
@property (copy, nonatomic) NSString *kftokenjs;

//活动相关
@property (copy, nonatomic) NSString *asctime;
@property (copy, nonatomic) NSString *shoucangnum;
@property (copy, nonatomic) NSString *verify;
@property (copy, nonatomic) NSString *actstatus;
@property (copy, nonatomic) NSString *subtitle;

//拼购
///0无拼购  1有拼购
@property (copy, nonatomic) NSString *have_pg;
///0预热   1已开始
@property (copy, nonatomic) NSString *pg_status;
///时间戳
@property (copy, nonatomic) NSString *pg_microtime;
///0未关注  1已关注
@property (copy, nonatomic) NSString *pg_forcus;

@end



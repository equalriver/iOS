//
//  WLKTCDCourseinfo.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/29.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTCDCourseinfo : NSObject
@property (copy, nonatomic) NSString *suid;
@property (copy, nonatomic) NSString *cid;
///课程名称
@property (copy, nonatomic) NSString *coursename;
///分享地址
@property (copy, nonatomic) NSString *shareappurl;
@property (copy, nonatomic) NSString *img;
///客服地址
@property (copy, nonatomic) NSString *kftokenjs;
///是否有拼购,1是,0否
@property (copy, nonatomic) NSString *have_pg;
///拼购状态,0是未开始(预热),1是已经开始(拼购)
@property (copy, nonatomic) NSString *pg_status;
///拼购未开始的倒计时或者结束倒计时的毫秒数
@property (copy, nonatomic) NSString *pg_microtime;
///拼购的价格
@property (copy, nonatomic) NSString *pg_showprice;
///不参与拼购的价格
@property (copy, nonatomic) NSString *pg_oldprice;
///拼购人数
@property (copy, nonatomic) NSString *pg_num;
///课程关注(收藏)状态,0未收藏,1已收藏
@property (copy, nonatomic) NSString *shoucang;
///单独购买显示的最低价格
@property (copy, nonatomic) NSString *showprice;
///单独购买显示的原价格
@property (copy, nonatomic) NSString *oldprice;

@end

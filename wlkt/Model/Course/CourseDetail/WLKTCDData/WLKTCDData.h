//
//  WLKTCDData.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/29.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTCDCourseinfo.h"
#import "WLKTCDQueslist.h"
#import "WLKTCDCommentlist.h"
#import "WLKTCDSchinfo.h"
#import "WLKTCDOneprice.h"
#import "WLKTCDDataPoint.h"
#import "WLKTCDDataAboutlist.h"
#import "WLKTCDDataPriceSystem.h"
#import "WLKTCDDataYouhui.h"
#import "WLKTCDDataCoupon.h"

@interface CDDataTopImage: NSObject
///图片地址
@property (copy, nonatomic) NSString *img;
///类型(video=视频,image=图片)
@property (copy, nonatomic) NSString *type;
///视频地址,当type=video时才有值
@property (copy, nonatomic) NSString *videourl;
@end

@interface CDDataLicense: NSObject
///证件名称
@property (copy, nonatomic) NSString *title;
///证件说明
@property (copy, nonatomic) NSString *text;
///颁发部门
@property (copy, nonatomic) NSString *dep;
///等于0未取得相关证件
@property (copy, nonatomic) NSString *order;
@end

@interface CDDataTlist: NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *headimg;
@property (copy, nonatomic) NSString *tags;
///有值=有教师资格证,null是没有
@property (copy, nonatomic) NSString *jszgz;
@end

/******************************************/
@interface WLKTCDData : NSObject
@property (copy, nonatomic) NSArray<CDDataTopImage *> *topimage;
@property (strong, nonatomic) WLKTCDCourseinfo *courseinfo;
@property (copy, nonatomic) NSArray<WLKTCDDataYouhui *> *youhui;
@property (copy, nonatomic) NSArray<WLKTCDDataCoupon *> *yhq;
@property (copy, nonatomic) NSArray<CDDataLicense *> *license;
@property (copy, nonatomic) NSArray<CDDataTlist *> *tlist;
@property (copy, nonatomic) NSArray<WLKTCDDataPoint *> *point;
@property (strong, nonatomic) WLKTCDQueslist *queslist;
@property (strong, nonatomic) WLKTCDCommentlist *commentlist;
@property (strong, nonatomic) WLKTCDSchinfo *schinfo;
@property (copy, nonatomic) NSArray<WLKTCDDataAboutlist *> *aboutlist;
@property (strong, nonatomic) WLKTCDOneprice *oneprice;
@property (copy, nonatomic) NSArray<WLKTCDDataPriceSystem *> *price_system;
@property (copy, nonatomic) NSArray<WLKTCDDataPriceSystem *> *pg_price_system;
@end

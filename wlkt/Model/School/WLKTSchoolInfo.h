//
//  WLKTSchoolInfo.h
//  wlkt
//
//  Created by slovelys on 17/4/14.
//  Copyright © 2017年 neimbo. All rights reserved.
//


#import "WLKTSchoolInfoPapers.h"

@interface WLKTSchoolInfo : NSObject
@property (copy, nonatomic) NSString *logo;
@property (copy, nonatomic) NSString *schoolname;
@property (copy, nonatomic) NSString *introduce;
@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *suid;
@property (copy, nonatomic) NSString *hits;
@property (copy, nonatomic) NSString *verify;
@property (copy, nonatomic) NSString *road;
@property (copy, nonatomic) NSString *stype;
@property (copy, nonatomic) NSString *sort;
@property (copy, nonatomic) NSString *area;
@property (copy, nonatomic) NSString *email;
@property (copy, nonatomic) NSString *groupname;
@property (copy, nonatomic) NSString *views;
@property (copy, nonatomic) NSString *shareappurl;
@property (copy, nonatomic) NSString *callminutes;
@property (copy, nonatomic) NSString *status;
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *isshoucang;
@property (copy, nonatomic) NSString *province;
@property (copy, nonatomic) NSString *shoucangnum;
@property (copy, nonatomic) NSString *introimg;
@property (copy, nonatomic) NSString *stunum;
@property (copy, nonatomic) NSString *gsort;
@property (copy, nonatomic) NSString *qrcodeimg;
@property (copy, nonatomic) NSString *stime;
@property (copy, nonatomic) NSString *showpic;
///营业时间
@property (copy, nonatomic) NSString *businesshours;
@property (copy, nonatomic) NSArray<WLKTSchoolInfoPapers *> *papers;
///客服url
@property (copy, nonatomic) NSString *kftokenjs;
@end


//
//  WLKTHomepage.h
//  wlkt
//
//  Created by slovelys on 17/3/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourse.h"
#import "WLKTHeaderButtons.h"
#import "WLKTSchoolVRList.h"
#import "WLKTNewsNormalNewsList.h"
#import "WLKTHomepageInterestItem.h"
@class WLKTActivity;

@interface WLKTHomepage : NSObject

@property (copy, nonatomic) NSArray<WLKTCourse *> *banner;
@property (copy, nonatomic) NSArray<WLKTCourse *> *bannerlist;
@property (copy, nonatomic) NSArray<WLKTCourse *> *hotlist;
@property (copy, nonatomic) NSArray<WLKTCourse *> *school;
@property (copy, nonatomic) NSArray<WLKTCourse *> *arts;
@property (copy, nonatomic) NSArray<WLKTCourse *> *language;
@property (copy, nonatomic) NSArray<WLKTCourse *> *like;
@property (copy, nonatomic) NSArray<WLKTCourse *> *hotsearch;
@property (copy, nonatomic) NSArray<WLKTHeaderButtons *> *topinfo;
@property (copy, nonatomic) NSArray *url;
@property (copy, nonatomic) NSString *ids;
@property (copy, nonatomic) NSString *msgnum;
@property (copy, nonatomic) NSArray <WLKTActivity *> *actlist;


//index2
@property (copy, nonatomic) NSArray<WLKTCourse *> *newcourselist;
@property (copy, nonatomic) NSArray<WLKTHomepageInterestItem *> *xq;
@property (copy, nonatomic) NSArray<WLKTCourse *> *yhlist;
@property (copy, nonatomic) NSArray<WLKTSchoolVRList *> *vrlist;
@property (copy, nonatomic) NSArray<WLKTNewsNormalNewsList *> *newslist;
@property (nonatomic) BOOL islogin;
@end

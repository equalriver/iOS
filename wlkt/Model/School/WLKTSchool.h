//
//  WLKTSchool.h
//  wlkt
//
//  Created by slovelys on 17/4/14.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolInfo.h"
#import "WLKTAddress.h"
#import "WLKTCourse.h"
#import "WLKTSchoolNewsList.h"
#import "WLKTActivity.h"
#import "WLKTSchoolPhotoList.h"
#import "WLKTSchoolStudentList.h"
#import "WLKTCourseDetailNewAbout_list.h"
#import "WLKTSchoolVideoList.h"
#import "WLKTCourseDetailNewTeacher.h"
#import "WLKTSchoolVRList.h"

@interface WLKTSchool : NSObject <YYModel>
@property (strong, nonatomic) WLKTSchoolInfo *schoolinfo;
@property (copy, nonatomic) NSArray<WLKTAddress *> *schpoint;
@property (copy, nonatomic) NSArray<WLKTSchoolNewsList *> *newslist;
///活动
@property (copy, nonatomic) NSArray<WLKTActivity *> *actlist;
@property (copy, nonatomic) NSArray<WLKTCourseDetailNewTeacher *> *teachlist;
@property (copy, nonatomic) NSArray<WLKTSchoolPhotoList *> *photolist;
///学生
@property (copy, nonatomic) NSArray<WLKTSchoolStudentList *> *starstulist;
@property (copy, nonatomic) NSArray<WLKTCourseDetailNewAbout_list *> *courselist;
@property (copy, nonatomic) NSArray<WLKTSchoolVideoList *> *videolist;

@property (copy, nonatomic) NSArray<WLKTSchoolVRList *> *vrlist;
@end

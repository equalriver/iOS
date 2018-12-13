//
//  WLKTCourseDetailNew.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/6.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTCourseDetailNewPhoto.h"
#import "WLKTCourseDetailNewTeacher.h"
#import "WLKTCourseDetailNewAbout_list.h"
#import "WLKTCourseDetailNewHot_school.h"
#import "WLKTCourseDetailNewCourse_comment.h"
#import "WLKTCourseDetailNewCourse_ques.h"
#import "WLKTCourseDetailNewCourse_complaint.h"
#import "WLKTSchoolVRList.h"

@interface WLKTCourseDetailNew : NSObject
///相册
@property (copy, nonatomic) NSArray<WLKTCourseDetailNewPhoto *> *photo;
///老师
@property (copy, nonatomic) NSArray<WLKTCourseDetailNewTeacher *> *teacher;
///相关课程
@property (copy, nonatomic) NSArray<WLKTCourseDetailNewAbout_list *> *about_list;
///相关学校
@property (copy, nonatomic) NSArray<WLKTCourseDetailNewHot_school *> *hot_school;
///课程评论
@property (strong, nonatomic) WLKTCourseDetailNewCourse_comment *course_comment;
///课程问答
@property (strong, nonatomic) WLKTCourseDetailNewCourse_ques *course_ques;
///课程投诉
@property (strong, nonatomic) WLKTCourseDetailNewCourse_complaint *course_complaint;
@property (copy, nonatomic) NSArray<WLKTSchoolVRList *> *vrlist;
@end

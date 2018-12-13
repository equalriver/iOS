//
//  WLKTActivityParamData.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTActivityCommentData.h"
#import "WLKTActivityDetail_ques.h"
#import "WLKTActivityDetailComplaint.h"
#import "WLKTActivityDetailSchoolList.h"
#import "WLKTCourseDetailNewPhoto.h"
#import "WLKTCourseDetailNewTeacher.h"
#import "WLKTSchoolVRList.h"

@interface WLKTActivityParamData : NSObject
@property (strong, nonatomic) WLKTActivityCommentData *act_comment;
@property (strong, nonatomic) WLKTActivityDetail_ques *act_ques;
@property (strong, nonatomic) WLKTActivityDetailComplaint *act_complaint;
@property (copy, nonatomic) NSArray<WLKTActivityDetailSchoolList *> *hot_school;
@property (copy, nonatomic) NSArray<WLKTCourseDetailNewPhoto *> *photo;
@property (copy, nonatomic) NSArray<WLKTCourseDetailNewTeacher *> *teacher;
@property (copy, nonatomic) NSArray<WLKTSchoolVRList *> *vrlist;
@end




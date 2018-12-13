//
//  WLKTCourseDetailNewCourse_complaint.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/6.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTCourseDetailNewCourse_complaintList.h"

@interface WLKTCourseDetailNewCourse_complaint : NSObject
///投诉个数
@property (nonatomic) NSInteger total;
@property (copy, nonatomic) NSArray<WLKTCourseDetailNewCourse_complaintList *> *complaint;

@end

//
//  WLKTCourseDetailNewCourse_ques.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/6.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTCourseDetailNewCourse_quesList.h"

@interface WLKTCourseDetailNewCourse_ques : NSObject
///问答个数
@property (nonatomic) NSInteger total;
@property (copy, nonatomic) NSArray<WLKTCourseDetailNewCourse_quesList *> *ques;

@end

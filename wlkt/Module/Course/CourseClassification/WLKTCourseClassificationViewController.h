//
//  WLKTCourseClassificationViewController.h
//  wlkt
//
//  Created by slovelys on 17/3/30.
//  Copyright © 2017年 neimbo. All rights reserved.
//

@class WLKTCourse;

@interface WLKTCourseClassificationViewController : UITableViewController

- (instancetype)initWithClassificationStr:(NSString *)str;
- (instancetype)initWithCourseArray:(NSArray <WLKTCourse *> *)array schoolId:(NSString *)schoolid;

@end

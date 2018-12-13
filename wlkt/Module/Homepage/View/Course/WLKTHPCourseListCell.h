//
//  WLKTHPCourseListCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/2.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCourse.h"

@interface WLKTHPCourseListCell : UITableViewCell
- (void)setCellData:(WLKTCourse *)data date:(NSTimeInterval)date;
@end

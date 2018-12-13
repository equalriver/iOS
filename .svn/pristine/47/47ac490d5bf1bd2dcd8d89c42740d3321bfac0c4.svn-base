//
//  WLKTActivityDetailTeacherCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCourseDetailNewTeacher.h"

@protocol ActivityDetailTeacherDelegate <NSObject>
- (void)didSelectedTeacherItem:(NSIndexPath *)indexPath;
@end

@interface WLKTActivityDetailTeacherCell : UITableViewCell
- (instancetype)initWithTeacherArray:(NSArray<WLKTCourseDetailNewTeacher *> *)array;
@property (weak, nonatomic) id<ActivityDetailTeacherDelegate> delegate;
@end

//
//  WLKTCourseCell.h
//  wlkt
//
//  Created by slovelys on 17/3/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "XLTBaseTableViewCell.h"

@class WLKTCourseCell;
@class WLKTCourse;

@protocol WLKTCourseCellDelegate <NSObject>

@optional
- (void)courseCell:(WLKTCourseCell *)cell didSelectItem:(WLKTCourse *)course atIndexPath:(NSIndexPath *)indexPath;

@end

@interface WLKTCourseCell : XLTBaseTableViewCell

@property (strong, nonatomic) NSMutableArray *dataSource;
@property (weak, nonatomic) id<WLKTCourseCellDelegate> delegate;

@end

//
//  WLKTSchoolCourseCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCourseDetailNewAbout_list.h"

@protocol WLKTSchoolCourseDelegate <NSObject>
- (void)didSelectedOtherCourseCollectionViewItem:(NSIndexPath *)indexPath;
@end

@interface WLKTSchoolCourseCell : UITableViewCell
@property (weak, nonatomic) id<WLKTSchoolCourseDelegate> delegate;
- (instancetype)initWithData:(NSArray<WLKTCourseDetailNewAbout_list *> *)array;
@end

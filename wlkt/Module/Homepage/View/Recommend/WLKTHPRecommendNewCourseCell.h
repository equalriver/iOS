//
//  WLKTHPRecommendNewCourseCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/24.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCourse.h"

@protocol RecommendNewCourseDelegate<NSObject>
- (void)didSelectedRecommendNewCourseItem:(NSInteger)index;
@end

@interface WLKTHPRecommendNewCourseCell : UITableViewCell
@property (weak, nonatomic) id<RecommendNewCourseDelegate> delegate;
- (instancetype)initWithCourseArray:(NSArray *)array;
@end

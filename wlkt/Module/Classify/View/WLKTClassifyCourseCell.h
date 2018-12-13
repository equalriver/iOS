//
//  WLKTClassifyCourseCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/4.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCourse.h"

typedef enum : NSUInteger {
    ClassifyCoursePhoneTypeZiXun,
    ClassifyCoursePhoneTypeOnline,
} ClassifyCoursePhoneType;

@protocol ClassifyCoursePhoneDelegate <NSObject>
- (void)didSelectedClassifyCoursePhone:(ClassifyCoursePhoneType)type index:(NSInteger)index;
@end

@interface WLKTClassifyCourseCell : UITableViewCell
@property (weak, nonatomic) id<ClassifyCoursePhoneDelegate> delegate;
- (void)setCellData:(WLKTCourse *)data index:(NSInteger)index;
@property (nonatomic, assign) CLLocationCoordinate2D currentCoordinate;
@end

//
//  WLKTCourseDetailAppointment.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/10/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CourseDetailAppointmentDelegate <NSObject>
- (void)CourseDetailAppointmentConfirmPhone:(NSString *)phone detail:(NSString *)detail success:(void(^)(void))success;
@end

@interface WLKTCourseDetailAppointment : UIView
@property (weak, nonatomic) id<CourseDetailAppointmentDelegate> delegate;
@end

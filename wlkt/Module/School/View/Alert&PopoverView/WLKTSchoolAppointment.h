//
//  WLKTSchoolAppointment.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SchoolAppointmentDelegate <NSObject>
- (void)schoolAppointmentConfirmPhone:(NSString *)phone detail:(NSString *)detail success:(void(^)(void))success;
@end

@interface WLKTSchoolAppointment : UIView
@property (weak, nonatomic) id<SchoolAppointmentDelegate> delegate;
@end

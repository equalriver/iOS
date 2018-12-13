//
//  WLKTCourseDetailMapVC.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLKTCourseDetailMapVC : UIViewController
- (instancetype)initWithAddress:(NSString *)address schoolName:(NSString *)schoolName;

+(void)getCoordinateByAddress:(NSString *)address completion:(void(^)(CLLocationCoordinate2D coordinate, NSError *error))completion;
+(void)getAddressByLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude completion:(void(^)(NSString *address, NSError *error))completion;


@end

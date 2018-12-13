//
//  WLKTCoursePageController.h
//  wlkt
//
//  Created by slovelys on 17/4/5.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <WMPageController.h>

@interface WLKTCoursePageController : WMPageController

- (instancetype)initWithCourseClassifition:(NSString *)classifition;

@property (copy, nonatomic) NSString *selectString;

@end

//
//  WLKTCourseClassificationApi.h
//  wlkt
//
//  Created by slovelys on 17/3/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTCourseClassificationApi : YTKRequest

- (instancetype)initWithCourseClassification:(NSString *)classification page:(int)page;

@end

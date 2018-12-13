//
//  WLKTCourseCancelCollectApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseCancelCollectApi.h"

@interface WLKTCourseCancelCollectApi ()
@property (copy, nonatomic) NSString *courseId;

@end
@implementation WLKTCourseCancelCollectApi
- (instancetype)initWithCourseId:(NSString *)courseId {
    WLKT_INIT(
              _courseId = [courseId copy];
              )
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (NSString *)requestUrl {
    return  @"shoucang/deletecourse/id";
}

- (id)requestArgument {
    return @{
             @"id" : _courseId
             };
}

@end

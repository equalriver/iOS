//
//  WLKTCourseCollectApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseCollectApi.h"

@interface WLKTCourseCollectApi ()
@property (copy, nonatomic) NSString *courseId;

@end
@implementation WLKTCourseCollectApi
- (instancetype)initWithCourseId:(NSString *)courseId {
    WLKT_INIT(
              _courseId = [courseId copy];
              )
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (NSString *)requestUrl {
    return  @"shoucang/addcourse/id";
}

- (id)requestArgument {
    return @{
             @"id" : _courseId
             };
}
@end

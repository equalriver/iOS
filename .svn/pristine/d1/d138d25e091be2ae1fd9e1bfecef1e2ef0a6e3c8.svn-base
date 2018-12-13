//
//  WLKTMoreCourseApi.m
//  wlkt
//
//  Created by slovelys on 17/4/5.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTMoreCourseApi.h"

@interface WLKTMoreCourseApi ()

@property (copy, nonatomic) NSString *courseUrl;

@end

@implementation WLKTMoreCourseApi

- (instancetype)initWithCourseUrl:(NSString *)courseUrl {
    WLKT_INIT(
              _courseUrl = [courseUrl copy];
    )
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (NSString *)requestUrl {
    return  @"course/index";
}

- (id)requestArgument {
    return @{
             @"keyword" : [_courseUrl isEqualToString:@"热门课程"] ? @"0" : _courseUrl
             };
}

@end

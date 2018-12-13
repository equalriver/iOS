//
//  WLKTSchoolCourseLoadMoreApi.m
//  wlkt
//
//  Created by slovelys on 2017/7/4.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolCourseLoadMoreApi.h"

@interface WLKTSchoolCourseLoadMoreApi ()

@property (copy, nonatomic) NSString *schoolid;
@property (assign, nonatomic) int page;

@end

@implementation WLKTSchoolCourseLoadMoreApi

- (instancetype)initWithSchoolId:(NSString *)schoolid page:(int)page {
    WLKT_INIT(
              _schoolid = [schoolid copy];
              _page = page;
    )
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (NSString *)requestUrl {
    return  @"/school/course/";
}

- (id)requestArgument {
    return @{
             @"id" : _schoolid,
             @"page" : @(_page)
             };
}

@end

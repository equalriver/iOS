//
//  WLKTSchoolCourseApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolCourseApi.h"

@interface WLKTSchoolCourseApi ()
@property (copy, nonatomic) NSString *suid;
@property (assign) NSInteger page;
@end

@implementation WLKTSchoolCourseApi
- (instancetype)initWithSchoolId:(NSString *)suid page:(NSInteger)page;
{
    self = [super init];
    if (self) {
        _suid = suid;
        _page = page;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"sch/course";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id": _suid,
             @"page": @(_page)
             };
}
@end

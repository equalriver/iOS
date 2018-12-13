//
//  WLKTCourseDetailListenApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/8.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailListenApi.h"

@interface WLKTCourseDetailListenApi ()
@property (copy, nonatomic) NSString *suid;
@property (copy, nonatomic) NSString *contact;
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *courseId;
@end

@implementation WLKTCourseDetailListenApi
- (instancetype)initWithSchoolId:(NSString *)suid phone:(NSString *)phone content:(NSString *)content courseId:(NSString *)courseId
{
    self = [super init];
    if (self) {
        _suid = suid;
        _contact = phone;
        _content = content;
        _courseId = courseId ? courseId : @"";
    }
    return self;
}

- (NSString *)requestUrl {
    return @"listen/slisten";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"suid" : _suid,
             @"contact": _contact,
             @"content": _content,
             @"cid": _courseId
             };
}

@end

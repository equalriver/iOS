//
//  WLKTPayCourseApi.m
//  wlkt
//
//  Created by 尹平江 on 17/3/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//
//
#import "WLKTPayCourseApi.h"
#import "WLKTLogin.h"

@interface WLKTPayCourseApi ()
@property (assign, nonatomic) int page;
@end

@implementation WLKTPayCourseApi

- (instancetype)initWithPage:(int)page
{
    self = [super init];
    if (self) {
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return [NSString stringWithFormat:@"user/myorder"];
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}
- (id)requestArgument{
    return @{
             @"page" : @(_page),
             @"app_userinfo" : TheCurUser.token
             };
}

@end

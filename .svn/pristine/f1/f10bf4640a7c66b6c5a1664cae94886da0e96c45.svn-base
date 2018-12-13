//
//  WLKTUnPayCourseApi.m
//  wlkt
//
//  Created by 尹平江 on 17/3/30.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUnPayCourseApi.h"
#import "WLKTLogin.h"

@interface WLKTUnPayCourseApi ()
@property (assign, nonatomic) int page;
@end

@implementation WLKTUnPayCourseApi


- (instancetype)initWithPage:(int)page
{
    self = [super init];
    if (self) {
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return [NSString stringWithFormat:@"user/topay"];
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

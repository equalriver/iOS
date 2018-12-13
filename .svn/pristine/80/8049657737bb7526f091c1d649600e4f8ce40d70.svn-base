//
//  WLKTActiveCollectApi.m
//  wlkt
//
//  Created by 尹平江 on 2017/7/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActiveCollectApi.h"
#import "WLKTLogin.h"

@interface WLKTActiveCollectApi ()
@property (assign, nonatomic) int page;
@end

@implementation WLKTActiveCollectApi

- (NSString *)requestUrl {
    return @"shoucang/index";
}

- (instancetype)initWithPage:(int)page
{
    self = [super init];
    if (self) {
        _page = page;
    }
    return self;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument{
    return @{
             //@"page" : @(_page),
             @"app_userinfo" : TheCurUser.token
             };
}

@end

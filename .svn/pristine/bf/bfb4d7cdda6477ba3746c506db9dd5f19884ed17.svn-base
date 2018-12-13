//
//  WLKTSaleCourseApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSaleCourseApi.h"
#import "WLKTLogin.h"

@interface WLKTSaleCourseApi ()
@property (nonatomic) NSInteger page;
@end

@implementation WLKTSaleCourseApi
- (instancetype)initWithPage:(NSInteger)page
{
    self = [super init];
    if (self) {
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"clist/discount";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"app_userinfo" : TheCurUser.token ?: @"",
             @"page": @(_page)
             };
}
@end

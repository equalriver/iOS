//
//  WLKTMyCourseListApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTMyCourseCollectListApi.h"
#import "WLKTLogin.h"

@interface WLKTMyCourseCollectListApi ()
@property (assign, nonatomic) int page;
@end
@implementation WLKTMyCourseCollectListApi
- (instancetype)initWithPage:(int)page
{
    self = [super init];
    if (self) {
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"shoucang/clist";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"page" : @(_page)
             };
}

@end

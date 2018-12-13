//
//  WLKTCourseDetailComplaintListApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/8.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailComplaintListApi.h"

@interface WLKTCourseDetailComplaintListApi ()
@property (copy, nonatomic) NSString *cid;
@property (nonatomic) NSInteger page;
@end

@implementation WLKTCourseDetailComplaintListApi
- (instancetype)initWithCourseId:(NSString *)cid page:(NSInteger)page
{
    self = [super init];
    if (self) {
        _cid = cid;
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"tousu/index";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id" : _cid,
             @"page": @(_page)
             };
}
@end

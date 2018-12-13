//
//  WLKTCourseDetailCommentListApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/8.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailCommentListApi.h"

@interface WLKTCourseDetailCommentListApi ()
@property (copy, nonatomic) NSString *cid;
@property (nonatomic) NSInteger star;
@property (nonatomic) NSInteger page;
@end

@implementation WLKTCourseDetailCommentListApi
- (instancetype)initWithCourseId:(NSString *)cid star:(NSInteger)star page:(NSInteger)page
{
    self = [super init];
    if (self) {
        _cid = cid;
        _star = star;
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"comlist/course";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id" : _cid,
             @"star": @(_star),
             @"page": @(_page)
             };
}

@end

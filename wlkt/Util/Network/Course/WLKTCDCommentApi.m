//
//  WLKTCDCommentApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/9.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDCommentApi.h"

@interface WLKTCDCommentApi ()
@property (copy, nonatomic) NSString *cid;
@property (nonatomic) NSInteger page;
@end

@implementation WLKTCDCommentApi
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
    return @"course3/commentlist";
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

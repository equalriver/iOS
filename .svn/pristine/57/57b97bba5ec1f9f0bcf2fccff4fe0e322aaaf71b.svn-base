//
//  WLKTSchoolCommentLikeApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/1.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolCommentLikeApi.h"

@interface WLKTSchoolCommentLikeApi ()
@property (copy, nonatomic) NSString *cid;
@end

@implementation WLKTSchoolCommentLikeApi
- (instancetype)initWithCommentId:(NSString *)cid
{
    self = [super init];
    if (self) {
        _cid = cid;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"good/comment";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id": _cid
             };
}
@end

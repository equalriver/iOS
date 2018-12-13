//
//  WLKTSchoolGoCommentApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolGoCommentApi.h"

@interface WLKTSchoolGoCommentApi ()
@property (copy, nonatomic) NSString *nid;
@property (copy, nonatomic) NSString *content;
@end

@implementation WLKTSchoolGoCommentApi
- (instancetype)initWithNewsId:(NSString *)nid content:(NSString *)content
{
    self = [super init];
    if (self) {
        _nid = nid;
        _content = content;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"comment/news";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id": _nid,
             @"content": _content
             };
}
@end

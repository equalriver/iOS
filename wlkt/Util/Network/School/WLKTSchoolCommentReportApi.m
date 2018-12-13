//
//  WLKTSchoolCommentReportApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolCommentReportApi.h"

@interface WLKTSchoolCommentReportApi ()
@property (copy, nonatomic) NSString *cid;
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *type;
@end

@implementation WLKTSchoolCommentReportApi
- (instancetype)initWithCommentId:(NSString *)cid content:(NSString *)content type:(NSString *)type
{
    self = [super init];
    if (self) {
        _cid = cid;
        _content = content;
        _type = type;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"report/comment";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id": _cid,
             @"content": _content,
             @"type": _type
             };
}
@end

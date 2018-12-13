//
//  WLKTCommentReplyApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/5.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCommentReplyApi.h"

@interface WLKTCommentReplyApi ()
@property (copy, nonatomic) NSString *cid;
@property (copy, nonatomic) NSString *content;
@end

@implementation WLKTCommentReplyApi
- (instancetype)initWithCommentId:(NSString *)cid content:(NSString *)content
{
    self = [super init];
    if (self) {
        _cid = cid;
        _content = content;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"comment/replynewscom";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id": _cid,
             @"content": _content
             };
}
@end

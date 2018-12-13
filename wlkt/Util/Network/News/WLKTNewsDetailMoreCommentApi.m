//
//  WLKTNewsDetailMoreCommentApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/4.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTNewsDetailMoreCommentApi.h"

@interface WLKTNewsDetailMoreCommentApi ()
@property (copy, nonatomic) NSString *nid;
@property (nonatomic) NSInteger page;
@end

@implementation WLKTNewsDetailMoreCommentApi
- (instancetype)initWithNewsId:(NSString *)nid page:(NSInteger)page
{
    self = [super init];
    if (self) {
        _nid = nid;
        _page = page;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"news/getMoreComList";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id": _nid,
             @"page": @(_page)
             };
}
@end

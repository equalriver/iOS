//
//  WLKTSchoolCommentListApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolCommentListApi.h"

@interface WLKTSchoolCommentListApi ()
@property (copy, nonatomic) NSString *nid;
@property (nonatomic) NSInteger page;
@end

@implementation WLKTSchoolCommentListApi
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
    return @"schnews/getcomment";
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

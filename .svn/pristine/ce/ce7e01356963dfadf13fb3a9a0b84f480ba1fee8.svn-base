//
//  WLKTSchoolNewsCollectCancelApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolNewsCollectCancelApi.h"

@interface WLKTSchoolNewsCollectCancelApi ()
@property (copy, nonatomic) NSString *nid;
@end

@implementation WLKTSchoolNewsCollectCancelApi
- (instancetype)initWithNewsId:(NSString *)nid
{
    self = [super init];
    if (self) {
        _nid = nid;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"shoucang/deletenews";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id": _nid
             };
}
@end

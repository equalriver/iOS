//
//  WLKTSchoolNewsCollectApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolNewsCollectApi.h"

@interface WLKTSchoolNewsCollectApi ()
@property (copy, nonatomic) NSString *nid;
@end

@implementation WLKTSchoolNewsCollectApi
- (instancetype)initWithNewsId:(NSString *)nid
{
    self = [super init];
    if (self) {
        _nid = nid;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"shoucang/addnews";
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

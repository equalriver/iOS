//
//  WLKTNewsDetailApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/4.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTNewsDetailApi.h"

@interface WLKTNewsDetailApi ()
@property (copy, nonatomic) NSString *nid;
@end

@implementation WLKTNewsDetailApi
- (instancetype)initWithNewsId:(NSString *)nid
{
    self = [super init];
    if (self) {
        _nid = nid;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"news/videodetail";
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

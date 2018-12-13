//
//  WLKTNewsAddVideoHitsApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/5.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTNewsAddVideoHitsApi.h"

@interface WLKTNewsAddVideoHitsApi ()
@property (copy, nonatomic) NSString *nid;
@end

@implementation WLKTNewsAddVideoHitsApi
- (instancetype)initWithNewsId:(NSString *)nid
{
    self = [super init];
    if (self) {
        _nid = nid;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"news/addvideohits";
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


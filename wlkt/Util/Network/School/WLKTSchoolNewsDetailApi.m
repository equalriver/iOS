//
//  WLKTSchoolNewsDetailApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/1.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolNewsDetailApi.h"

@interface WLKTSchoolNewsDetailApi ()
@property (copy, nonatomic) NSString *nid;
@end

@implementation WLKTSchoolNewsDetailApi
- (instancetype)initWithNewsId:(NSString *)nid
{
    self = [super init];
    if (self) {
        _nid = nid;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"schnews/details";
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

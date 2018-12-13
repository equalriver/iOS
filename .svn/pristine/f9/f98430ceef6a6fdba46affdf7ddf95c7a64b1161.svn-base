//
//  WLKTSchoolCollectCancelApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolCollectCancelApi.h"

@interface WLKTSchoolCollectCancelApi ()
@property (copy, nonatomic) NSString *suid;
@end

@implementation WLKTSchoolCollectCancelApi
- (instancetype)initWithSchoolId:(NSString *)suid
{
    self = [super init];
    if (self) {
        _suid = suid;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"shoucang/deleteschool";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id": _suid
             };
}
@end

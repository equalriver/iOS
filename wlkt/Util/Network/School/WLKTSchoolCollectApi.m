//
//  WLKTSchoolCollectApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolCollectApi.h"

@interface WLKTSchoolCollectApi ()
@property (copy, nonatomic) NSString *suid;
@end

@implementation WLKTSchoolCollectApi
- (instancetype)initWithSchoolId:(NSString *)suid
{
    self = [super init];
    if (self) {
        _suid = suid;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"shoucang/addschool";
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

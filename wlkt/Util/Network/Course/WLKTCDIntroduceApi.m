//
//  WLKTCDIntroduceApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/8.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDIntroduceApi.h"

@interface WLKTCDIntroduceApi ()
@property (copy, nonatomic) NSString *cid;

@end

@implementation WLKTCDIntroduceApi
- (instancetype)initWithCourseId:(NSString *)cid
{
    self = [super init];
    if (self) {
        _cid = cid;

    }
    return self;
}

- (NSString *)requestUrl {
    return @"course3/introduce";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id" : _cid
             };
}
@end

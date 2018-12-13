//
//  WLKTClassroomDetailApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/2/1.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTClassroomDetailApi.h"

@interface WLKTClassroomDetailApi ()
@property (copy, nonatomic) NSString *cid;
@end

@implementation WLKTClassroomDetailApi
- (instancetype)initWithId:(NSString *)cid
{
    self = [super init];
    if (self) {
        _cid = cid;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"ketang/details";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id": _cid
             };
}
@end

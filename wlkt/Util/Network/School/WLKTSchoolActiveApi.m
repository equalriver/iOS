//
//  WLKTSchoolActiveApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolActiveApi.h"

@interface WLKTSchoolActiveApi ()
@property (copy, nonatomic) NSString *suid;
@property (assign) NSInteger page;
@end

@implementation WLKTSchoolActiveApi
- (instancetype)initWithSchoolId:(NSString *)suid page:(NSInteger)page
{
    self = [super init];
    if (self) {
        _suid = suid;
        _page = page;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"sch/activity";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id": _suid,
             @"page": @(_page)
             };
}
@end

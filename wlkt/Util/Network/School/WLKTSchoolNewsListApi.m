//
//  WLKTSchoolNewsListApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolNewsListApi.h"

@interface WLKTSchoolNewsListApi ()
@property (copy, nonatomic) NSString *suid;
@property (nonatomic) NSInteger page;
@end

@implementation WLKTSchoolNewsListApi
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
    return @"schnews/index";
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

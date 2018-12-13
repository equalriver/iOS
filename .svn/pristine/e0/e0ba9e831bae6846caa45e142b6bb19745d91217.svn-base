//
//  WLKTHPCourseListApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/8.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTHPCourseListApi.h"

@interface WLKTHPCourseListApi ()
@property (copy, nonatomic) NSString *lat;
@property (copy, nonatomic) NSString *lng;
@property (nonatomic) NSInteger page;
@property (copy, nonatomic) NSString *keyword;

@end

@implementation WLKTHPCourseListApi
- (instancetype)initWithLatitude:(NSString *)lat longitude:(NSString *)lng page:(NSInteger)page keyword:(NSString *)keyword
{
    self = [super init];
    if (self) {
        _lat = lat;
        _lng = lng;
        _page = page;
        _keyword = keyword;

    }
    return self;
}

- (NSString *)requestUrl {
    return @"course3/index";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"lat": _lat,
             @"lng": _lng,
             @"page": @(_page),
             @"filterstr": _keyword ? _keyword : @""
             };
}
@end

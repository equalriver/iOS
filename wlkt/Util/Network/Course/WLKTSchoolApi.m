//
//  WLKTSchoolApi.m
//  wlkt
//
//  Created by slovelys on 17/4/14.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolApi.h"

@interface WLKTSchoolApi ()

@property (copy, nonatomic) NSString *schoolId;
@property (copy, nonatomic) NSString *lat;
@property (copy, nonatomic) NSString *lng;
@end

@implementation WLKTSchoolApi

- (instancetype)initWithSchoolId:(NSString *)schoolId {
    WLKT_INIT(
              _schoolId = [schoolId copy];
    )
}

- (instancetype)initWithSchoolId:(NSString *)schoolId lat:(NSString *)lat lng:(NSString *)lng
{
    self = [super init];
    if (self) {
        _schoolId = schoolId;
        _lat = lat;
        _lng = lng;
    }
    return self;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (NSString *)requestUrl {
    return  @"sch/index";
}

- (id)requestArgument {
    return @{
             @"id" : _schoolId ? _schoolId : @"",
             @"lat": _lat ? _lat : @"",
             @"lng": _lng ? _lng : @""
             };
}

@end

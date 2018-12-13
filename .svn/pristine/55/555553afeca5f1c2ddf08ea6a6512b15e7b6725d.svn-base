//
//  WLKTCourseClassificationApi.m
//  wlkt
//
//  Created by slovelys on 17/3/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseClassificationApi.h"

@interface WLKTCourseClassificationApi ()

@property (copy, nonatomic) NSString *classification;
@property (assign, nonatomic) int page;

@end

@implementation WLKTCourseClassificationApi

- (instancetype)initWithCourseClassification:(NSString *)classification page:(int)page {
    WLKT_INIT(
              _classification = [classification copy];
              _page = page;
    )
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (NSString *)requestUrl {
    return  @"course/index";
}

- (id)requestArgument {
    return @{
             @"keyword" : [_classification isEqualToString:@"全部"] ? @"" : _classification,
             @"page" : @(_page)
             };
}

@end

//
//  WLKTCourseLoadNextApi.m
//  wlkt
//
//  Created by slovelys on 2017/6/1.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseLoadNextApi.h"

@interface WLKTCourseLoadNextApi ()

@property (assign, nonatomic) NSInteger page;
@property (copy, nonatomic) NSString *ids;

@end

@implementation WLKTCourseLoadNextApi

- (instancetype)initWithPage:(NSInteger)page ids:(NSString *)ids {
    WLKT_INIT(
              self.page = page;
              self.ids = [ids copy];
    )
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (NSString *)requestUrl {
    return @"course/likelist";
}

- (id)requestArgument {
    return @{
             @"page" : @(_page),
             @"ids" : self.ids ?: @""
             };
}

@end

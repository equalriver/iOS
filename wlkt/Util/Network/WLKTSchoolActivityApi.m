//
//  WLKTSchoolActivityApi.m
//  wlkt
//
//  Created by slovelys on 2017/7/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolActivityApi.h"

@interface WLKTSchoolActivityApi ()

@property (copy, nonatomic) NSString *aid;

@end

@implementation WLKTSchoolActivityApi

- (instancetype)initWithActivituId:(NSString *)aid {
    WLKT_INIT(
              self.aid = [aid copy];
              )
}

- (NSString *)requestUrl {
    return @"school/actlist";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id" : self.aid
             };
}

@end

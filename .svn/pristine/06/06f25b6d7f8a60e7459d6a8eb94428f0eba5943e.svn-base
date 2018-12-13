//
//  WLKTActivityDetailApi.m
//  wlkt
//
//  Created by slovelys on 2017/7/19.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityDetailApi.h"

@interface WLKTActivityDetailApi ()
@property (copy, nonatomic) NSString *lat;
@property (copy, nonatomic) NSString *lng;
@property (copy, nonatomic) NSString *aid;

@end

@implementation WLKTActivityDetailApi

- (instancetype)initWithActivityId:(NSString *)aid lat:(NSString *)lat lng:(NSString *)lng{
    WLKT_INIT(
              _lat = lat;
              _lng = lng;
              self.aid = [aid copy];
    )
}

- (NSString *)requestUrl {
    return @"act/details";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"lat": _lat ? _lat : @"",
             @"lng": _lng ? _lng : @"",
             @"id" : self.aid
             };
}

@end

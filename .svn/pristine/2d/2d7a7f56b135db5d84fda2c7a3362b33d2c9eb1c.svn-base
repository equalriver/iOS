//
//  WLKTActivityCollectApi.m
//  wlkt
//
//  Created by slovelys on 2017/7/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityCollectApi.h"

@interface WLKTActivityCollectApi ()

@property (copy, nonatomic) NSString *aid;

@end

@implementation WLKTActivityCollectApi

- (instancetype)initWithActivituId:(NSString *)aid {
    WLKT_INIT(
              self.aid = [aid copy];
    )
}

- (NSString *)requestUrl {
    return @"shoucang/add";
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

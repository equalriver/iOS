//
//  WLKTActivityCollectionCancelApi.m
//  wlkt
//
//  Created by slovelys on 2017/7/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityCollectionCancelApi.h"

@interface WLKTActivityCollectionCancelApi ()

@property (copy, nonatomic) NSString *aid;

@end

@implementation WLKTActivityCollectionCancelApi

- (instancetype)initWithActivituId:(NSString *)aid {
    WLKT_INIT(
              self.aid = [aid copy];
              )
}

- (NSString *)requestUrl {
    return @"shoucang/delete";
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

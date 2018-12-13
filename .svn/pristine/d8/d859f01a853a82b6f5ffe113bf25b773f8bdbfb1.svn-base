//
//  WLKTActivityListApi.m
//  wlkt
//
//  Created by slovelys on 2017/7/18.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityListApi.h"

@interface WLKTActivityListApi ()

@property (copy, nonatomic) NSDictionary *para;

@end

@implementation WLKTActivityListApi

- (instancetype)initWithParam:(NSDictionary *)para {
    WLKT_INIT(
              _para = [para copy];
    )
}

- (NSString *)requestUrl {
    return @"act/index";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    if (self.para) {
        return _para;
    }
    return @{};
}

@end

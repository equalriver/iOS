//
//  WLKTBannerApi.m
//  wlkt
//
//  Created by slovelys on 17/3/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTBannerApi.h"

@interface WLKTBannerApi ()

@property (assign, nonatomic) WLKTBannerPosition position;

@end

@implementation WLKTBannerApi

- (instancetype)initWithPosition:(WLKTBannerPosition)position {
    WLKT_INIT(
              self.ignoreCache = YES;
              _position = position;
    )
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (NSInteger)cacheTimeInSeconds {
    return 30 * 60 * 60;
}

- (id)requestArgument {
    return @{};
}

@end

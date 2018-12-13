//
//  WLKTSNSBindingCancelApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/28.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSNSBindingCancelApi.h"

@interface WLKTSNSBindingCancelApi ()
@property (copy, nonatomic) NSString *type;
@end

@implementation WLKTSNSBindingCancelApi
- (instancetype)initWithType:(NSString *)type
{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"snsbind/cancel";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"type" : _type
             };
}
@end

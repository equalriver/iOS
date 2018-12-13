//
//  WLKTSNSPasswordApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/28.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSNSPasswordApi.h"

@interface WLKTSNSPasswordApi ()
@property (copy, nonatomic) NSString *password;
@end

@implementation WLKTSNSPasswordApi
- (instancetype)initWithPassword:(NSString *)password
{
    self = [super init];
    if (self) {
        _password = password;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"sns/savesnsreg";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"password" : _password
             };
}
@end


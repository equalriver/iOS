//
//  WLKTSNSValidateApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/28.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSNSValidateApi.h"

@interface WLKTSNSValidateApi ()
@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *code;
@end

@implementation WLKTSNSValidateApi
- (instancetype)initWithPhone:(NSString *)phone code:(NSString *)code
{
    self = [super init];
    if (self) {
        _phone = phone;
        _code = code;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"sns/validateCode";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"phone" : _phone,
             @"code" : _code
             };
}
@end

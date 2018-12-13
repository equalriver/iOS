//
//  WLKTSMSApi.m
//  wlkt
//
//  Created by slovelys on 2017/5/2.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSMSApi.h"

@interface WLKTSMSApi ()

@property (assign, nonatomic) WLKTSMSType type;
@property (copy, nonatomic) NSString *parameter;

@end

@implementation WLKTSMSApi

- (instancetype)initWithWLKTSMSType:(WLKTSMSType)type parameter:(NSString *)parameter {
    WLKT_INIT(
              _type = type;
              _parameter = parameter;
    )
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (NSString *)requestUrl {
    switch (_type) {
        case WLKTSMSTypeRegister:
            return @"reg/sendReg";
            break;
            
        case WLKTSMSTypeForgetPassword:
            return @"reg/sendForget";
            break;
            
        default:
            break;
    }
    return @"reg/validateCode";
}

- (id)requestArgument {
    if (_type == WLKTSMSTypeValidateCode) {
        return @{
                 @"code" : _parameter
                 };
    }
    return @{
             @"phone" : _parameter,
             @"flag": @"sns"
             };
}

@end

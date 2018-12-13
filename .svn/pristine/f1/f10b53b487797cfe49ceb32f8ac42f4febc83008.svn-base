//
//  WLKTBankCardApi.m
//  wlkt
//
//  Created by 尹平江 on 17/4/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTBankCardApi.h"
#import "WLKTLogin.h"

@implementation WLKTBankCardApi

- (NSString *)requestUrl {
    return @"tianfupay/index";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"app_userinfo" : TheCurUser.token
             };
}


@end

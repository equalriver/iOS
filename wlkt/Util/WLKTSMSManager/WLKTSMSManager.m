//
//  WLKTSMSManager.m
//  wlkt
//
//  Created by slovelys on 2017/4/26.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSMSManager.h"

@implementation WLKTSMSManager

+ (void) commitVerificationCode:(NSString *)code phoneNumber:(NSString *)phoneNumber zone:(NSString *)zone completion:(void(^)(void))completion {
//    [SMSSDK commitVerificationCode:code phoneNumber:phoneNumber zone:zone result:^(SMSSDKUserInfo *userInfo, NSError *error) {
//        if (!error) {
//            if (completion) {
//                completion();
//            }
//        } else {
//            [SVProgressHUD showErrorWithStatus:[self configerErrorCode:error.code]];
//        }
//    }];
}

+ (NSString *)configerErrorCode:(NSInteger)errorCode {
    NSString *errorString = @"未知错误";
    switch (errorCode) {
        case 400: {
            errorString = @"无效请求";
        }
            break;
            
        case 457: {
            errorString = @"手机号码格式错误";
        }
            break;
            
        case 458: {
            errorString = @"手机号码在黑名单中";
        }
            break;
            
        case 461: {
            errorString = @"不支持该地区发送短信";
        }
            break;
            
        case 462: {
            errorString = @"每分钟发送次数超限";
        }
            break;
            
        case 463: {
            errorString = @"手机号码每天发送次数超限";
        }
            break;
            
        case 464: {
            errorString = @"每台手机每天发送次数超限";
        }
            break;
            
        case 467: {
            errorString = @"校验验证码请求频繁";
        }
            break;
            
        case 468: {
            errorString = @"需要校验的验证码错误";
        }
            break;
            
        default:
            break;
    }
    return errorString;
}

@end

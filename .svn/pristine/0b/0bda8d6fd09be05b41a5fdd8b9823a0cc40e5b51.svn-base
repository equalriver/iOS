//
//  WLKTSMSApi.h
//  wlkt
//
//  Created by slovelys on 2017/5/2.
//  Copyright © 2017年 neimbo. All rights reserved.
//

typedef NS_ENUM(NSUInteger, WLKTSMSType) {
    WLKTSMSTypeRegister,
    WLKTSMSTypeForgetPassword,
    WLKTSMSTypeValidateCode,
};

#import "YTKRequest.h"

@interface WLKTSMSApi : YTKRequest

- (instancetype)initWithWLKTSMSType:(WLKTSMSType)type parameter:(NSString *)parameter;

@end

//
//  WLKTSMSManager.h
//  wlkt
//
//  Created by slovelys on 2017/4/26.
//  Copyright © 2017年 neimbo. All rights reserved.
//

@interface WLKTSMSManager : NSObject

+ (void) commitVerificationCode:(NSString *)code phoneNumber:(NSString *)phoneNumber zone:(NSString *)zone completion:(void(^)(void))completion;

@end

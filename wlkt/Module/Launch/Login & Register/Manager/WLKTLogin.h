//
//  WLKTLogin.h
//  wlkt
//
//  Created by slovelys on 17/3/19.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUser.h"
//#import <UMSocialCore/UMSocialCore.h>
#import <ShareSDK/ShareSDK.h>
#define TheCurUser [WLKTLogin curUser]

typedef void(^LoginCompletion)(WLKTUser *user);

@interface WLKTLogin : NSObject

+ (void)loginWithUsername:(NSString *)username password:(NSString *)password completion:(LoginCompletion)completion;
+ (void)loginWithSNSType:(SSDKPlatformType)type completion:(LoginCompletion)completion SNSPushHandler:(void(^)(void))handler;
+ (void)logoutWithCompletion:(void (^)(void))completion;

+ (void)autoLogin;

+ (WLKTUser *)curUser;
+ (void)saveUserData:(WLKTUser *)user;

+ (NSString *)lastUsername;
+ (void)savePassword:(NSString *)password username:(NSString *)username;
+ (NSString *)lastPassword;
+ (void)setLoginData:(NSDictionary *)data completion:(void (^)(void))completion;
@end

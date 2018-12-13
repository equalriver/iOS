//
//  WLKTLoginViewController.h
//  wlkt
//
//  Created by slovelys on 17/3/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//
#import <UMSocialCore/UMSocialCore.h>
#import <ShareSDK/ShareSDK.h>
@class WLKTLoginViewController;

@protocol WLKTLoginViewControllerDelegate <NSObject>

@optional
- (void)loginViewController:(WLKTLoginViewController *)loginViewController didRequestLoginWithUsername:(NSString *)username password:(NSString *)password;
- (void)loginViewController:(WLKTLoginViewController *)loginViewController didRequestLoginWithSNSType:(SSDKPlatformType)type;
- (void)loginViewControllerDidTapCancel:(WLKTLoginViewController *)loginViewController;
- (void)loginViewControllerDidTapRegister:(WLKTLoginViewController *)loginViewController;
- (void)loginViewControllerDidTapForgetPassword:(WLKTLoginViewController *)loginViewController;

@end

@interface WLKTLoginViewController : UIViewController

@property (weak, nonatomic) id<WLKTLoginViewControllerDelegate> delegate;

@end

//
//  WLKTRegisterViewController.h
//  wlkt
//
//  Created by slovelys on 2017/4/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

@class WLKTRegisterViewController;

typedef NS_ENUM(NSUInteger, WLKTRegisterOrForgetPasswordVCType) {
    WLKTRegisterOrForgetPasswordVCTypeRegister,
    WLKTRegisterOrForgetPasswordVCTypeForgetPassword,
};

@protocol WLKTRegisterViewControllerDelegate <NSObject>

- (void)registerViewController:(WLKTRegisterViewController *)registerViewController didRequestRegisterWithUsername:(NSString *)username authCode:(NSString *)authCode password:(NSString *)password;

- (void)registerViewController:(WLKTRegisterViewController *)registerViewController didRequestResetPasswordWithUsername:(NSString *)username authCode:(NSString *)authCode password:(NSString *)password;

- (void)registerViewController:(WLKTRegisterViewController *)registerViewController didRequestAuthCodeWithUsername:(NSString *)username WLKTRegisterOrForgetPasswordVCType:(WLKTRegisterOrForgetPasswordVCType)type;

@end

@interface WLKTRegisterViewController : UITableViewController

@property (weak, nonatomic) id<WLKTRegisterViewControllerDelegate> delegate;


- (instancetype)initWithViewControllerType:(WLKTRegisterOrForgetPasswordVCType)type;
- (void)startCountForAuthCode;

@end

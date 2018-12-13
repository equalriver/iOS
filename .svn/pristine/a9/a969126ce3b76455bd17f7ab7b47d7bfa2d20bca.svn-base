//
//  WLKTUMShareScreenShot.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/11.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTUMShareScreenShot.h"

@implementation WLKTUMShareScreenShot
+(void)load
{
    [super load];
}

+(NSArray *) socialPlatformTypes
{
    return @[@(UMSocialPlatformType_UserDefine_Begin +3)];
}


+ (WLKTUMShareScreenShot *)defaultManager
{
    static WLKTUMShareScreenShot *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    return instance;
}

#pragma mark -
//初始化sdk的appKey，appSecret，redirectURL
-(void)umSocial_setAppKey:(NSString*)appKey
            withAppSecret:(NSString *)appSecret
          withRedirectURL:(NSString *)redirectURL{}

//删除缓存授权数据
-(void)umSocial_clearCacheData{}

//授权
-(void)umSocial_AuthorizeWithUserInfo:(NSDictionary *)userInfo
                   withViewController:(UIViewController*)viewController
                withCompletionHandler:(UMSocialRequestCompletionHandler)completionHandler{}

//取消授权
-(void)umSocial_cancelAuthWithCompletionHandler:(UMSocialRequestCompletionHandler)completionHandler{}

//分享
-(void)umSocial_ShareWithObject:(UMSocialMessageObject *)messageObject withCompletionHandler:(UMSocialRequestCompletionHandler)completionHandler{
    !completionHandler ?: completionHandler(@"screen shot", nil);
}

//获得用户信息
-(void)umSocial_RequestForUserProfileWithCompletionHandler:(UMSocialRequestCompletionHandler)completionHandler{}

//当前平台app是否安装
-(BOOL)umSocial_isInstall{
    return YES;
}

//当前平台是否可以分享
-(BOOL)umSocial_isSupport{
    return YES;
}
@end

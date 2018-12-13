//
//  WLKTUMShare.m
//  wlkt
//
//  Created by 尹平江 on 17/4/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUMShare.h"


@interface WLKTUMShare ()

@end

static NSString *isHidden = @"kWLKTScreenShotIsHidden";

@implementation WLKTUMShare

+ (void)shareWithTaget:(__kindof UIViewController * _Nonnull)vc title:(NSString * _Nullable)title detail:(NSString * _Nullable)detail urlImage:(id _Nullable)urlImage url:(NSString * _Nullable)url{
    [self setPreDefinePlatforms];
//    [UMSocialShareUIConfig shareInstance].shareContainerConfig.shareContainerMarginTop = 100;
    //NSLog(@"************* umSocialSDKVersion: %@",[UMSocialGlobal umSocialSDKVersion]);
//    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
//        [self shareImageAndTextToPlatformType:platformType title:title detail:detail urlImage:urlImage url:url taget:vc];
//        
//    }];
}

//分享图文（新浪支持，微信/QQ仅支持图或文本分享）
+ (void)shareImageAndTextToPlatformType:(UMSocialPlatformType)platformType title:(NSString * _Nullable)title detail:(NSString * _Nullable)detail urlImage:(id)urlImage url:(NSString * _Nullable)url taget:(__kindof UIViewController *)vc tapView:(UIView *_Nonnull)tapView
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//    if (message) {
//        //设置文本
//        messageObject.text = message;
//
//    }
    UMShareWebpageObject *web = [UMShareWebpageObject shareObjectWithTitle:title descr:detail thumImage:urlImage];
    web.webpageUrl = url;
    messageObject.shareObject = web;
    //创建图片内容对象
    /*if (image || url) {
        UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
        //如果有缩略图，则设置缩略图
        if (image) {
            shareObject.thumbImage = image;
        }
        else if (url){
            [shareObject setShareImage:url];
        }
        
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
    }
    */
    //调用分享接口
    [tapView removeFromSuperview];
    if (platformType == UMSocialPlatformType_Email || platformType == UMSocialPlatformType_Sms) {
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:vc completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
                [SVProgressHUD showErrorWithStatus:@"分享失败"];
            }else{
                [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"isSNSPush"];
                NSLog(@"分享成功——————response data is %@",data);
            }
        }];
    }
    else if (platformType == UMSocialPlatformType_UserDefine_Begin +1){//copy
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
                [SVProgressHUD showErrorWithStatus:@"分享失败"];
            }else{
                [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"isSNSPush"];
                UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                pasteboard.string = url;
                [SVProgressHUD showInfoWithStatus:@"复制链接成功!"];
                NSLog(@"分享成功——————response data is %@",data);
            }
        }];
    }
    else if (platformType == UMSocialPlatformType_UserDefine_Begin +2){//system share
        //数组中放入分享的内容
        NSArray *activityItems = @[url];
        
        // 实现服务类型控制器
        UIActivityViewController *activityViewController = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
        
        [vc presentViewController:activityViewController animated:YES completion:nil];
        
        // 分享类型
        [activityViewController setCompletionWithItemsHandler:^(NSString * __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError){
            // 显示选中的分享类型
            NSLog(@"当前选择分享平台 %@",activityType);
            
            if (completed) {
                [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"isSNSPush"];
                NSLog(@"分享成功");
                
            }else {
                NSLog(@"分享失败");
            }
        }];
    }
    else if (platformType == UMSocialPlatformType_UserDefine_Begin +3){//screen shot
        [self screenShotWithURL:url];
    }
    else{
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
                [SVProgressHUD showErrorWithStatus:@"分享失败"];
            }else{
                [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"isSNSPush"];
                NSLog(@"分享成功——————response data is %@",data);
            }
        }];
    }

}

+ (void)screenShotWithURL:(NSString *)url{
    //人为截屏, 模拟用户截屏行为, 获取所截图片
    UIImage *image_ = [WLKTQRShare imageWithScreenshot];
    UIWindow *keyWindow = [[UIApplication sharedApplication]keyWindow];
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:isHidden];
    if ([[NSUserDefaults standardUserDefaults]valueForKey:isHidden]) {
        WLKTScreenshotsPopView *popView = [WLKTScreenshotsPopView initWithScreenShots:image_ selectSheetBlock:^(SelectSheetType type) {
            if (type == WeiXinSelectSheetType){
                [WLKTQRShare shareImageAndTextToPlatformType:UMSocialPlatformType_WechatSession image:[WLKTQRShare combineScreenshotsImage:image_ URLString:url]];
            }
            if (type == WeiXinCircleSelectSheetType){
                [WLKTQRShare shareImageAndTextToPlatformType:UMSocialPlatformType_WechatTimeLine image:[WLKTQRShare combineScreenshotsImage:image_ URLString:url]];
            }
            if (type == QQSelectSheetType) {
                [WLKTQRShare shareImageAndTextToPlatformType:UMSocialPlatformType_QQ image:[WLKTQRShare combineScreenshotsImage:image_ URLString:url]];
            }
            if (type == SinaSelectSheetType) {
                [WLKTQRShare shareImageAndTextToPlatformType:UMSocialPlatformType_Sina image:[WLKTQRShare combineScreenshotsImage:image_ URLString:url]];
            }
        }];
        [popView show];
        
        [keyWindow addSubview:popView];
        [[NSUserDefaults standardUserDefaults]setBool:false forKey:isHidden];
        popView.hiddenBlock = ^{
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:isHidden];
        };
    }else{
        
    }
}

+ (void)setPreDefinePlatforms{
    
    NSMutableArray *sharePlatforms = [NSMutableArray arrayWithCapacity:8];
    if ([[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Sina]) {
        [sharePlatforms addObject:@(UMSocialPlatformType_Sina)];
    }
    //QQ
    if ([[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ]) {
        [sharePlatforms addObjectsFromArray:@[@(UMSocialPlatformType_QQ), @(UMSocialPlatformType_Qzone)]];
    }
    //weichat
    if ([[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession]) {
        [sharePlatforms addObjectsFromArray:@[@(UMSocialPlatformType_WechatSession), @(UMSocialPlatformType_WechatFavorite), @(UMSocialPlatformType_WechatTimeLine)]];
    }

    if ([[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Email]) {
        [sharePlatforms addObject:@(UMSocialPlatformType_Email)];
    }
    if ([[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Sms]) {
        [sharePlatforms addObject:@(UMSocialPlatformType_Sms)];
    }

//    //add copy
//    [UMSocialUIManager addCustomPlatformWithoutFilted:UMSocialPlatformType_UserDefine_Begin +1
//                                     withPlatformIcon:[UIImage imageNamed:@"button_share"]
//                                     withPlatformName:@"复制链接"];
//    [sharePlatforms addObject:@(UMSocialPlatformType_UserDefine_Begin +1)];
//
//    //add system share
//    [UMSocialUIManager addCustomPlatformWithoutFilted:UMSocialPlatformType_UserDefine_Begin +2
//                                     withPlatformIcon:[UIImage imageNamed:@"button_share"]
//                                     withPlatformName:@"系统分享"];
//    [sharePlatforms addObject:@(UMSocialPlatformType_UserDefine_Begin +2)];
//
//    //add screen shot
//    [UMSocialUIManager addCustomPlatformWithoutFilted:UMSocialPlatformType_UserDefine_Begin +3
//                                     withPlatformIcon:[UIImage imageNamed:@"button_share"]
//                                     withPlatformName:@"截图分享"];
//    [sharePlatforms addObject:@(UMSocialPlatformType_UserDefine_Begin +3)];
//    [UMSocialShareUIConfig shareInstance].sharePageGroupViewConfig.sharePageGroupViewPostionType = UMSocialSharePageGroupViewPositionType_Bottom;
//    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageItemStyleType = UMSocialPlatformItemViewBackgroudType_None;
    [UMSocialUIManager setPreDefinePlatforms:[NSArray arrayWithArray:sharePlatforms.copy]];
    
}


@end

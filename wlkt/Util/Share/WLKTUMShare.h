//
//  WLKTUMShare.h
//  wlkt
//
//  Created by 尹平江 on 17/4/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>
#import "WLKTScreenshotsPopView.h"
#import "WLKTQRShare.h"

@interface WLKTUMShare : NSObject

//+ (void)shareWithTaget:(__kindof UIViewController * _Nonnull)vc title:(NSString * _Nullable)title detail:(NSString * _Nullable)detail urlImage:(id _Nullable )urlImage url:(NSString * _Nullable)url;
+ (void)shareImageAndTextToPlatformType:(UMSocialPlatformType)platformType title:(NSString * _Nullable)title detail:(NSString * _Nullable)detail urlImage:(id _Nullable )urlImage url:(NSString * _Nullable)url taget:(__kindof UIViewController *_Nullable)vc tapView:(UIView *_Nonnull)tapView;
@end

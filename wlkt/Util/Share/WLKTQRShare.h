//
//  WLKTQRShare.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/1.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocialCore/UMSocialCore.h>

@interface WLKTQRShare : NSObject
/// 图片拼接
+ (UIImage *_Nonnull)combineScreenshotsImage:(UIImage *_Nonnull)screenImage URLString:(NSString *_Nonnull)url;

+ (UIImage *_Nonnull)imageWithScreenshot;
+ (void)shareImageAndTextToPlatformType:(UMSocialPlatformType)platformType image:(UIImage *_Nonnull)image;
@end

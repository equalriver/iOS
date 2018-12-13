//
//  WLKTColors.h
//  wlkt
//
//  Created by slovelys on 17/3/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#ifndef WLKTColors_h
#define WLKTColors_h

#define KMainTextColor_3 UIColorHex(333333)
#define KMainTextColor_6 UIColorHex(666666)
#define KMainTextColor_9 UIColorHex(999999)
#define kMainTextColor_red UIColorHex(e61d23)
#define kMainTextColor_lightRed UIColorHex(e79096)
#define kMainBackgroundColor UIColorHex(eeeeee)

#define kTextColor UIColorHex(666666)
#define kNavBarBackgroundColor UIColorHex(ffffff)
#define kNavBarShadowImageColor UIColorHex(eeeeee)
#define KNavBarTintColor UIColorHex(333333)
#define kHUDBackgroundColor [UIColor colorWithWhite:0.1 alpha:0.85]
#define kHUDForegroundColor [UIColor whiteColor]

#define kButtonBackgroundNormalColor [UIImage imageWithColor:kMainTextColor_red]
#define kButtonBackgroundHighlightedColor [UIImage imageWithColor:[kMainTextColor_red colorByChangeHue:0 saturation:0 brightness:-0.2 alpha:0]]
#define kButtonBackgroundDisabledColor [UIImage imageWithColor:[UIColor colorWithWhite:0.9 alpha:1]]
#define kButtonTitleNormalColor [UIColor whiteColor]
#define kButtonTitleDisabledColor [UIColor lightGrayColor]


// 活动
static NSString * const kActivityDarkBlack = @"333333";
static NSString * const kActivityLightBlack = @"3F3F3F";
static NSString * const kActivityLightGray = @"999999";
static NSString * const kActivityDarkRed = @"EE1050";
static NSString * const kActivityLightRed = @"F05252";
static NSString * const kActivityYellow = @"FFC62B";

#endif /* WLKTColors_h */

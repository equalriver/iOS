//
//  WLKTIntroManager.m
//  wlkt
//
//  Created by slovelys on 17/3/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTIntroManager.h"
#import "EAIntroView.h"

static NSString * const kLastIntroVersion = @"kLastIntroVersion";

static UIViewController * IntroContainerViewController;

@implementation WLKTIntroManager

+ (void)displayIntroView {
    IntroContainerViewController = kKeyWindow.rootViewController;
    UIView *rootView = IntroContainerViewController.view;
    NSMutableArray *pages = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; i++) {
        EAIntroPage *page = [EAIntroPage page];
        page.showTitleView = NO;
        page.bgImage = [UIImage imageNamed:[NSString stringWithFormat:@"引导页-%@", @(i+1)]];
        [pages addObject:page];
    }
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:pages];
    intro.pageControl.numberOfPages = 3;
    intro.swipeToExit = YES;
    intro.showSkipButtonOnlyOnLastPage = YES;
    intro.tapToNext = YES;
    [intro.skipButton setTitle:@"跳过" forState:UIControlStateNormal];
    intro.skipButtonY = ScreenHeight - 40;
    intro.skipButtonSideMargin = 20;
//    intro.skipButton.layer.masksToBounds = YES;
//    intro.skipButton.layer.borderColor = UIColorHex(3983cc).CGColor;
//    intro.skipButton.layer.borderWidth = CGFloatPixelCeil(1);
//    intro.skipButton.layer.cornerRadius = 3;
//    intro.skipButtonAlignment = EAViewAlignmentRight;
    intro.skipButton.backgroundColor = [UIColor clearColor];
    [intro.skipButton setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
    [intro showInView:rootView animateDuration:0];
    [self markCurrentVersionOfIntroHasBeenShowed];
}

+ (BOOL)needDisplayIntroView {
    NSString *lastVersion = [StandardUserDefaults stringForKey:kLastIntroVersion];
    NSString *currentVersion = [UIApplication sharedApplication].appVersion;
    return ![lastVersion isEqualToString:currentVersion];
}

+ (void)markCurrentVersionOfIntroHasBeenShowed {
    [StandardUserDefaults setValue:[UIApplication sharedApplication].appVersion forKey:kLastIntroVersion];
}

@end

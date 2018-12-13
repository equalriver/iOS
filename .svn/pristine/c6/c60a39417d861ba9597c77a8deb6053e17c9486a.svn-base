//
//  WLKTBlurView.h
//  wlkt
//
//  Created by slovelys on 2017/4/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

typedef void(^BlurViewBlock)(void);

@interface WLKTBlurView : UIView

@property (strong, nonatomic) BlurViewBlock touchBlock;

+ (instancetype)sharedInstance;
- (void)showBlurViewInView:(UIView *)view completion:(void(^)(void))completion;
- (void)hideBlurView;
- (void)hideBlurViewImmediately;
- (void)showTransparencyViewInView:(UIView *)view;

@end

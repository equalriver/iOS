//
//  WLKTBlurView.m
//  wlkt
//
//  Created by slovelys on 2017/4/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTBlurView.h"

static NSTimeInterval kDurationTime = 0.1;

@implementation WLKTBlurView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.1;
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    }
    return self;
}

+ (instancetype)sharedInstance {
    static WLKTBlurView *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WLKTBlurView alloc] init];
    });
    return sharedInstance;
}

- (void)showTransparencyViewInView:(UIView *)view {
    self.backgroundColor = [UIColor whiteColor];
    [view addSubview:self];
}

- (void)showBlurViewInView:(UIView *)view completion:(void(^)(void))completion {
    [view addSubview:self];
    [UIView animateWithDuration:kDurationTime
                     animations:^{
                         self.alpha = 0.8;
                         if (completion) {
                             completion();
                         }
                     }];
}

- (void)hideBlurView {
    [UIView animateWithDuration:kDurationTime
                     animations:^{
                         self.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [self hideBlurViewImmediately];
                     }];
}

- (void)hideBlurViewImmediately {
    self.touchBlock = nil;
    [self removeFromSuperview];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.touchBlock) {
        self.touchBlock();
    }
}

//- (nullable UIView *)hitTest:(CGPoint)point
//                   withEvent:(nullable UIEvent *)event {
//    UIView *hitView = [super hitTest:point withEvent:event];
//    if (self == hitView) {
//        if (self.touchBlock) {
//            self.touchBlock();
//        }
//        return nil;
//    }
//    return hitView;
//}

@end

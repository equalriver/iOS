//
//  UIButton+Category.m
//  wlkt
//
//  Created by slovelys on 17/3/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "UIButton+Category.h"
#import <objc/runtime.h>

static NSInteger const kAuthCodeInterval = 60;
static NSUInteger kLeftTime;
static NSTimer *authCodeTimer;

@implementation UIButton (Category)

- (void)countdown:(NSTimer *)timer {
    self.enabled = NO;
    kLeftTime--;
    if (kLeftTime > 0) {
        [self setTitleWithoutFlash:[NSString stringWithFormat:@"重新发送(%@)", @(kLeftTime)] forState:UIControlStateDisabled];
    } else {
        [timer invalidate];
        [self setTitleWithoutFlash:@"获取验证码" forState:UIControlStateNormal];
        self.enabled = YES;
    }
}

- (void)startCount {
    kLeftTime = kAuthCodeInterval;
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(countdown:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    [self.timer fire];
}

- (void)stopCount {
    [self.timer invalidate];
}

- (void)setTitleWithoutFlash:(NSString *)title forState:(UIControlState)state {
    self.titleLabel.text = title;
    [self setTitle:title forState:state];
}

- (void)setBackgroundImageWithBackgroundColor {
    if (!self.backgroundColor) {
        return;
    }
    [self setBackgroundImageWithColor:self.backgroundColor];
}

- (void)setBackgroundImageWithColor:(UIColor *)color {
    if (!color) {
        return;
    }
    
    self.adjustsImageWhenHighlighted = NO;
    self.adjustsImageWhenDisabled = NO;
    [self setTitleColor:kButtonTitleDisabledColor forState:UIControlStateDisabled];
    [self setBackgroundImage:[UIImage imageWithColor:color] forState:UIControlStateNormal];
    
    [self setBackgroundImage:[UIImage imageWithColor:[[self class] colorForHighlightedWithColor:color]] forState:UIControlStateHighlighted];
    [self setBackgroundImage:kButtonBackgroundDisabledColor forState:UIControlStateDisabled];
}

+ (UIColor *)colorForHighlightedWithColor:(UIColor *)color {
    NSParameterAssert(color);
    UIColor *highlightedColor = [color colorByChangeHue:0 saturation:-0.1 brightness:-0.1 alpha:0];
    NSAssert(highlightedColor, @"无法完成转换，请用16进制表示该颜色");
    return highlightedColor;
}

- (void)centerVertically {
    [self centerVerticallyWithPadding:10];
}

- (void)centerVerticallyWithPadding:(float)padding {
    CGSize imageSize = self.imageView.image.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(
                                            0.0, - imageSize.width, - (imageSize.height + padding), 0.0);
    
    // raise the image and push it right so it appears centered
    //  above the text
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    self.imageEdgeInsets = UIEdgeInsetsMake(
                                            - (titleSize.height + padding), 0.0, 0.0, - titleSize.width);
}

#pragma mark - Getters & Setters
- (NSTimer *)timer {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTimer:(NSTimer *)timer {
    objc_setAssociatedObject(self, @selector(timer), timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

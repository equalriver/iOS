//
//  UIButton+Category.h
//  wlkt
//
//  Created by slovelys on 17/3/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

@interface UIButton (Category)

@property (strong, nonatomic) NSTimer *timer;

- (void)startCount;
- (void)stopCount;

/**
 *  用BackgroundColor设置BackgroundImage
 */
- (void)setBackgroundImageWithBackgroundColor;
/**
 *  用UIControlStateNormal下的颜色设置BackgroundImage
 *
 *  @param color UIControlStateNormal下的颜色
 */
- (void)setBackgroundImageWithColor:(UIColor *)color;

+ (UIColor *)colorForHighlightedWithColor:(UIColor *)color;
- (void)centerVertically;
- (void)centerVerticallyWithPadding:(float)padding;

@end

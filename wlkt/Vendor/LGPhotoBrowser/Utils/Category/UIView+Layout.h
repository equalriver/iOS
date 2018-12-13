//
//  UIView+Layout.h
//  FTLibrary
//
//  Created by Simon Lee on 21/12/2009.
//  Copyright 2009 Fuerte International. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UIView (Layout)

@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;

- (double)width;
- (void)setWidth:(double)width;

- (double)height;
- (void)setHeight:(double)height;

- (CGFloat)bottomPosition;

- (CGSize)size;
- (void)setSize:(CGSize)size;

- (CGPoint)origin;
- (void)setOrigin:(CGPoint)point;

- (double)xPosition;
- (double)yPosition;
- (double)baselinePosition;

- (void)positionAtX:(double)xValue;
- (void)positionAtY:(double)yValue;
- (void)positionAtX:(double)xValue andY:(double)yValue;

- (void)positionAtX:(double)xValue andY:(double)yValue withWidth:(double)width;
- (void)positionAtX:(double)xValue andY:(double)yValue withHeight:(double)height;

- (void)positionAtX:(double)xValue withHeight:(double)height;

- (void)removeSubviews;

- (void)centerInSuperView;
- (void)aestheticCenterInSuperView;

- (void)bringToFront;
- (void)sendToBack;

//ZF

- (void)centerAtX;

- (void)centerAtXQuarter;

- (void)centerAtX3Quarter;

//******************TZImagePicker**********************************
typedef enum : NSUInteger {
    TZOscillatoryAnimationToBigger,
    TZOscillatoryAnimationToSmaller,
} TZOscillatoryAnimationType;

@property (nonatomic) CGFloat tz_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat tz_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat tz_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat tz_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat tz_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat tz_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat tz_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat tz_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint tz_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  tz_size;        ///< Shortcut for frame.size.

+ (void)showOscillatoryAnimationWithLayer:(CALayer *)layer type:(TZOscillatoryAnimationType)type;

@end

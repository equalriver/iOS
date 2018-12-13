//
//  UIView+Layout.m
//  FTLibrary
//
//  Created by Simon Lee on 21/12/2009.
//  Copyright 2009 Fuerte International. All rights reserved.
//

#import "UIView+Layout.h"


@implementation UIView (Layout)

- (void)removeSubviews {
	for(UIView *view in self.subviews) {
		[view removeFromSuperview];
	}
}

- (double)width {
	CGRect frame = [self frame];
	return frame.size.width;
}

- (void)setWidth:(double)value {
	CGRect frame = [self frame];
	frame.size.width = round(value);
	[self setFrame:frame];
}

- (double)height {
	CGRect frame = [self frame];
	return frame.size.height;	
}

- (void)setHeight:(double)value {
	CGRect frame = [self frame];
	frame.size.height = round(value);
	[self setFrame:frame];
}

- (CGFloat)bottomPosition {
	return ([self height] + [self yPosition]);
}

- (void)setSize:(CGSize)size {
	CGRect frame = [self frame];
	frame.size.width = round(size.width);
	frame.size.height = round(size.height);
	[self setFrame:frame];
}

- (CGSize)size {
	CGRect frame = [self frame];
	return frame.size;
}

- (CGPoint)origin {
	CGRect frame = [self frame];
	return frame.origin;
}

- (void)setOrigin:(CGPoint)point {
	CGRect frame = [self frame];
	frame.origin = point;
	[self setFrame:frame];
}

- (double)xPosition {
	CGRect frame = [self frame];
	return frame.origin.x;
}

- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (double)yPosition {
	CGRect frame = [self frame];
	return frame.origin.y;	
}

- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y{
    return self.frame.origin.y;
}

- (double)baselinePosition {
	return [self yPosition] + [self height];
}

- (void)positionAtX:(double)xValue {
	CGRect frame = [self frame];
	frame.origin.x = round(xValue);
	[self setFrame:frame];
}

- (void)positionAtY:(double)yValue {
	CGRect frame = [self frame];
	frame.origin.y = round(yValue);
	[self setFrame:frame];
}

- (void)positionAtX:(double)xValue andY:(double)yValue {
	CGRect frame = [self frame];
	frame.origin.x = round(xValue);
	frame.origin.y = round(yValue);
	[self setFrame:frame];
}

- (void)positionAtX:(double)xValue andY:(double)yValue withWidth:(double)width {
	CGRect frame = [self frame];
	frame.origin.x = round(xValue);
	frame.origin.y = round(yValue);
	frame.size.width = width;
	[self setFrame:frame];	
}

- (void)positionAtX:(double)xValue andY:(double)yValue withHeight:(double)height {
	CGRect frame = [self frame];
	frame.origin.x = round(xValue);
	frame.origin.y = round(yValue);
	frame.size.height = height;
	[self setFrame:frame];	
}

- (void)positionAtX:(double)xValue withHeight:(double)height {
	CGRect frame = [self frame];
	frame.origin.x = round(xValue);
	frame.size.height = height;
	[self setFrame:frame];	
}

- (void)centerInSuperView {
	double xPos = round((self.superview.frame.size.width - self.frame.size.width) / 2.0);
	double yPos = round((self.superview.frame.size.height - self.frame.size.height) / 2.0);	
	[self positionAtX:xPos andY:yPos];
}

- (void)aestheticCenterInSuperView {
	double xPos = round(([self.superview width] - [self width]) / 2.0);
	double yPos = round(([self.superview height] - [self height]) / 2.0) - ([self.superview height] / 8.0);
	[self positionAtX:xPos andY:yPos];	
}

- (void)bringToFront {
	[self.superview bringSubviewToFront:self];	
}

- (void)sendToBack {
	[self.superview sendSubviewToBack:self];	
}

//ZF

- (void)centerAtX{
    double xPos = round((self.superview.frame.size.width - self.frame.size.width) / 2.0);
    [self positionAtX:xPos];
}


- (void)centerAtXQuarter{
    double xPos = round((self.superview.frame.size.width / 4) - (self.frame.size.width / 2));
    [self positionAtX:xPos];    
}


- (void)centerAtX3Quarter{
    [self centerAtXQuarter];
    double xPos = round((self.superview.frame.size.width / 2) + self.frame.origin.x);
    [self positionAtX:xPos];
}

//******************TZImagePicker**********************************
- (CGFloat)tz_left {
    return self.frame.origin.x;
}

- (void)setTz_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)tz_top {
    return self.frame.origin.y;
}

- (void)setTz_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)tz_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setTz_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)tz_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setTz_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)tz_width {
    return self.frame.size.width;
}

- (void)setTz_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)tz_height {
    return self.frame.size.height;
}

- (void)setTz_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)tz_centerX {
    return self.center.x;
}

- (void)setTz_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)tz_centerY {
    return self.center.y;
}

- (void)setTz_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)tz_origin {
    return self.frame.origin;
}

- (void)setTz_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)tz_size {
    return self.frame.size;
}

- (void)setTz_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

+ (void)showOscillatoryAnimationWithLayer:(CALayer *)layer type:(TZOscillatoryAnimationType)type{
    NSNumber *animationScale1 = type == TZOscillatoryAnimationToBigger ? @(1.15) : @(0.5);
    NSNumber *animationScale2 = type == TZOscillatoryAnimationToBigger ? @(0.92) : @(1.15);
    
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        [layer setValue:animationScale1 forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
            [layer setValue:animationScale2 forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                [layer setValue:@(1.0) forKeyPath:@"transform.scale"];
            } completion:nil];
        }];
    }];
}

@end

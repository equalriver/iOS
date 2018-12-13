//
//  NSString+WLKTTools.h
//  wlkt
//
//  Created by 尹平江 on 2018/5/16.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WLKTTools)

- (CGSize)getSizeWithWidth:(float)width Font:(float)fontSize;

- (void)getSizeWithWidth:(float)width Font:(float)fontSize callback:(void(^)(CGSize size))size;

- (CGSize)getSizeWithHeight:(float)height Font:(float)fontSize;

- (CGFloat)getSpaceLabelWithFont:(UIFont *)font withWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing wordSpacing:(CGFloat)wordSpacing;

+ (NSAttributedString *)setAttributedString:(NSString *)str withFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing wordSpacing:(CGFloat)wordSpacing;

@end

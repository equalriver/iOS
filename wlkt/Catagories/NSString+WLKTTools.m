//
//  NSString+WLKTTools.m
//  wlkt
//
//  Created by 尹平江 on 2018/5/16.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "NSString+WLKTTools.h"

@implementation NSString (WLKTTools)

+ (NSAttributedString *)setAttributedString:(NSString *)str withFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing wordSpacing:(CGFloat)wordSpacing{

    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paraStyle.lineSpacing = lineSpacing; //设置行间距
    paraStyle.hyphenationFactor = 1.0;//连字符属性
    paraStyle.firstLineHeadIndent = 20.0;//每段的首行缩进
    paraStyle.paragraphSpacingBefore = 0.0;//段落间距
    paraStyle.headIndent = 0;//整段缩进
    paraStyle.tailIndent = 0;//右侧缩进或显示宽度
                             //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@(wordSpacing)
                          };
    if (str) {
        return [[NSAttributedString alloc] initWithString:str attributes:dic];
    }
    return nil;
}

#pragma mark - text size
- (CGSize)getSizeWithWidth:(float)width Font:(float)fontSize
{
    NSDictionary * attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGSize tempSize = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return CGSizeMake(ceil(tempSize.width), ceil(tempSize.height));
}

- (void)getSizeWithWidth:(float)width Font:(float)fontSize callback:(void(^)(CGSize size))size{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        !size ?: size([self getSizeWithWidth:width Font:fontSize]);
    });
}

- (CGSize)getSizeWithHeight:(float)height Font:(float)fontSize
{
    NSDictionary * attribute = @{NSFontAttributeName :[UIFont systemFontOfSize:fontSize] };
    CGSize tempSize = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return CGSizeMake(ceil(tempSize.width), ceil(tempSize.height));
}

- (CGFloat)getSpaceLabelWithFont:(UIFont *)font withWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing wordSpacing:(CGFloat)wordSpacing{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = lineSpacing;
    paraStyle.hyphenationFactor = 1.0;//连字符属性
    paraStyle.firstLineHeadIndent = 40.0;//每段的首行缩进
    paraStyle.paragraphSpacingBefore = 0.0;//段落间距
    paraStyle.headIndent = 0;//整段缩进
    paraStyle.tailIndent = 0;//右侧缩进或显示宽度
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@(wordSpacing)
                          };
    
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size.height;
}

@end

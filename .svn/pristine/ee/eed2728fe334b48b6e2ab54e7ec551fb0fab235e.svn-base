//
//  WLKTHTMLString.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/10/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTHTMLString : NSObject
///string转HTML
+ (NSAttributedString *)HTMLStringWithString:(NSString *)string;
///将 &lt 等类似的字符转化为HTML中的“<”等
+ (NSString *)htmlEntityDecode:(NSString *)string;
///将HTML字符串转化为NSAttributedString富文本字符串
+ (NSAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString;
///去掉 HTML 字符串中的标签
+ (NSString *)filterHTML:(NSString *)html;
@end

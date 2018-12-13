//
//  PlaceholderTextView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/8.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceholderTextView : UITextView
@property (nonatomic,copy) NSString *myPlaceholder;  //文字
- (instancetype)initWithPlaceholderColor:(UIColor *)color font:(CGFloat)font;

@end

//
//  PlaceholderTextView.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/8.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "PlaceholderTextView.h"

@interface PlaceholderTextView ()
@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic,strong) UIColor *myPlaceholderColor; //文字颜色
//@property (nonatomic) CGFloat myPlaceholderFont;
@end

@implementation PlaceholderTextView
- (instancetype)initWithPlaceholderColor:(UIColor *)color font:(CGFloat)font
{
    self = [super init];
    if (self) {
        self.returnKeyType = UIReturnKeyDone;
        self.tintColor = color;//光标颜色
        self.backgroundColor = [UIColor clearColor];
        UILabel *placeholderLabel = [[UILabel alloc]init];//添加一个占位label
        placeholderLabel.backgroundColor = [UIColor clearColor];
        placeholderLabel.numberOfLines = 0; //设置可以输入多行文字时可以自动换行
        [self addSubview:placeholderLabel];
        self.placeholderLabel = placeholderLabel; //赋值保存
        self.myPlaceholderColor = color; //设置占位文字默认颜色
        self.font = [UIFont systemFontOfSize:font]; //设置默认的字体
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self]; //通知:监听文字的改变
    }
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:UITextViewTextDidChangeNotification];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.placeholderLabel setOrigin:CGPointMake(5, 7 * ScreenRatio_6)];
    self.placeholderLabel.width = self.width - 5 * 2.0;
    //根据文字计算高度
    CGSize maxSize = CGSizeMake(self.placeholderLabel.width,MAXFLOAT);
    self.placeholderLabel.height = [self.myPlaceholder boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.placeholderLabel.font} context:nil].size.height;
    
}
#pragma mark -监听文字改变

- (void)textDidChange{
    self.placeholderLabel.hidden = self.hasText;
}

#pragma mark - set
- (void)setMyPlaceholder:(NSString *)myPlaceholder{
    _myPlaceholder = [myPlaceholder copy];
    //设置文字
    self.placeholderLabel.text = myPlaceholder;
    //重新计算子控件frame
    [self setNeedsLayout];
    
}

- (void)setMyPlaceholderColor:(UIColor *)myPlaceholderColor{
    _myPlaceholderColor = myPlaceholderColor;
    //设置颜色
    self.placeholderLabel.textColor = myPlaceholderColor;
}

- (void)setFont:(UIFont *)font{
    [super setFont:font];
    self.placeholderLabel.font = font;
    //重新计算子控件frame
    [self setNeedsLayout];
    
}

- (void)setText:(NSString *)text{
    [super setText:text];
    [self textDidChange];
}

- (void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];
    [self textDidChange];
}

@end

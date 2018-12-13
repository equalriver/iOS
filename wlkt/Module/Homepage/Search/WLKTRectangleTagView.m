//
//  WLKTRectangleTagView.m
//  wlkt
//
//  Created by slovelys on 17/3/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTRectangleTagView.h"
#import <UIView+PYSearchExtension.h>

static CGFloat const tagPadding = 15;
static CGFloat const tagHeight = 36;
static NSUInteger const maxTagNumerLine = 4;

@implementation WLKTRectangleTagView

- (instancetype)initWithTextArray:(NSArray *)array {
    WLKT_INIT(
              [self setupTagWithTextArray:array];
    )
}

- (void)setupTagWithTextArray:(NSArray *)array {
    self.backgroundColor = [UIColor whiteColor];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [cancelButton setTitle:@"^" forState:UIControlStateNormal];
    [cancelButton setImage:[UIImage imageNamed:@"arrow_up"] forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    cancelButton.frame = CGRectMake(kScreenWidth - 40, 0, 40, 30);
    [cancelButton addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelButton];
    

    CGFloat tagWidth = (kScreenWidth - tagPadding * (maxTagNumerLine + 1)) / maxTagNumerLine;
    [array enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *rectangleTag = [[UIButton alloc] init];
        rectangleTag.tag = idx;
        rectangleTag.layer.cornerRadius = tagHeight / 2;
        rectangleTag.userInteractionEnabled = YES;
        rectangleTag.titleLabel.font = [UIFont systemFontOfSize:14];
        rectangleTag.backgroundColor = [UIColor clearColor];
        [rectangleTag setTitle:obj forState:UIControlStateNormal];
        rectangleTag.layer.cornerRadius = tagHeight / 2;
        rectangleTag.layer.borderColor = [UIColor grayColor].CGColor;
        rectangleTag.layer.borderWidth = 1;
        [rectangleTag setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        rectangleTag.height = tagHeight;
        NSInteger index = idx % maxTagNumerLine;
        NSInteger page = idx / maxTagNumerLine;
        rectangleTag.frame = CGRectMake(index * (tagWidth + tagPadding) + tagPadding, page * (tagHeight + tagPadding) + tagPadding + 50, tagWidth, tagHeight);
        
        [rectangleTag addTarget:self action:@selector(labelClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rectangleTag];
    }];
    
}

- (void)cancelBtnClick:(UIButton *)sender {
    if ([self.rectangleViewDelegate respondsToSelector:@selector(didTapCancelButton)]) {
        [self.rectangleViewDelegate didTapCancelButton];
    }
}

- (void)labelClick:(UIButton *)sender {
    if ([self.rectangleViewDelegate respondsToSelector:@selector(didSelectItemAtIndex:)]) {
        [self.rectangleViewDelegate didSelectItemAtIndex:sender.tag];
    }
}

- (void)removeRectangleTagView {
    [self removeFromSuperview];
}

@end

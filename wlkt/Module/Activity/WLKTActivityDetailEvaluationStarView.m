//
//  WLKTActivityDetailEvaluationStarView.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityDetailEvaluationStarView.h"

@interface WLKTActivityDetailEvaluationStarView ()
@property (strong, nonatomic) UIButton *allButton;
@property (strong, nonatomic) UIButton *star_5_Button;
@property (strong, nonatomic) UIButton *star_4_Button;
@property (strong, nonatomic) UIButton *star_3_Button;
@property (strong, nonatomic) UIButton *star_2_Button;
@property (strong, nonatomic) UIButton *star_1_Button;
@property (strong, nonatomic) UIView *separatorView;
@property (copy, nonatomic) NSArray *starBtnsArr;
@end

@implementation WLKTActivityDetailEvaluationStarView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        [self addSubview:self.allButton];
        [self addSubview:self.star_1_Button];
        [self addSubview:self.star_2_Button];
        [self addSubview:self.star_3_Button];
        [self addSubview:self.star_4_Button];
        [self addSubview:self.star_5_Button];
        [self addSubview:self.separatorView];
        _starBtnsArr = @[self.allButton, self.star_1_Button, self.star_2_Button, self.star_3_Button, self.star_4_Button, self.star_5_Button];
        [self makeConstraints];
    }
    return self;
}

- (void)setStarWithData:(WLKTActivityCommentStar *)data{
    [self.allButton setTitle:[NSString stringWithFormat:@"全部(%@)", data.total] forState:UIControlStateNormal];
    [self.star_1_Button setTitle:[NSString stringWithFormat:@"一星(%@)", data.one] forState:UIControlStateNormal];
    [self.star_2_Button setTitle:[NSString stringWithFormat:@"二星(%@)", data.two] forState:UIControlStateNormal];
    [self.star_3_Button setTitle:[NSString stringWithFormat:@"三星(%@)", data.three] forState:UIControlStateNormal];
    [self.star_4_Button setTitle:[NSString stringWithFormat:@"四星(%@)", data.four] forState:UIControlStateNormal];
    [self.star_5_Button setTitle:[NSString stringWithFormat:@"五星(%@)", data.five] forState:UIControlStateNormal];
}

- (void)makeConstraints{
    [self.allButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self).offset(10 * ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(75 *ScreenRatio_6, 20 *ScreenRatio_6));
    }];
    [self.star_5_Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.allButton.mas_right).offset(15 *ScreenRatio_6);
        make.top.mas_equalTo(self).offset(10 * ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(75 *ScreenRatio_6, 20 *ScreenRatio_6));
    }];
    [self.star_4_Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.star_5_Button.mas_right).offset(15 *ScreenRatio_6);
        make.top.mas_equalTo(self).offset(10 * ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(75 *ScreenRatio_6, 20 *ScreenRatio_6));
    }];
    [self.star_3_Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.star_4_Button.mas_right).offset(15 *ScreenRatio_6);
        make.top.mas_equalTo(self).offset(10 * ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(75 *ScreenRatio_6, 20 *ScreenRatio_6));
    }];
    [self.star_2_Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.allButton.mas_bottom).offset(15 *ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(75 *ScreenRatio_6, 20 *ScreenRatio_6));
    }];
    [self.star_1_Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.star_2_Button.mas_right).offset(15 *ScreenRatio_6);
        make.centerY.mas_equalTo(self.star_2_Button);
        make.size.mas_equalTo(CGSizeMake(75 *ScreenRatio_6, 20 *ScreenRatio_6));
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
}

- (UIButton *)createStarButtonWithStarNumber:(NSString *)number{
    UIButton *b = [UIButton new];
    b.titleLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
    [b setTitle:[NSString stringWithFormat:@"%@星", number] forState:UIControlStateNormal];
    if ([number isEqualToString:@"全部"]) {
        [b setTitle:[NSString stringWithFormat:@"%@", number] forState:UIControlStateNormal];
    }
    b.layer.masksToBounds = YES;
    b.layer.cornerRadius = 10 *ScreenRatio_6;
    b.layer.borderWidth = 0.5;
    b.layer.borderColor = UIColorHex(33c4da).CGColor;
    [b setTitleColor:UIColorHex(33c4da) forState:UIControlStateNormal];
    [b setTitleColor:UIColorHex(ffffff) forState:UIControlStateSelected];
    [b setBackgroundImage:[UIImage imageWithColor:UIColorHex(ffffff)] forState:UIControlStateNormal];
    [b setBackgroundImage:[UIImage imageWithColor:UIColorHex(33c4da)] forState:UIControlStateSelected];
    [b addTarget:self action:@selector(starBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    return b;
}

- (void)starBtnAct:(UIButton *)sender{
    for (UIButton *obj in self.starBtnsArr) {
        if (obj.tag == sender.tag) {
            [obj setSelected:YES];
        }
        else{
            [obj setSelected:NO];
        }
    }
    
    if ([self.delegate respondsToSelector:@selector(didSelectedStarItem:)]) {
        [self.delegate didSelectedStarItem:sender.tag];
    }
}

#pragma mark - get
- (UIButton *)allButton{
    if (!_allButton) {
        _allButton = [self createStarButtonWithStarNumber:@"全部"];
        _allButton.tag = 0;
        _allButton.selected = YES;
    }
    return _allButton;
}
- (UIButton *)star_1_Button{
    if (!_star_1_Button) {
        _star_1_Button = [self createStarButtonWithStarNumber:@"一"];
        _star_1_Button.tag = 1;
    }
    return _star_1_Button;
}
- (UIButton *)star_2_Button{
    if (!_star_2_Button) {
        _star_2_Button = [self createStarButtonWithStarNumber:@"二"];
        _star_2_Button.tag = 2;
    }
    return _star_2_Button;
}
- (UIButton *)star_3_Button{
    if (!_star_3_Button) {
        _star_3_Button = [self createStarButtonWithStarNumber:@"三"];
        _star_3_Button.tag = 3;
    }
    return _star_3_Button;
}
- (UIButton *)star_4_Button{
    if (!_star_4_Button) {
        _star_4_Button = [self createStarButtonWithStarNumber:@"四"];
        _star_4_Button.tag = 4;
    }
    return _star_4_Button;
}
- (UIButton *)star_5_Button{
    if (!_star_5_Button) {
        _star_5_Button = [self createStarButtonWithStarNumber:@"五"];
        _star_5_Button.tag = 5;
    }
    return _star_5_Button;
}
- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}

@end



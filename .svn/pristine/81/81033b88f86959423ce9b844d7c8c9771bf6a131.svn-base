//
//  WLKTUseRuleAlertView.m
//  wlkt
//
//  Created by 尹平江 on 2017/8/14.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUseRuleAlertView.h"

@implementation WLKTUseRuleAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.titleLabel];
        [self.bgView addSubview:self.detailTextView];
        [self.bgView addSubview:self.defaultBtn];
        [self makeConstraints];
        [self.defaultBtn addTarget:self action:@selector(defaultBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)defaultBtnAct:(UIButton *)sender{
    [self removeFromSuperview];
}

- (void)setData:(WLKTCouponRuleData *)data{
    NSString *str = nil;
    str = [NSString stringWithFormat:@"%@\n%@", data.title, [data.rule componentsJoinedByString:@"\n"]];
    if (str == nil) {
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 7;// 字体的行间距
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:11],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    self.detailTextView.attributedText = [[NSAttributedString alloc] initWithString:str attributes:attributes];
}

#pragma mark - makeConstraints
- (void)makeConstraints{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(265 * ScreenRatio_6, 265 * ScreenRatio_6));
        make.top.mas_equalTo(self).offset(130 * ScreenRatio_6);
        make.centerX.mas_equalTo(self);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 20));
        make.top.mas_equalTo(self.bgView).offset(15 * ScreenRatio_6);
        make.centerX.mas_equalTo(self.bgView);
    }];
    [self.detailTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(240 * ScreenRatio_6, 150 * ScreenRatio_6));
        make.left.mas_equalTo(self.bgView).offset(10);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(15 * ScreenRatio_6);
    }];
    [self.defaultBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(110, 35));
        make.top.mas_equalTo(self.detailTextView.mas_bottom).offset(10);
        make.centerX.mas_equalTo(self.bgView);
    }];
}

#pragma mark - get
- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius = 3;
    }
    return _bgView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#33c4da"];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"使用规则";
    }
    return _titleLabel;
}
- (YYTextView *)detailTextView{
    if (!_detailTextView) {
        _detailTextView = [[YYTextView alloc]init];
//        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//        paragraphStyle.lineSpacing = 7;// 字体的行间距
//        
//        NSDictionary *attributes = @{
//                                     NSFontAttributeName:[UIFont systemFontOfSize:15],
//                                     NSParagraphStyleAttributeName:paragraphStyle
//                                     };
//        _detailTextView.attributedText = [[NSAttributedString alloc] initWithString:@"适用平台：未来课堂PC、APP\n1.每单限用一张，一次性使用，不找零。\n2.不可与其他优惠券叠加使用。\n3.本券不能与其他优惠活动同享。\n4.如报名时未使用本券，则视作自动放弃。\n5.本券不可退换，超过有效时间将无法使用。\n6.本优惠券与账户绑定，不可转让。" attributes:attributes];
    }
    return _detailTextView;
}
- (UIButton *)defaultBtn{
    if (!_defaultBtn) {
        _defaultBtn = [[UIButton alloc]init];
        [_defaultBtn setTitle:@"我知道了" forState:UIControlStateNormal];
        [_defaultBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _defaultBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _defaultBtn.backgroundColor = UIColorHex(33c4da);
        _defaultBtn.layer.masksToBounds = YES;
        _defaultBtn.layer.cornerRadius = 17;
    }
    return _defaultBtn;
}

@end

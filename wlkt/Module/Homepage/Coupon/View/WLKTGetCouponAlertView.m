//
//  WLKTGetCouponAlertView.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/17.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTGetCouponAlertView.h"

@implementation WLKTGetCouponAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.6];
        [self addSubview:self.centerView];
        [self.centerView addSubview:self.centerContentView];
        [self.centerContentView addSubview:self.firstLabel];
        [self.centerContentView addSubview:self.secondLabel];
        [self.centerContentView addSubview:self.goMyCouponBtn];
        [self.centerContentView addSubview:self.shutDownBtn];
        [self makeConstraints];
    }
    return self;
}

#pragma mark - makeConstraints
- (void)makeConstraints{
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 180));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(215 * ScreenRatio_6);
    }];
    [self.centerContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(295, 175));
        make.center.mas_equalTo(self.centerView);
    }];
    [self.firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(290, 25));
        make.centerX.mas_equalTo(self.centerContentView);
        make.top.mas_equalTo(self.centerContentView).offset(40);
    }];
    [self.secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(290, 25));
        make.centerX.mas_equalTo(self.centerContentView);
        make.top.mas_equalTo(self.firstLabel.mas_bottom).offset(12);
    }];
    [self.goMyCouponBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.centerContentView);
        make.top.mas_equalTo(self.secondLabel.mas_bottom).offset(27);
    }];
    [self.shutDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.centerContentView.mas_right).offset(-5);
        make.top.mas_equalTo(self.centerContentView).offset(5);
    }];
}

#pragma mark - get
- (UIView *)centerView{
    if (!_centerView) {
        _centerView = [[UIView alloc]init];
        _centerView.backgroundColor = [UIColor colorWithHexString:@"#fa9f2a"];
        _centerView.layer.cornerRadius = 2.5;
        _centerView.layer.masksToBounds = YES;
    }
    return _centerView;
}
- (UIView *)centerContentView{
    if (!_centerContentView) {
        _centerContentView = [[UIView alloc]init];
        _centerContentView.backgroundColor = [UIColor colorWithHexString:@"#fefff1"];
    }
    return _centerContentView;
}
- (UILabel *)firstLabel{
    if (!_firstLabel) {
        _firstLabel = [[UILabel alloc]init];
        _firstLabel.font = [UIFont systemFontOfSize:19];
        _firstLabel.textColor = [UIColor colorWithHexString:@"#320000"];
        _firstLabel.textAlignment = NSTextAlignmentCenter;
        _firstLabel.text = @"恭喜您！您成功领取了优惠券";
    }
    return _firstLabel;
}
- (UILabel *)secondLabel{
    if (!_secondLabel) {
        _secondLabel = [[UILabel alloc]init];
        _secondLabel.font = [UIFont systemFontOfSize:16];
        _secondLabel.textAlignment = NSTextAlignmentCenter;
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"可前往“我的优惠券”中查看"];
        [str setAttributes:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle)} range:NSMakeRange(4, 5)];
        _secondLabel.attributedText = str;
    }
    return _secondLabel;
}
- (UIButton *)goMyCouponBtn{
    if (!_goMyCouponBtn) {
        _goMyCouponBtn = [[UIButton alloc]init];
        [_goMyCouponBtn setTitle:@"去使用" forState:UIControlStateNormal];
        [_goMyCouponBtn setBackgroundImage:[UIImage imageNamed:@"领券中心按钮2"] forState:UIControlStateNormal];
        [_goMyCouponBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _goMyCouponBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _goMyCouponBtn;
}
- (UIButton *)shutDownBtn{
    if (!_shutDownBtn) {
        _shutDownBtn = [[UIButton alloc]init];
        [_shutDownBtn setImage:[UIImage imageNamed:@"领券中心关闭"] forState:UIControlStateNormal];

    }
    return _shutDownBtn;
}

@end

//
//  WLKTConfirmOrderCouponCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTConfirmOrderCouponCell.h"
#import "WLKTExchangeButton.h"

@interface WLKTConfirmOrderCouponCell ()
@property (strong, nonatomic) UILabel *couponTitleLabel;
@property (strong, nonatomic) UILabel *couponNumLabel;
@property (strong, nonatomic) WLKTExchangeButton *couponBtn;
@property (strong, nonatomic) UIView *separatorView_1;

@end

@implementation WLKTConfirmOrderCouponCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.couponTitleLabel];
        [self.contentView addSubview:self.couponNumLabel];
        [self.contentView addSubview:self.couponBtn];
        [self.contentView addSubview:self.separatorView_1];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellTitle:(NSString *)title couponCount:(NSInteger)count youhuiPrice:(NSInteger)price{
    if (count != 0) {
        self.couponNumLabel.hidden = NO;
        self.couponNumLabel.text = [NSString stringWithFormat:@"%ld张可用", (long)count];
    }
    else{
        self.couponNumLabel.hidden = YES;
    }
    if (price > 0) {
        [self.couponBtn setTitle:[NSString stringWithFormat:@"-¥%ld  ", (long)price] forState:UIControlStateNormal];
    }
    self.couponTitleLabel.text = title;
}

#pragma mark - make constraints
- (void)makeConstraints{
    [self.couponTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.couponNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(55, 16));
        make.left.mas_equalTo(self.couponTitleLabel.mas_right).offset(8);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.couponBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.separatorView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.left.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
}

#pragma mark - get
- (UILabel *)couponTitleLabel{
    if (!_couponTitleLabel) {
        _couponTitleLabel = [UILabel new];
        _couponTitleLabel.font = [UIFont systemFontOfSize:14];
        _couponTitleLabel.textColor = KMainTextColor_3;

    }
    return _couponTitleLabel;
}
- (UILabel *)couponNumLabel{
    if (!_couponNumLabel) {
        _couponNumLabel = [UILabel new];
        _couponNumLabel.font = [UIFont systemFontOfSize:12];
        _couponNumLabel.textColor = UIColorHex(ffffff);
        _couponNumLabel.backgroundColor = UIColorHex(ee402d);
        _couponNumLabel.layer.masksToBounds = YES;
        _couponNumLabel.layer.cornerRadius = 1.5;
        _couponNumLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _couponNumLabel;
}
- (WLKTExchangeButton *)couponBtn{
    if (!_couponBtn) {
        _couponBtn = [WLKTExchangeButton new];
        [_couponBtn setTitleColor:KMainTextColor_3 forState:UIControlStateNormal];
        [_couponBtn setImage:[UIImage imageNamed:@"课程详情进入"] forState:UIControlStateNormal];
        _couponBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _couponBtn;
}
- (UIView *)separatorView_1{
    if (!_separatorView_1) {
        _separatorView_1 = [UIView new];
        _separatorView_1.backgroundColor = separatorView_color;
    }
    return _separatorView_1;
}

@end

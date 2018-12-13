//
//  WLKTGoCouponShopCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTGoCouponShopHeadCell.h"

@implementation WLKTGoCouponShopHeadCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.bgIV];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.useTimeLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.ruleButton];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellData:(WLKTGoSaleCourseInfo *)data{
    if (data) {
        self.titleLabel.text = data.title;
        self.useTimeLabel.text = [NSString stringWithFormat:@"有效时间：%@", data.time];
        self.priceLabel.text = [NSString stringWithFormat:@"折扣额度：¥%@（%@）", data.money, data.rule];
    }
}

#pragma mark - make constraints
- (void)makeConstraints{
    [self.bgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.contentView);
        make.center.mas_equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth - 20, 20));
        make.left.mas_equalTo(self.contentView).offset(20);
        make.top.mas_equalTo(self.contentView).offset(15);
    }];
    [self.useTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth - 20, 15));
        make.left.mas_equalTo(self.contentView).offset(20);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(165, 15));
        make.left.mas_equalTo(self.contentView).offset(20);
        make.top.mas_equalTo(self.useTimeLabel.mas_bottom).offset(10);
    }];
    [self.ruleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 17));
        make.left.mas_equalTo(self.priceLabel.mas_right);
        make.centerY.mas_equalTo(self.priceLabel);
    }];
}

#pragma mark - get
- (UIImageView *)bgIV{
    if (!_bgIV) {
        _bgIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"马上逛逛底板"]];
    }
    return _bgIV;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightSemibold];
        _titleLabel.textColor = UIColorHex(ffffff);
    }
    return _titleLabel;
}
- (UILabel *)useTimeLabel{
    if (!_useTimeLabel) {
        _useTimeLabel = [[UILabel alloc]init];
        _useTimeLabel.font = [UIFont systemFontOfSize:11 weight:UIFontWeightSemibold];
        _useTimeLabel.textColor = UIColorHex(ffffff);
    }
    return _useTimeLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:11 weight:UIFontWeightSemibold];
        _priceLabel.textColor = UIColorHex(ffffff);
    }
    return _priceLabel;
}
- (UIButton *)ruleButton{
    if (!_ruleButton) {
        _ruleButton = [[UIButton alloc]init];
        [_ruleButton setTitle:@"使用规则" forState:UIControlStateNormal];
        [_ruleButton setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        _ruleButton.titleLabel.font = [UIFont systemFontOfSize:11 weight:UIFontWeightSemibold];
        _ruleButton.layer.cornerRadius = 1.5;
        _ruleButton.layer.masksToBounds = YES;
        _ruleButton.layer.borderColor = UIColorHex(ffffff).CGColor;
        _ruleButton.layer.borderWidth = 1;
    }
    return _ruleButton;
}

@end

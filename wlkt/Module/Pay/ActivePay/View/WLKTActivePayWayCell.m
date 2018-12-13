//
//  WLKTActivePayWayCell.m
//  wlkt
//
//  Created by 尹平江 on 2017/7/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivePayWayCell.h"

@implementation WLKTActivePayWayCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.bankIconImageView];
        [self.contentView addSubview:self.bankTitle];
        [self.contentView addSubview:self.tianfuPayDetailLabel];
        [self.contentView addSubview:self.checkImageView];
        [self.contentView addSubview:self.separatorView_1];
    }
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];

    return self;
}

- (void)updateConstraints{
    [self.bankIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20 * ScreenRatio_6, 20 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(20 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.bankTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 25 * ScreenRatio_6));
        make.left.mas_equalTo(self.bankIconImageView.mas_right).offset(10 *ScreenRatio_6);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.tianfuPayDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth * 0.5, 15 * ScreenRatio_6));
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.bankTitle.mas_right).offset(3);
    }];
    [self.separatorView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 1));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(1);
    }];
    [self.checkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20 * ScreenRatio_6, 20 * ScreenRatio_6));
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.contentView);
    }];
    
    [super updateConstraints];
}

#pragma mark - get

- (UIImageView *)bankIconImageView{
    if (!_bankIconImageView) {
        _bankIconImageView = [[UIImageView alloc]init];
        
    }
    return _bankIconImageView;
}
- (UILabel *)bankTitle{
    if (!_bankTitle) {
        _bankTitle = [[UILabel alloc]init];
        _bankTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        _bankTitle.font = [UIFont systemFontOfSize:14];
    }
    return _bankTitle;
}
- (UILabel *)tianfuPayDetailLabel{
    if (!_tianfuPayDetailLabel) {
        _tianfuPayDetailLabel = [[UILabel alloc]init];
        _tianfuPayDetailLabel.text = @"推荐使用天府银行支付";
        _tianfuPayDetailLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        _tianfuPayDetailLabel.font = [UIFont systemFontOfSize:11];
    }
    return _tianfuPayDetailLabel;
}

- (UIView *)separatorView_1{
    if (!_separatorView_1) {
        _separatorView_1 = [[UIView alloc]init];
        _separatorView_1.backgroundColor = fillViewColor;
    }
    return _separatorView_1;
}

- (UIImageView *)checkImageView{
    if (!_checkImageView) {
        _checkImageView = [[UIImageView alloc]init];
        
    }
    return _checkImageView;
}


@end

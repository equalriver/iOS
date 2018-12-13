//
//  WLKTActivePayWayBottomCell.m
//  wlkt
//
//  Created by 尹平江 on 2017/7/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivePayWayBottomCell.h"

@implementation WLKTActivePayWayBottomCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.otherPayBtn];
        [self.contentView addSubview:self.otherPayIcon];
    }
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];

    return self;
}

#pragma mark - constraints
- (void)updateConstraints{
    [self.otherPayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(110, 20 * ScreenRatio_6));
        make.center.mas_equalTo(self.contentView);
    }];
    [self.otherPayIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15 * ScreenRatio_6, 15 * ScreenRatio_6));
        make.centerY.mas_equalTo(self.otherPayBtn);
        make.left.mas_equalTo(self.otherPayBtn.mas_right);
    }];
    [super updateConstraints];
}

#pragma mark - 
- (UIButton *)otherPayBtn{
    if (!_otherPayBtn) {
        _otherPayBtn = [[UIButton alloc]init];
        [_otherPayBtn setTitle:@"选择更多支付方式" forState:UIControlStateNormal];
        [_otherPayBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
        _otherPayBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        _otherPayBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _otherPayBtn;
}
- (UIImageView *)otherPayIcon{
    if (!_otherPayIcon) {
        _otherPayIcon = [[UIImageView alloc]init];
        _otherPayIcon.image = [UIImage imageNamed:@"moreButton"];
    }
    return _otherPayIcon;
}

@end

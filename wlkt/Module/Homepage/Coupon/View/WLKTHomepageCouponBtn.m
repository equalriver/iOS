//
//  WLKTHomepageCouponBtn.m
//  wlkt
//
//  Created by 尹平江 on 2017/8/16.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTHomepageCouponBtn.h"

@interface WLKTHomepageCouponBtn ()
@property (strong, nonatomic) UIImageView *couponBtnTitleIV;
@property (strong, nonatomic) UILabel *couponTitleLabel;
@property (strong, nonatomic) UIImageView *couponBtnIconIV;

@end

@implementation WLKTHomepageCouponBtn

- (instancetype)initWithTitleImg:(UIImage *)titleImg title:(NSString *)title icon:(UIImage *)icon
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        self.couponBtnTitleIV.image = titleImg;
        self.couponTitleLabel.text = title;
        self.couponBtnIconIV.image = icon;
        [self addSubview:self.couponBtnTitleIV];
        [self addSubview:self.couponTitleLabel];
        [self addSubview:self.couponBtnIconIV];
        [self makeConstraints];
    }
    return self;
}

#pragma mark - makeConstraints
- (void)makeConstraints{
    [self.couponBtnTitleIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 15));
        make.left.mas_equalTo(self).offset(27 * ScreenRatio_6);
        make.top.mas_equalTo(self).offset(20 * ScreenRatio_6);
    }];
    [self.couponTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(75, 15));
        make.top.mas_equalTo(self.couponBtnTitleIV.mas_bottom);
        make.left.mas_equalTo(self).offset(27 * ScreenRatio_6);
    }];
    [self.couponBtnIconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60 * ScreenRatio_6, 60 * ScreenRatio_6));
        make.right.mas_equalTo(self.mas_right).offset(-15 * ScreenRatio_6);
        make.top.mas_equalTo(self).offset(15 * ScreenRatio_6);
    }];
}

#pragma mark - get
- (UIImageView *)couponBtnTitleIV{
    if (!_couponBtnTitleIV) {
        _couponBtnTitleIV = [[UIImageView alloc]init];
    }
    return _couponBtnTitleIV;
}
- (UILabel *)couponTitleLabel{
    if (!_couponTitleLabel) {
        _couponTitleLabel = [[UILabel alloc]init];
        _couponTitleLabel.font = [UIFont systemFontOfSize:9];
        _couponTitleLabel.textColor = [UIColor colorWithHexString:@"#b7b7b7"];
    }
    return _couponTitleLabel;
}
- (UIImageView *)couponBtnIconIV{
    if (!_couponBtnIconIV) {
        _couponBtnIconIV = [[UIImageView alloc]init];
    }
    return _couponBtnIconIV;
}

@end

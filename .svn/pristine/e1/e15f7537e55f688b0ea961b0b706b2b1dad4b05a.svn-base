//
//  WLKTHomepageCouponView.m
//  wlkt
//
//  Created by 尹平江 on 2017/8/16.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTHomepageCouponView.h"

@implementation WLKTHomepageCouponView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.fillView_1];
        [self addSubview:self.titleIV];
        [self addSubview:self.separatorView_1];
        [self addSubview:self.couponCenterBtn];
        [self addSubview:self.separatorView_2];
        [self addSubview:self.couponSaleBtn];
        //[self addSubview:self.fillView_2];
        [self makeConstraints];
    }
    return self;
}

#pragma mark - makeConstraints
- (void)makeConstraints{
    [self.fillView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 5));
        make.left.mas_equalTo(self);
        make.top.mas_equalTo(self);
    }];
    [self.titleIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(130 * ScreenRatio_6, 20 * ScreenRatio_6));
        make.left.mas_equalTo(self).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self).offset(15 * ScreenRatio_6);
    }];
    [self.separatorView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.left.mas_equalTo(self);
        make.top.mas_equalTo(self.titleIV.mas_bottom).offset(10 * ScreenRatio_6);
    }];
    [self.couponCenterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(185 * ScreenRatio_6, 90 * ScreenRatio_6));
        make.left.mas_equalTo(self);
        make.top.mas_equalTo(self.separatorView_1.mas_bottom);
    }];
    [self.separatorView_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(0.5, 90 * ScreenRatio_6));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.separatorView_1.mas_bottom);
    }];
    [self.couponSaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(185 * ScreenRatio_6, 90 * ScreenRatio_6));
        make.right.mas_equalTo(self.mas_right);
        make.top.mas_equalTo(self.separatorView_1.mas_bottom);
    }];
//    [self.fillView_2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 5));
//        make.top.mas_equalTo(self.couponCenterBtn.mas_bottom);
//        make.left.mas_equalTo(self);
//    }];
}

#pragma mark - get
- (UIView *)fillView_1{
    if (!_fillView_1) {
        _fillView_1 = [[UIView alloc]init];
        _fillView_1.backgroundColor = fillViewColor;
    }
    return _fillView_1;
}
- (UIImageView *)titleIV{
    if (!_titleIV) {
        _titleIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"优惠券首页标题"]];
    }
    return _titleIV;
}
- (UIView *)separatorView_1{
    if (!_separatorView_1) {
        _separatorView_1 = [[UIView alloc]init];
        _separatorView_1.backgroundColor = separatorView_color;
    }
    return _separatorView_1;
}
- (WLKTHomepageCouponBtn *)couponCenterBtn{
    if (!_couponCenterBtn) {
        _couponCenterBtn = [[WLKTHomepageCouponBtn alloc]initWithTitleImg:[UIImage imageNamed:@"优惠券首页领劵中心"] title:@"先领券，再购课" icon:[UIImage imageNamed:@"优惠券首页领券"]];
    }
    return _couponCenterBtn;
}
- (UIView *)separatorView_2{
    if (!_separatorView_2) {
        _separatorView_2 = [[UIView alloc]init];
        _separatorView_2.backgroundColor = separatorView_color;
    }
    return _separatorView_2;
}
- (WLKTHomepageCouponBtn *)couponSaleBtn{
    if (!_couponSaleBtn) {
        _couponSaleBtn = [[WLKTHomepageCouponBtn alloc]initWithTitleImg:[UIImage imageNamed:@"优惠券首页限时特价"] title:@"优选好课限时热售" icon:[UIImage imageNamed:@"优惠券首页打折"]];
    }
    return _couponSaleBtn;
}
//- (UIView *)fillView_2{
//    if (!_fillView_2) {
//        _fillView_2 = [[UIView alloc]init];
//        _fillView_2.backgroundColor = fillViewColor;
//    }
//    return _fillView_2;
//}

@end

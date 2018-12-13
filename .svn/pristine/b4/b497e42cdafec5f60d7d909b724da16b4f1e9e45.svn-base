//
//  WLKTCDAppointmentStateAlert.m
//  wlkt
//
//  Created by 尹平江 on 2018/4/17.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDAppointmentStateAlert.h"

@interface WLKTCDAppointmentStateAlert ()
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIView *shadowView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *iconIV;

@end

@implementation WLKTCDAppointmentStateAlert
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.shadowView];
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLabel];
        [self makeConstraints];

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            [self removeFromSuperview];
        }];
        [self addGestureRecognizer:tap];

    }
    return self;
}

- (void)setState:(CDAppointmentState)state{
    switch (state) {
            case CDAppointmentStateSuccess:
            self.titleLabel.text = @"预约成功";
            self.titleLabel.textColor = UIColorHex(f6c447);
            self.iconIV.image = [UIImage imageNamed:@"预约成功"];
            break;
            case CDAppointmentStatefail:
            self.titleLabel.text = @"预约失败，稍后再试";
            self.titleLabel.textColor = UIColorHex(aaaaaa);
            self.iconIV.image = [UIImage imageNamed:@"预约失败"];
            break;
        default:
            break;
    }
}

#pragma mark -
- (void)makeConstraints{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200 *ScreenRatio_6, 150 *ScreenRatio_6));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(160 *ScreenRatio_6);
    }];
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.size.mas_equalTo(self.contentView);
          make.center.mas_equalTo(self.contentView);
      }];
    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
         make.size.mas_equalTo(CGSizeMake(60 *ScreenRatio_6, 60 *ScreenRatio_6));
         make.top.mas_equalTo(self.contentView).offset(20 *ScreenRatio_6);
         make.centerX.mas_equalTo(self.contentView);
     }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.mas_equalTo(self.contentView);
        make.height.mas_equalTo(20 *ScreenRatio_6);
        make.top.mas_equalTo(self.iconIV.mas_bottom).offset(15 *ScreenRatio_6);
    }];
    
}

#pragma mark - get
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 5 *ScreenRatio_6;
    }
    return _contentView;
}
- (UIView *)shadowView{
    if (!_shadowView){
        _shadowView = [UIView new];
        _shadowView.layer.shadowColor = KMainTextColor_6.CGColor;
        _shadowView.layer.shadowOffset = CGSizeMake(0, 0);
        _shadowView.layer.shadowOpacity = 1.0;
        _shadowView.layer.shadowRadius = 5 *ScreenRatio_6;
    }
    return _shadowView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6 weight:UIFontWeightSemibold];
        _titleLabel.textAlignment = NSTextAlignmentCenter;

    }
    return _titleLabel;
}
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [UIImageView new];
    }
    return _iconIV;
}

@end


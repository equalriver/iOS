//
//  WLKTCDPinAlertView.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/19.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDPinAlertView.h"

@interface WLKTCDPinAlertView ()
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *closeBtn;
@end

@implementation WLKTCDPinAlertView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.closeBtn];
        [self makeConstraints];
        [self makeItemView];
        
        [UIView viewAnimateComeOutWithDuration:0.5 delay:0 target:self.contentView completion:^(BOOL finished) {
            
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            [UIView viewAnimateDismissWithDuration:0.5 delay:0 target:self.contentView completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)makeItemView{
    UIView *one = [self createRuleView:@"1" title:@"通过拼团通道购买课程不再享受折扣、满减等优惠"];
    UIView *two = [self createRuleView:@"2" title:@"如果在结束时间内还未达到开团条件，系统自动撤销所有拼团人订单并自动退费"];
    UIView *three = [self createRuleView:@"3" title:@"每个ID只能对该拼团进行一次消费购买"];
    [self.contentView addSubview:one];
    [self.contentView addSubview:two];
    [self.contentView addSubview:three];
    [one mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth -30 *ScreenRatio_6, 55 *ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(15 *ScreenRatio_6);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10 *ScreenRatio_6);
    }];
    [two mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth -30 *ScreenRatio_6, 55 *ScreenRatio_6));
        make.top.mas_equalTo(one.mas_bottom);
        make.left.mas_equalTo(one);
    }];
    [three mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth -30 *ScreenRatio_6, 55 *ScreenRatio_6));
        make.top.mas_equalTo(two.mas_bottom);
        make.left.mas_equalTo(two);
    }];
}

- (void)closeBtnAct{
    [UIView viewAnimateDismissWithDuration:0.5 delay:0 target:self.contentView completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (UIView *)createRuleView:(NSString *)number title:(NSString *)title {
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor whiteColor];
    
    UILabel *l = [UILabel new];
    l.backgroundColor = KMainTextColor_9;
    l.textColor = [UIColor whiteColor];
    l.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
    l.textAlignment = NSTextAlignmentCenter;
    l.layer.masksToBounds = YES;
    l.layer.cornerRadius = 2;
    l.text = number;
    [v addSubview:l];
    [l mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(17 *ScreenRatio_6, 17 *ScreenRatio_6));
        make.left.mas_equalTo(v);
        make.top.mas_equalTo(v).offset(10 *ScreenRatio_6);
    }];
    
    UILabel *detail = [UILabel new];
    detail.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
    detail.textColor = KMainTextColor_3;
    detail.numberOfLines = 2;
    detail.text = title;
    detail.lineBreakMode = NSLineBreakByCharWrapping;
    [detail alignTop];
    [v addSubview:detail];
    [detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(l.mas_right).offset(5);
        make.top.right.bottom.mas_equalTo(v);
    }];
    
    return v;
}

- (void)makeConstraints{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 25 *ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(15 *ScreenRatio_6);
    }];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 50 *ScreenRatio_6));
        make.centerX.bottom.mas_equalTo(self.contentView);
    }];
}

#pragma mark - get
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 370 *ScreenRatio_6)];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:18 *ScreenRatio_6];
        _titleLabel.textColor = KMainTextColor_3;
        _titleLabel.text = @"拼购规则";
    }
    return _titleLabel;
}
- (UIButton *)closeBtn{
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        _closeBtn.titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        _closeBtn.backgroundColor = kMainTextColor_red;
        [_closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
        [_closeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(closeBtnAct) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

@end


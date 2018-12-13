//
//  WLKTCDMoreQuestionSucessAlert.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/22.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDMoreQuestionSucessAlert.h"

@interface WLKTCDMoreQuestionSucessAlert ()
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIImageView *iconIV;
@property (strong, nonatomic) UILabel *stateLabel;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIView *sepView;
@property (strong, nonatomic) UILabel *promptLabel_1;
@property (strong, nonatomic) UILabel *promptLabel_2;
@property (strong, nonatomic) UIButton *confirmBtn;

@property (copy, nonatomic) void(^callback)(UIView *v);
@end

@implementation WLKTCDMoreQuestionSucessAlert
- (instancetype)initWithFrame:(CGRect)frame callback:(void(^)(UIView *v))callback
{
    self = [super initWithFrame:frame];
    if (self) {
        _callback = callback;
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.stateLabel];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.sepView];
        [self.contentView addSubview:self.promptLabel_1];
        [self.contentView addSubview:self.promptLabel_2];
        [self.contentView addSubview:self.confirmBtn];
        [self makeConstraints];
        
    }
    return self;
}

- (void)confirmBtnAct{
    !self.callback ?: self.callback(self);
}


- (void)makeConstraints{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(270 *ScreenRatio_6, 280 *ScreenRatio_6));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(135 *ScreenRatio_6);
    }];
    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25 *ScreenRatio_6, 25 *ScreenRatio_6));
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView).offset(30 *ScreenRatio_6);
    }];
    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.iconIV.mas_bottom).offset(5);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.stateLabel.mas_bottom).offset(5);
    }];
    [self.sepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.width.mas_equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
    [self.promptLabel_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(15 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.sepView).offset(15 *ScreenRatio_6);
    }];
    [self.promptLabel_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(15 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.promptLabel_1.mas_bottom).offset(5);
    }];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.centerX.width.mas_equalTo(self.contentView);
        make.height.mas_equalTo(40 *ScreenRatio_6);
    }];
    
}

#pragma mark - get
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"正确"]];
    }
    return _iconIV;
}
- (UILabel *)stateLabel{
    if (!_stateLabel) {
        _stateLabel = [UILabel new];
        _stateLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        _stateLabel.textColor = KMainTextColor_3;
        _stateLabel.textAlignment = NSTextAlignmentCenter;
        _stateLabel.text = @"发布成功";
    }
    return _stateLabel;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _titleLabel.textColor = KMainTextColor_9;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"正在向机构和同学发送邀请";
    }
    return _titleLabel;
}
- (UIView *)sepView{
    if (!_sepView) {
        _sepView = [UIView new];
        _sepView.backgroundColor = kMainBackgroundColor;
    }
    return _sepView;
}
- (UILabel *)promptLabel_1{
    if (!_promptLabel_1) {
        _promptLabel_1 = [UILabel new];
        _promptLabel_1.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        _promptLabel_1.textColor = KMainTextColor_3;
        _promptLabel_1.text = @"【问题哪里找】";
    }
    return _promptLabel_1;
}
- (UILabel *)promptLabel_2{
    if (!_promptLabel_2) {
        _promptLabel_2 = [UILabel new];
        _promptLabel_2.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _promptLabel_2.textColor = KMainTextColor_6;
        _promptLabel_2.text = @"\"个人中心\" - \"我的提问\" 查看问题动态";
    }
    return _promptLabel_2;
}
- (UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton new];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        _confirmBtn.backgroundColor = kMainTextColor_red;
        [_confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_confirmBtn addTarget:self action:@selector(confirmBtnAct) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

@end

//
//  WLKTLiveVideoEmptyView.m
//  wlkt
//
//  Created by 尹平江 on 2018/4/26.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTLiveVideoEmptyView.h"

@interface LiveVideoEmptyAlert: UIView
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIView *shadowView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *checkDetail_1;
@property (strong, nonatomic) UILabel *checkDetail_2;
@property (strong, nonatomic) UIButton *confirmBtn;

@end

@implementation LiveVideoEmptyAlert
- (instancetype)initWithFrame:(CGRect)frame url:(NSString *)url
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.shadowView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.checkDetail_1];
        [self.contentView addSubview:self.checkDetail_2];
        [self.contentView addSubview:self.confirmBtn];
        [self makeConstraints];
        self.checkDetail_2.text = url;
        
        [self shakeToShow:self.contentView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            [self removeFromSuperview];
        }];
        [self addGestureRecognizer:tap];
        WS(weakSelf);
        [self.confirmBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            [weakSelf removeFromSuperview];
        }];
    }
    return self;
}


#pragma mark -
- (void) shakeToShow:(UIView *)aView{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}

#pragma mark -
- (void)makeConstraints{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(250 *ScreenRatio_6, 270 *ScreenRatio_6));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(160 *ScreenRatio_6);
    }];
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.contentView);
        make.center.mas_equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.centerX.mas_equalTo(self.contentView);
        make.height.mas_equalTo(60 *ScreenRatio_6);
    }];
    [self.checkDetail_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(30 *ScreenRatio_6);
        make.width.mas_equalTo(200 *ScreenRatio_6);
    }];

    [self.checkDetail_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.checkDetail_1.mas_bottom).offset(5);
        make.width.centerX.mas_equalTo(self.checkDetail_1);
    }];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(100 *ScreenRatio_6, 40 *ScreenRatio_6));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-20 *ScreenRatio_6);
    }];
}

#pragma mark - get
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 6 *ScreenRatio_6;
        [_contentView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            
        }]];
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
        _titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6 weight:UIFontWeightSemibold];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = UIColorHex(37becc);
        _titleLabel.text = @"我要直播";
    }
    return _titleLabel;
}

- (UILabel *)checkDetail_1{
    if (!_checkDetail_1) {
        _checkDetail_1 = [UILabel new];
        _checkDetail_1.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _checkDetail_1.textColor = UIColorHex(bec2c9);
        _checkDetail_1.numberOfLines = 2;
        _checkDetail_1.text = @"目前直播功能只对机构开放，请在电脑端上申请";
    }
    return _checkDetail_1;
}
- (UILabel *)checkDetail_2{
    if (!_checkDetail_2) {
        _checkDetail_2 = [UILabel new];
        _checkDetail_2.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _checkDetail_2.textColor = UIColorHex(bec2c9);
        _checkDetail_2.numberOfLines = 0;
    }
    return _checkDetail_2;
}
- (UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton new];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirmBtn.layer.masksToBounds = YES;
        _confirmBtn.layer.cornerRadius = 20 *ScreenRatio_6;
        _confirmBtn.backgroundColor = UIColorHex(37becc);
    }
    return _confirmBtn;
}
@end

/************************************************************************************/
@interface WLKTLiveVideoEmptyView ()
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *goLiveBtn;
@end

@implementation WLKTLiveVideoEmptyView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imgIV];
        [self addSubview:self.titleLabel];
        [self addSubview:self.goLiveBtn];
        [self makeConstraints];

    }
    return self;
}

- (void)setUrl:(NSString *)url{
    _url = url;
    WS(weakSelf);
    [self.goLiveBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        LiveVideoEmptyAlert *alert = [[LiveVideoEmptyAlert alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) url:url];
        [weakSelf.window addSubview:alert];
    }];
}

- (void)makeConstraints{
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(60 *ScreenRatio_6);
        make.centerX.mas_equalTo(self);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgIV.mas_bottom).offset(10 *ScreenRatio_6);
        make.centerX.mas_equalTo(self);
    }];
    [self.goLiveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(15 *ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(60 *ScreenRatio_6, 25));
        make.centerX.mas_equalTo(self);
    }];
}

#pragma mark - get
- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    }
    return _imgIV;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _titleLabel.textColor = UIColorHex(bec2c9);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 2;
        _titleLabel.text = @"很抱歉\n 当前时间点还没有直播";
    }
    return _titleLabel;
}
- (UIButton *)goLiveBtn{
    if (!_goLiveBtn) {
        _goLiveBtn = [UIButton new];
        _goLiveBtn.titleLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        [_goLiveBtn setTitle:@"我要直播" forState:UIControlStateNormal];
        [_goLiveBtn setTitleColor:UIColorHex(37becc) forState:UIControlStateNormal];
    }
    return _goLiveBtn;
}
@end

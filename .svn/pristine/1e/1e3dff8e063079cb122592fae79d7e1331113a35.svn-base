//
//  WLKTAdvertisingView.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/18.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTAdvertisingView.h"
#import "WLKTLaunchPageApi.h"
#import "WLKTLaunchPageData.h"
#import "WLKTCDPageController.h"
#import "WLKTSchoolVC.h"
#import "WLKTActivityDetailVC.h"
#import "WLKTMsgNotiTVC.h"
#import "WLKTOtherURLVC.h"

@interface WLKTAdvertisingView ()
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) UIImageView *iconIV;
@property (strong, nonatomic) UIButton *dismissBtn;
@property (strong, nonatomic) NSTimer *timer;

@property (nonatomic) NSUInteger kLeftTime;
@property (strong, nonatomic) WLKTLaunchPageData *data;
@end

@implementation WLKTAdvertisingView
- (instancetype)init
{
    self = [super init];
    if (self) {
        _kLeftTime = 4;
        CGFloat h = [UIScreen mainScreen].bounds.size.height > 800 ? 34 : 0;
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - h);
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.iconIV];
        [self addSubview:self.imgIV];
        [self addSubview:self.dismissBtn];
        [self makeConstraints];
        [self loadData];
    }
    return self;
}

- (void)dealloc{
    [_timer invalidate];
    _timer = nil;
}

- (void)loadData{
    WLKTLaunchPageApi *api = [[WLKTLaunchPageApi alloc]init];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        WLKTLaunchPageData *d = [WLKTLaunchPageData modelWithJSON:request.responseJSONObject[@"result"]];
        self.data = d;
        [self.imgIV setImageURL:[NSURL URLWithString:d.img]];
        if (d.img) {
            [self createTimer];
        }
        else{
            [self removeFromSuperview];
        }
        
    } failure:^(__kindof YTKBaseRequest *request) {
        [self removeFromSuperview];
    }];
}

#pragma mark - timer
-(void)createTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    
    //加入runloop循环池
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    //开启定时器
    [_timer fire];
}

- (void)timerStart:(NSTimer *)sender{
    self.kLeftTime--;
    if (self.kLeftTime > 0) {
        [self.dismissBtn setTitle:[NSString stringWithFormat:@"%ld  跳过", self.kLeftTime] forState:UIControlStateNormal];
    } else {
        [self timerInvalidate];
        [self removeFromSuperview];
    }
}

- (void)timerInvalidate{
    [_timer invalidate];
    _timer = nil;
}

#pragma mark - action
- (void)dismissBtnAct:(UIButton *)sender{
    [self timerInvalidate];
    [self removeFromSuperview];
}

- (void)advertisingAct{
    [self timerInvalidate];
    if (!self.data) {
        [self removeFromSuperview];
        return;
    }
//    [UIApplication sharedApplication].keyWindow.rootViewController
    UIViewController *vc;
    NSInteger type = self.data.type.integerValue;//type:0不跳转/1机构首页/2课程详情/3活动详情/4url地址
    if (type == 0) {
        [self removeFromSuperview];
        return;
    }
    if (type == 1) {
        vc = [[WLKTSchoolVC alloc]initWithSchoolId:self.data.url];
    }
    if (type == 2) {
        vc = [[WLKTCDPageController alloc]initWithCourseId:self.data.url];
    }
    if (type == 3) {
        vc = [[WLKTActivityDetailVC alloc]initWithActivityId:self.data.url];
    }
    if (type == 4) {
        vc = [[WLKTOtherURLVC alloc]initWithURL:self.data.url];
        
    }

    vc.hidesBottomBarWhenPushed = YES;
    UITabBarController *tabVC = (UITabBarController *)self.window.rootViewController;
    UIViewController *currentVC = tabVC.childViewControllers[tabVC.selectedIndex];
    if ([currentVC isKindOfClass:[UINavigationController class]]) {
        [(UINavigationController *)currentVC pushViewController:vc animated:YES];
    }
    [self removeFromSuperview];
}

#pragma mark -
- (void)makeConstraints{
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 580 *ScreenRatio_6));
        make.top.left.mas_equalTo(self);
    }];
    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self);
        make.center.mas_equalTo(self);
    }];
    [self.dismissBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 25));
        make.top.mas_equalTo(self).offset(35 + IphoneXBottomInsetHeight);
        make.right.mas_equalTo(self).offset(-10);
    }];
}

#pragma mark - get
- (UIImageView *)imgIV{
    if (!_imgIV) {
//        _imgIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"引导banner"]];
        _imgIV = [UIImageView new];
        _imgIV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(advertisingAct)];
        [_imgIV addGestureRecognizer:tap];
    }
    return _imgIV;
}
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"launch"]];
        _iconIV.contentMode = UIViewContentModeScaleToFill;
    }
    return _iconIV;
}
- (UIButton *)dismissBtn{
    if (!_dismissBtn) {
        _dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _dismissBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_dismissBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        _dismissBtn.layer.borderWidth = 0.5;
        _dismissBtn.layer.borderColor = UIColorHex(ffffff).CGColor;
        _dismissBtn.layer.masksToBounds = YES;
        _dismissBtn.layer.cornerRadius = 12.5;
        [_dismissBtn addTarget:self action:@selector(dismissBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dismissBtn;
}
@end

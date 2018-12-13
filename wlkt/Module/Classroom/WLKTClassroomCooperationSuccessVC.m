//
//  WLKTClassroomCooperationSuccessVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/2/6.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTClassroomCooperationSuccessVC.h"

@interface WLKTClassroomCooperationSuccessVC ()
@property (strong, nonatomic) UIButton *confirmBtn;
@end

@implementation WLKTClassroomCooperationSuccessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = separatorView_color;

    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
    titleLabel.textColor = KMainTextColor_3;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"提交成功";
    self.navigationItem.titleView = titleLabel;
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"箭头左b"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonAct)];
    self.navigationItem.leftBarButtonItem = left;
    
    UIView *bg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 180 *ScreenRatio_6)];
    bg.backgroundColor = UIColorHex(ffffff);
    [self.view addSubview:bg];
    
    UIView *sep = [[UIView alloc]initWithFrame:CGRectMake(0, 1, ScreenWidth, 0.5)];
    sep.backgroundColor = KMainTextColor_9;
    [bg addSubview:sep];
    
    UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"成功"]];
    [bg addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(bg);
        make.top.mas_equalTo(bg).offset(30 *ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(60 *ScreenRatio_6, 60 *ScreenRatio_6));
    }];
    
    UILabel *l = [UILabel new];
    l.font = [UIFont systemFontOfSize:25 *ScreenRatio_6 weight:UIFontWeightBold];
    l.textColor = KMainTextColor_3;
    l.text = @"信息提交成功";
    [bg addSubview:l];
    [l mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(bg);
        make.top.mas_equalTo(icon.mas_bottom).offset(10 *ScreenRatio_6);
    }];
    
    UILabel *ll = [UILabel new];
    ll.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
    ll.textColor = KMainTextColor_9;
    ll.text = @"请保持电话通畅";
    [bg addSubview:ll];
    [ll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(bg);
        make.top.mas_equalTo(l.mas_bottom).offset(10 *ScreenRatio_6);
    }];
    
    [self.view addSubview:self.confirmBtn];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth -20 *ScreenRatio_6, 40 *ScreenRatio_6));
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(bg.mas_bottom).offset(10 *ScreenRatio_6);
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)confirmBtnAct{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)backButtonAct{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton new];
        _confirmBtn.backgroundColor = UIColorHex(33c4da);
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        [_confirmBtn setTitle:@"返回课堂+" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        _confirmBtn.layer.masksToBounds = YES;
        _confirmBtn.layer.cornerRadius = 5 *ScreenRatio_6;
        [_confirmBtn addTarget:self action:@selector(confirmBtnAct) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}
@end

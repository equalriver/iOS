//
//  WLKTPaySuccessVC.m
//  wlkt
//
//  Created by 尹平江 on 17/4/7.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTPaySuccessVC.h"
#import "WLKTLogin.h"
#import "WLKTUserMyCourseVC.h"
#import "AppDelegate.h"
#import "WLKTActiveVC.h"
#import "WLKTActivePayTVC.h"

@interface WLKTPaySuccessVC ()

@end

@implementation WLKTPaySuccessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"支付成功";
    self.view.backgroundColor = [UIColor whiteColor];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage new] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonAct)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishBarButtonAct)];
    [self.view addSubview:self.stateImageView];
    [self.view addSubview:self.stateLabel_1];
    [self.view addSubview:self.stateLabel_2];
    [self.view addSubview:self.finishButton];
    [self.view addSubview:self.orderButton];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    [self.finishButton addTarget:self action:@selector(finishButtonAct:) forControlEvents:UIControlEventTouchUpInside];
    [self.orderButton addTarget:self action:@selector(orderButtonAct:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([self.navigationController.viewControllers[self.navigationController.viewControllers.count - 2] isKindOfClass:[WLKTActiveVC class]]) {
        [_orderButton setTitle:@"查看我的活动" forState:UIControlStateNormal];
    }
}

#pragma mark - button

- (void)finishButtonAct:(UIButton *)sender{
    WLKTAppCoordinator *appCoordinator = ((AppDelegate *)[UIApplication sharedApplication].delegate).appCoordinator;
    appCoordinator.tabBarController.selectedIndex = 0;
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

- (void)orderButtonAct:(UIButton *)sender{
    if ([self.navigationController.viewControllers[self.navigationController.viewControllers.count - 2] isKindOfClass:[WLKTActivePayTVC class]]) {
        [self.navigationController pushViewController:[[WLKTActiveVC alloc]init] animated:YES];
    }
    else{
        [self.navigationController pushViewController:[[WLKTUserMyCourseVC alloc]init] animated:YES];
    }
    
}

- (void)finishBarButtonAct{
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)backButtonAct{
    //[self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 

- (void)updateViewConstraints{
    [self.stateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100 * ScreenRatio_6, 100 * ScreenRatio_6));
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(90 * ScreenRatio_6);
    }];
    [self.stateLabel_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(120 * ScreenRatio_6, 30 * ScreenRatio_6));
        make.top.mas_equalTo(self.stateImageView.mas_bottom).offset(15 * ScreenRatio_6);
        make.centerX.mas_equalTo(self.view);
    }];
    [self.stateLabel_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 20 * ScreenRatio_6));
        make.top.mas_equalTo(self.stateLabel_1.mas_bottom).offset(5 * ScreenRatio_6);
    }];
    [self.finishButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300 * ScreenRatio_6, 35 * ScreenRatio_6));
        make.top.mas_equalTo(self.stateLabel_2.mas_bottom).offset(50 * ScreenRatio_6);
        make.centerX.mas_equalTo(self.view);
    }];
    [self.orderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300 * ScreenRatio_6, 35 * ScreenRatio_6));
        make.top.mas_equalTo(self.finishButton.mas_bottom).offset(30 * ScreenRatio_6);
        make.centerX.mas_equalTo(self.view);
    }];
    
    [super updateViewConstraints];
}

#pragma mark - get

- (UIImageView *)stateImageView{
    if (!_stateImageView) {
        _stateImageView = [[UIImageView alloc]init];
        //_stateImageView.backgroundColor = [UIColor blackColor];
        _stateImageView.image = [UIImage imageNamed:@"pay_successed_bg"];
    }
    return _stateImageView;
}
- (UILabel *)stateLabel_1{
    if (!_stateLabel_1) {
        _stateLabel_1 = [[UILabel alloc]init];
        _stateLabel_1.textColor = userLabelColor;
        _stateLabel_1.font = [UIFont systemFontOfSize:18 * ScreenRatio_6];
        _stateLabel_1.textAlignment = NSTextAlignmentCenter;
        _stateLabel_1.text = @"支付成功!";
        
    }
    return _stateLabel_1;
}
- (UILabel *)stateLabel_2{
    if (!_stateLabel_2) {
        _stateLabel_2 = [[UILabel alloc]init];
        _stateLabel_2.textColor = userLabelColor;
        _stateLabel_2.textAlignment = NSTextAlignmentCenter;
        _stateLabel_2.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        //_stateLabel_2.text = @"支付成功支付成功支付成功支付成功";
    }
    return _stateLabel_2;
}
- (UIButton *)finishButton{
    if (!_finishButton) {
        _finishButton = [[UIButton alloc]init];
        [_finishButton setTitle:@"返回首页" forState:UIControlStateNormal];
        [_finishButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _finishButton.backgroundColor = navigationBgColor;
        _finishButton.layer.masksToBounds = YES;
        _finishButton.layer.cornerRadius = 18 * ScreenRatio_6;
        _finishButton.titleLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
    }
    return _finishButton;
}
- (UIButton *)orderButton{
    if (!_orderButton) {
        _orderButton = [[UIButton alloc]init];
        [_orderButton setTitle:@"查看订单" forState:UIControlStateNormal];
        [_orderButton setTitleColor:navigationBgColor forState:UIControlStateNormal];
        _orderButton.layer.borderColor = navigationBgColor.CGColor;
        _orderButton.layer.masksToBounds = YES;
        _orderButton.layer.cornerRadius = 18 * ScreenRatio_6;
        _orderButton.layer.borderWidth = 1;
        _orderButton.titleLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
    }
    return _orderButton;
}

@end

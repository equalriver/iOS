//
//  WLKTSNSLoginPhoneBindingVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSNSLoginPhoneBindingVC.h"
#import "UIButton+Category.h"
#import "WLKTSMSApi.h"
#import "WLKTSNSValidateApi.h"
#import "WLKTLogin.h"
#import "WLKTSNSLoginSetPsdVC.h"

@interface WLKTSNSLoginPhoneBindingVC ()
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIImageView *phoneIV;
@property (strong, nonatomic) UITextField *phoneTF;
@property (strong, nonatomic) UIView *separatorView;
@property (strong, nonatomic) UIImageView *authCodeIV;
@property (strong, nonatomic) UITextField *authCodeTF;
@property (strong, nonatomic) UIButton *authCodeBtn;
@property (strong, nonatomic) UIButton *confirmBtn;
@end

@implementation WLKTSNSLoginPhoneBindingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绑定手机号";
    self.navigationItem.hidesBackButton = YES;
    self.view.backgroundColor = fillViewColor;
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.phoneIV];
    [self.contentView addSubview:self.phoneTF];
    [self.contentView addSubview:self.separatorView];
    [self.contentView addSubview:self.authCodeIV];
    [self.contentView addSubview:self.authCodeTF];
    [self.contentView addSubview:self.authCodeBtn];
    [self.view addSubview:self.confirmBtn];
    [self makeConstraints];
}

#pragma mark - action
- (void)authCodeBtnAct:(UIButton *)sender{
    if (![self.phoneTF.text isValidPhoneNumber]) {
        [SVProgressHUD showInfoWithStatus:@"请输入正确的手机号"];
        return;
    }
    WLKTSMSApi *api = [[WLKTSMSApi alloc]initWithWLKTSMSType:WLKTSMSTypeRegister parameter:self.phoneTF.text];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        
    } failure:^(__kindof YTKBaseRequest *request) {
        ShowApiError
    }];
    [sender startCount];
}

- (void)confirmBtnAct{
    if (self.authCodeTF.text && [self.phoneTF.text isValidPhoneNumber]) {
        WLKTSNSValidateApi *api = [[WLKTSNSValidateApi alloc]initWithPhone:self.phoneTF.text code:self.authCodeTF.text];
        [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            NSString *errorCode = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"errorCode"]];
            if ([errorCode isEqualToString:@"-1"]) {
                [SVProgressHUD showInfoWithStatus:@"验证码错误"];
            }
            if ([errorCode isEqualToString:@"0"]) {//手机号已经注册
                [WLKTLogin setLoginData:request.responseJSONObject[@"result"][@"info"] completion:^{
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }];
            }
            if ([errorCode isEqualToString:@"1"]) {//手机号未注册
                dispatch_async(dispatch_get_main_queue(), ^{
                    WLKTSNSLoginSetPsdVC *vc = [[WLKTSNSLoginSetPsdVC alloc]init];
                    [self.navigationController pushViewController:vc animated:YES];
                });
            }
        } failure:^(__kindof YTKBaseRequest *request) {
            ShowApiError
        }];
    }
}

#pragma mark -
- (void)makeConstraints{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 100));
        make.top.mas_equalTo(self.view).offset(5);
        make.left.mas_equalTo(self.view);
    }];
    [self.phoneIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(5);
        make.left.mas_equalTo(self.contentView).offset(15);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.phoneIV.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.centerY.mas_equalTo(self.phoneIV);
        make.height.mas_equalTo(40);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.phoneTF.mas_bottom).offset(2);
    }];
    [self.authCodeIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.separatorView).offset(15);
        make.left.mas_equalTo(self.phoneIV);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    [self.authCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.centerY.mas_equalTo(self.authCodeIV);
    }];
    [self.authCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.authCodeIV.mas_right).offset(10);
        make.centerY.mas_equalTo(self.authCodeIV);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth - 30, 40));
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.contentView.mas_bottom).offset(15);
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
- (UIImageView *)phoneIV{
    if (!_phoneIV) {
        _phoneIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"register_phone"]];
    }
    return _phoneIV;
}
- (UITextField *)phoneTF{
    if (!_phoneTF) {
        _phoneTF = [UITextField new];
        _phoneTF.font = [UIFont systemFontOfSize:13];
        _phoneTF.textColor = KMainTextColor_3;
        _phoneTF.placeholder = @"请输入手机号";
        _phoneTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _phoneTF;
}
- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}
- (UIImageView *)authCodeIV{
    if (!_authCodeIV) {
        _authCodeIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"register_authcode"]];
    }
    return _authCodeIV;
}
- (UITextField *)authCodeTF{
    if (!_authCodeTF) {
        _authCodeTF = [UITextField new];
        _authCodeTF.font = [UIFont systemFontOfSize:13];
        _authCodeTF.textColor = KMainTextColor_3;
        _authCodeTF.placeholder = @"请输入验证码";
        _authCodeTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _authCodeTF;
}
- (UIButton *)authCodeBtn{
    if (!_authCodeBtn) {
        _authCodeBtn = [UIButton new];
        _authCodeBtn.backgroundColor = UIColorHex(33c4da);
        _authCodeBtn.layer.cornerRadius = 15;
        _authCodeBtn.layer.masksToBounds = YES;
        _authCodeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_authCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_authCodeBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        [_authCodeBtn addTarget:self action:@selector(authCodeBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _authCodeBtn;
}
- (UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton new];
        _confirmBtn.backgroundColor = UIColorHex(33c4da);
        _confirmBtn.layer.cornerRadius = 20;
        _confirmBtn.layer.masksToBounds = YES;
        [_confirmBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        [_confirmBtn addTarget:self action:@selector(confirmBtnAct) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}
@end

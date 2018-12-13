//
//  WLKTPhoneChangeVC.m
//  wlkt
//
//  Created by 尹平江 on 17/3/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTPhoneChangeVC.h"
#import "WLKTUserinfoChangeApi.h"
#import "WLKTLogin.h"

@interface WLKTPhoneChangeVC ()
@property (copy, nonatomic) NSString *userPhoneTemp;
@property (strong, nonatomic) UIView *separatorView_one;
@property (strong, nonatomic) UIView *separatorView_two;
@property (strong, nonatomic) UIView *phoneBgView;
@end

@implementation WLKTPhoneChangeVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.userPhoneTF becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = userinfoBgColor;
    [self.view addSubview:self.phoneBgView];
    [self.phoneBgView addSubview:self.separatorView_one];
    [self.phoneBgView addSubview:self.separatorView_two];
    [self.phoneBgView addSubview:self.userPhoneTF];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveChangedAct:)];
    [barItem setTitleTextAttributes:@{
                                      NSFontAttributeName:[UIFont systemFontOfSize:16 *ScreenRatio_6],
                                      NSForegroundColorAttributeName:KMainTextColor_3} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = barItem;
    self.navigationItem.title = @"手机号";
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"箭头左"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonAct)];
    [self.userPhoneTF addTarget:self action:@selector(userPhoneTFAct:) forControlEvents:UIControlEventEditingChanged];
}

- (void)backButtonAct{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)userPhoneTFAct:(UITextField *)userPhoneTF{
    self.userPhoneTemp = userPhoneTF.text;
}

- (void)saveChangedAct:(UIBarButtonItem *)barButtonItem{
    if (self.userPhoneTemp.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"手机号不能为空"];
    }
    else if (self.userPhoneTemp.length == 11) {
        if (![SVProgressHUD isVisible]) {
            [SVProgressHUD showInfoWithStatus:@"正在保存..."];
        }
        WLKTUserinfoChangeApi *api = [[WLKTUserinfoChangeApi alloc]initWithUsername:TheCurUser.truename sex:TheCurUser.sex phone:self.userPhoneTemp hobby:nil];
        [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            [SVProgressHUD dismiss];
            //保存更改
            TheCurUser.phone = self.userPhoneTemp;
            [WLKTLogin saveUserData:TheCurUser];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                !self.userPhoneBlock ?: self.userPhoneBlock(self.userPhoneTemp);
                [self.navigationController popViewControllerAnimated:YES];
            });
        } failure:^(__kindof YTKBaseRequest *request) {
            ShowApiError;
        }];
        
    }
    else{
        [SVProgressHUD showErrorWithStatus:@"手机号格式不对"];
        
    }

}

#pragma mark - get

- (NSString *)userPhoneTemp{
    if (!_userPhoneTemp) {
        _userPhoneTemp = self.userPhoneTF.text;
    }
    return _userPhoneTemp;
}

- (UIView *)separatorView_one{
    if (!_separatorView_one) {
        _separatorView_one = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
        _separatorView_one.backgroundColor = separatorView_color;
    }
    return _separatorView_one;
}

- (UIView *)separatorView_two{
    if (!_separatorView_two) {
        _separatorView_two = [[UIView alloc]initWithFrame:CGRectMake(0, 43 * ScreenRatio_6, ScreenWidth, 1)];
        _separatorView_two.backgroundColor = separatorView_color;
    }
    return _separatorView_two;
}
- (UIView *)phoneBgView{
    if (!_phoneBgView) {
        _phoneBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 15 * ScreenRatio_6, ScreenWidth, 44 * ScreenRatio_6)];
        _phoneBgView.backgroundColor = [UIColor whiteColor];
    }
    return _phoneBgView;
}

- (UITextField *)userPhoneTF{
    if (!_userPhoneTF) {
        _userPhoneTF = [[UITextField alloc]initWithFrame:CGRectMake(10 * ScreenRatio_6, 0, ScreenWidth - 10 * ScreenRatio_6, 44 * ScreenRatio_6)];
        _userPhoneTF.placeholder = @"请输入新手机号";
        _userPhoneTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _userPhoneTF;
}



@end

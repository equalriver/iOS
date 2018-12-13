//
//  WLKTEmailChangeVC.m
//  wlkt
//
//  Created by 尹平江 on 2017/5/2.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTEmailChangeVC.h"
#import "WLKTUserinfoChangeApi.h"
#import "WLKTLogin.h"

@interface WLKTEmailChangeVC ()
@property (copy, nonatomic)NSString *emailTemp;
@property (strong, nonatomic) UIView *separatorView_one;
@property (strong, nonatomic) UIView *separatorView_two;
@property (strong, nonatomic) UIView *nameBgView;

@end

@implementation WLKTEmailChangeVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.emailChangeTF becomeFirstResponder];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = userinfoBgColor;
    [self.view addSubview:self.nameBgView];
    [self.nameBgView addSubview:self.emailChangeTF];
    [self.nameBgView addSubview:self.separatorView_one];
    [self.nameBgView addSubview:self.separatorView_two];
    
    
    //UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveChangedAct:)];
//    [barButtonItem setTitleTextAttributes:@{
//                                            NSFontAttributeName:[UIFont systemFontOfSize:16],
//                                            NSForegroundColorAttributeName:navigationTitleColor} forState:UIControlStateNormal];
    //self.navigationItem.rightBarButtonItem = barButtonItem;
    self.navigationItem.title = @"邮箱";
    
    [self.emailChangeTF addTarget:self action:@selector(userNameTFAct:) forControlEvents:UIControlEventEditingChanged];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"箭头左"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonAct)];
}

- (void)backButtonAct{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)userNameTFAct:(UITextField *)userNameTF{
    self.emailTemp = userNameTF.text;
}

/*
- (void)saveChangedAct:(UIBarButtonItem *)barButtonItem{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isValid = [predicate evaluateWithObject:self.emailTemp];
    if (isValid == NO) {
        [SVProgressHUD showErrorWithStatus:@"邮箱格式不对"];
        
    }
    else{
        if (![SVProgressHUD isVisible]) {
            [SVProgressHUD showInfoWithStatus:@"正在保存..."];
        }
        WLKTUserinfoChangeApi *api = [[WLKTUserinfoChangeApi alloc]initWithUsername:self.emailTemp sex:TheCurUser.sex phone:TheCurUser.phone];
        [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            [SVProgressHUD dismiss];
            //保存更改
            TheCurUser.email = self.emailTemp;
            [WLKTLogin saveUserData:TheCurUser];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                !self.emailChangeBlock ? : self.emailChangeBlock(self.emailTemp);
                [self.navigationController popViewControllerAnimated:YES];
            });
        } failure:^(__kindof YTKBaseRequest *request) {
            ShowApiError;
        }];
    }
}*/


#pragma mark - get

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
- (UIView *)nameBgView{
    if (!_nameBgView) {
        _nameBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 15 * ScreenRatio_6, ScreenWidth, 44 * ScreenRatio_6)];
        _nameBgView.backgroundColor = [UIColor whiteColor];
    }
    return _nameBgView;
}

- (UITextField *)emailChangeTF{
    if (!_emailChangeTF) {
        _emailChangeTF = [[UITextField alloc]initWithFrame:CGRectMake(10 * ScreenRatio_6, 0, ScreenWidth - 10 * ScreenRatio_6, 44 * ScreenRatio_6)];
        _emailChangeTF.placeholder = @"请输入新邮箱";
        _emailChangeTF.backgroundColor = [UIColor whiteColor];
        _emailChangeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _emailChangeTF;
}

#pragma mark -
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.emailChangeTF resignFirstResponder];
}


@end
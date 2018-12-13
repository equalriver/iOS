//
//  WLKTRegisterViewController.m
//  wlkt
//
//  Created by slovelys on 2017/4/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTRegisterViewController.h"
#import "UITextField+Validate.h"
#import "WLKTPhoneValidator.h"
#import "WLKTPasswordValidator.h"
#import "WLKTAuthCodeValidator.h"
#import "UIButton+Category.h"
#import "WLKTUserAgreementViewController.h"
#import "WLKTLoginCoordinator.h"
#import "WKWebViewController.h"

@interface WLKTRegisterViewController ()

@property (assign, nonatomic) WLKTRegisterOrForgetPasswordVCType vcType;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *authcodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *authcodeButton;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *selectedButton;
@property (weak, nonatomic) IBOutlet UIButton *showPasswordButton;

@end

@implementation WLKTRegisterViewController

- (instancetype)initWithViewControllerType:(WLKTRegisterOrForgetPasswordVCType)type {
    WLKTRegisterViewController *vc = [[UIStoryboard storyboardWithName:kLaunchStoryboardName bundle:nil] instantiateViewControllerWithIdentifier:kRegisterIdentifier];
    vc.vcType = type;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
    [self setupTextField];
    [self.showPasswordButton setImage:[UIImage imageNamed:@"button_checkpassword_selected"] forState:UIControlStateSelected];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.phoneTextField becomeFirstResponder];
    [self.selectedButton setSelected:YES];
}

- (void)setupSubViews {
    self.authcodeButton.layer.cornerRadius = 17;
    self.registerButton.layer.cornerRadius = 23;
    [self.selectedButton setImage:[UIImage imageNamed:@"button_selected"] forState:UIControlStateSelected];
    
//    self.registerButton.backgroundColor = [UIColor lightGrayColor];
    if (self.vcType == WLKTRegisterOrForgetPasswordVCTypeForgetPassword) {
        self.passwordTextField.placeholder = @"请设置新密码";
        [self.registerButton setTitle:@"修改" forState:UIControlStateNormal];
        self.title = @"重置密码";
    } else {
        self.title = @"注册";
    }
}

- (void)setupTextField {
    self.phoneTextField.validator = [WLKTPhoneValidator new];
    self.phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTextField.validator = [WLKTPasswordValidator new];
    self.authcodeTextField.validator = [WLKTAuthcodeValidator new];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [textField validateRange:range replacementString:string];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.vcType == WLKTRegisterOrForgetPasswordVCTypeForgetPassword) {
        return 4;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 50;
    }
    if (section == 3) {
        return 80;
    }
    return 0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

#pragma mark - Action

- (IBAction)textDidChange:(UITextField *)textField {
    self.registerButton.enabled = (([self.phoneTextField.text isNotBlank]) && ([self.authcodeTextField.text isNotBlank]) && (self.passwordTextField.text.length >= kPasswordMinLength));
//    if (self.registerButton.enabled) {
//        self.registerButton.backgroundColor = kNavBarBackgroundColor;
//    } else {
//        self.registerButton.backgroundColor = [UIColor lightGrayColor];
//    }
}

- (IBAction)didTapGetAuthcodeButton:(UIButton *)sender {
    if (self.phoneTextField.text.length != 11) {
        [SVProgressHUD showInfoWithStatus:@"请输入正确的手机号码"];
        return;
    }
    if ([self.delegate respondsToSelector:@selector(registerViewController:didRequestAuthCodeWithUsername: WLKTRegisterOrForgetPasswordVCType:)]) {
        [self.delegate registerViewController:self didRequestAuthCodeWithUsername:self.phoneTextField.text WLKTRegisterOrForgetPasswordVCType:_vcType];
    }
}

- (void)startCountForAuthCode {
    [self.authcodeButton startCount];
}

- (IBAction)didTapShowPasswordButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.passwordTextField.secureTextEntry = !self.passwordTextField.secureTextEntry;
    
    [self.passwordTextField resignFirstResponder];
    [self.passwordTextField becomeFirstResponder];
}

- (IBAction)didTapRegiterButton:(id)sender {
    if (!self.selectedButton.selected) {
        [SVProgressHUD showInfoWithStatus:@"请阅读并同意用户协议"];
        return;
    }
    [self.view endEditing:YES];
    if (self.vcType == WLKTRegisterOrForgetPasswordVCTypeRegister) {
        if ([self.delegate respondsToSelector:@selector(registerViewController:didRequestRegisterWithUsername:authCode:password:)]) {
            [self.delegate registerViewController:self didRequestRegisterWithUsername:self.phoneTextField.text authCode:self.authcodeTextField.text password:self.passwordTextField.text];
        }
    } else {
        if ([self.delegate respondsToSelector:@selector(registerViewController:didRequestResetPasswordWithUsername:authCode:password:)]) {
            [self.delegate registerViewController:self didRequestResetPasswordWithUsername:self.phoneTextField.text authCode:self.authcodeTextField.text password:self.passwordTextField.text];
        }
    }
    
}

- (IBAction)didTapSelectButoon:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (IBAction)didTapAgreementButton:(id)sender {
//    WLKTUserAgreementViewController *vc = [[WLKTUserAgreementViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    WKWebViewController *vc = [[WKWebViewController alloc] init];
    [vc loadWebURLSring:@"http://www.shengxue.org/about/xieyi.html"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

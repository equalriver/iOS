//
//  WLKTActivePayTVC.m
//  wlkt
//
//  Created by 尹平江 on 2017/7/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivePayTVC.h"
#import "WLKTActivePayCell.h"
#import "WLKTActivePayFirstCell.h"
#import "WLKTAlipay.h"
#import "WLKTTianfuPay.h"
#import "WLKTPaySuccessVC.h"
#import "WLKTPayFailVC.h"
#import "WLKTLogin.h"
#import "WLKTPaySuccessVC.h"
#import "WLKTActiveFreeSuccessVC.h"
#import "WLKActivityViewController.h"
#import "WLKTActiveAlipay.h"
#import "WLKTActiveTianfuPay.h"
#import "WLKTActivityWeixinPay.h"

@interface WLKTActivePayTVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (strong, nonatomic) UITableView *orderTableView;
@property (strong, nonatomic) WLKTActivePayCell *cell;
@property (strong, nonatomic) UIButton *payButton;
@property (copy, nonatomic) NSString *studentName;
@property (copy, nonatomic) NSString *studentPhoneNum;
@property (copy, nonatomic) NSString *currentPrice;
@property (assign) int payButtonTag;
@end

@implementation WLKTActivePayTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"报名信息";
    self.view.backgroundColor = [UIColor whiteColor];
   
    [self.view addSubview:self.orderTableView];
    [self.view addSubview:self.payButton];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    [self.payButton addTarget:self action:@selector(payAct:) forControlEvents:UIControlEventTouchUpInside];
    
    self.orderTableView.delegate = self;
    self.orderTableView.dataSource = self;
    
    //keyboard
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    //pay
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(paySuccess:) name:@"paySuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payFail:) name:@"payFail" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(activePayWayTag:) name:@"activePayWayTag" object:nil];
    
    self.peopleCount = 1;
    self.currentPrice = self.data.price;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.view endEditing:YES];

}

#pragma mark - payNoti

- (void)paySuccess:(NSNotification *)noti{
    WLKTPaySuccessVC *vc = [[WLKTPaySuccessVC alloc]init];
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
    dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.25);
    dispatch_after(t, dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:vc animated:NO];
    });
    
}

- (void)payFail:(NSNotification *)noti{
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
    dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.25);
    dispatch_after(t, dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:[[WLKTPayFailVC alloc]init] animated:NO];
    });
    
}

- (void)activePayWayTag:(NSNotification *)noti{
    NSString *tag = noti.userInfo[@"tag"];
    self.payButtonTag = tag.intValue;
    NSLog(@"tag: %d", self.payButtonTag);
}

#pragma mark - keyboard

- (void)keyboardFrameChange:(NSNotification *)noti{
    CGRect keyboardFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.view.transform = CGAffineTransformMakeTranslation(0, keyboardFrame.origin.y - self.view.frame.size.height - 64);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

#pragma mark - TextField

- (void)buyTFAct:(UITextField *)sender{
    [self.orderTableView scrollToRow:0 inSection:0 atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    self.peopleCount = sender.text.intValue;

    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"总计：%.2f元",self.currentPrice.floatValue * self.peopleCount]];
    [str setAttributes:@{NSForegroundColorAttributeName : kMainTextColor_red, NSFontAttributeName : [UIFont systemFontOfSize:13 * ScreenRatio_6]} range:NSMakeRange(str.length - 1, 1)];
    [str setAttributes:@{NSForegroundColorAttributeName : userLabelColor, NSFontAttributeName : [UIFont systemFontOfSize:13 * ScreenRatio_6]} range:NSMakeRange(0, 3)];
    [str setAttributes:@{NSForegroundColorAttributeName : kMainTextColor_red, NSFontAttributeName : [UIFont systemFontOfSize:18 * ScreenRatio_6]} range:NSMakeRange(3, str.length - 4)];
    self.cell.totalLabel.attributedText = str;

}

- (void)studentNameTFAct:(UITextField *)studentNameTF{
    self.studentName = studentNameTF.text;
    [self.orderTableView scrollToRow:1 inSection:0 atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

- (void)textFieldDidChange:(UITextField *)textField
{
    [self.orderTableView scrollToRow:1 inSection:0 atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    if (textField == self.cell.phoneTF) {
        if (textField.text.length >= 11) {
            textField.text = [textField.text substringToIndex:11];
            self.studentPhoneNum = textField.text;
        }
    }
}

#pragma mark - button action
- (BOOL)valiMobile:(NSString *)mobile
{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}

- (void)payAct:(UIButton *)payOrderButton{
    [self.view endEditing:YES];
    [SVProgressHUD setMaximumDismissTimeInterval:2];
    if (self.studentName.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请输入您的姓名"];
        return;
    }
    else if (self.studentName.length < 2 || self.studentName.length > 4){
        [SVProgressHUD showInfoWithStatus:@"姓名格式不对"];
        return;
    }
    else if (self.studentPhoneNum.length == 0){
        [SVProgressHUD showInfoWithStatus:@"请输入您的联系电话"];
        return;
    }
    if (![self valiMobile:self.studentPhoneNum]) {
        [SVProgressHUD showInfoWithStatus:@"手机号码不正确"];
        return;
    }
    else if (self.data) {
        dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.25);
        dispatch_after(t, dispatch_get_main_queue(), ^{
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSNSPush"];
            if (self.payButtonTag == 0) {//天府银行
                [WLKTActiveTianfuPay tianfuPayWithHdid:self.data.aid uname:self.studentName uphone:self.studentPhoneNum renshu:[NSString stringWithFormat:@"%d", self.peopleCount] target:self];
                
            }
            if (self.payButtonTag == 1) {//支付宝
                [WLKTActiveAlipay AlipayWithHdid:self.data.aid uname:self.studentName uphone:self.studentPhoneNum renshu:[NSString stringWithFormat:@"%d", self.peopleCount]];
                
            }
            if (self.payButtonTag == 2) {//weixin
                [WLKTActivityWeixinPay WeixinPayWithHdid:self.data.aid uname:self.studentName uphone:self.studentPhoneNum renshu:[NSString stringWithFormat:@"%d", self.peopleCount]];
                
            }
        });
    }
    
}

- (void)peopleNumAct:(UIButton *)courseNumActBtn{
    [self.view endEditing:YES];
    self.peopleCount = self.cell.buyTF.text.intValue;
    if (courseNumActBtn.tag == 0) {//--
        if (self.cell.buyTF.text.intValue > 1) {
            self.peopleCount--;
            self.cell.buyTF.text = [NSString stringWithFormat:@"%d",self.peopleCount];
        }
    }
    if (courseNumActBtn.tag == 1) {//++
        self.peopleCount++;
        self.cell.buyTF.text = [NSString stringWithFormat:@"%d",self.peopleCount];
    }
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"总计：%.2f元",self.currentPrice.floatValue * self.peopleCount]];
    [str setAttributes:@{NSForegroundColorAttributeName : kMainTextColor_red, NSFontAttributeName : [UIFont systemFontOfSize:13]} range:NSMakeRange(str.length - 1, 1)];
    [str setAttributes:@{NSForegroundColorAttributeName : userLabelColor, NSFontAttributeName : [UIFont systemFontOfSize:13]} range:NSMakeRange(0, 3)];
    [str setAttributes:@{NSForegroundColorAttributeName : kMainTextColor_red, NSFontAttributeName : [UIFont systemFontOfSize:18]} range:NSMakeRange(3, str.length - 4)];
    self.cell.totalLabel.attributedText = str;
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        WLKTActivePayFirstCell *cell_1 = [[WLKTActivePayFirstCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell_1.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell_1 setCellContent:self.data];

        return cell_1;

    }
    WLKTActivePayCell *cell = [[WLKTActivePayCell alloc]init];
    [cell.studentNameTF addTarget:self action:@selector(studentNameTFAct:) forControlEvents:UIControlEventEditingChanged | UIControlEventEditingDidBegin];
    [cell.phoneTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged | UIControlEventEditingDidBegin];
    [cell.minusButton addTarget:self action:@selector(peopleNumAct:) forControlEvents:UIControlEventTouchUpInside];
    [cell.addButton addTarget:self action:@selector(peopleNumAct:) forControlEvents:UIControlEventTouchUpInside];
    [cell.buyTF addTarget:self action:@selector(buyTFAct:) forControlEvents:UIControlEventEditingChanged | UIControlEventEditingDidBegin];
    
    cell.buyTF.text = [NSString stringWithFormat:@"%d",self.peopleCount];
    self.cell = cell;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"总计：%@元",self.data.price]];
    [str setAttributes:@{NSForegroundColorAttributeName : kMainTextColor_red, NSFontAttributeName : [UIFont systemFontOfSize:13]} range:NSMakeRange(str.length - 1, 1)];
    [str setAttributes:@{NSForegroundColorAttributeName : userLabelColor, NSFontAttributeName : [UIFont systemFontOfSize:13]} range:NSMakeRange(0, 3)];
    [str setAttributes:@{NSForegroundColorAttributeName : kMainTextColor_red, NSFontAttributeName : [UIFont systemFontOfSize:18]} range:NSMakeRange(3, str.length - 4)];
    
    cell.totalLabel.attributedText = str;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 110 * ScreenRatio_6;
    }
    return 500 * ScreenRatio_6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 5)];
    v.backgroundColor = fillViewColor;
    return v;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 5)];
    v.backgroundColor = fillViewColor;
    return v;
}

#pragma mark - constraints
- (void)updateViewConstraints{
    [self.orderTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, ScreenHeight - (45 + 64) * ScreenRatio_6));
        make.top.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view);
    }];
    
    [self.payButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 45 * ScreenRatio_6));
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    [super updateViewConstraints];
}

#pragma mark - get
- (UITableView *)orderTableView{
    if (!_orderTableView) {
        _orderTableView = [[UITableView alloc]init];
        _orderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _orderTableView;
}
- (UIButton *)payButton{
    if (!_payButton) {
        _payButton = [[UIButton alloc]init];
        [_payButton setTitle:@"确认支付" forState:UIControlStateNormal];
        [_payButton setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _payButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _payButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _payButton.backgroundColor = navigationBgColor;
    }
    return _payButton;
}

- (NSString *)studentName{
    if (!_studentName) {
        _studentName = TheCurUser.truename;
        
    }
    return _studentName;
}

- (NSString *)studentPhoneNum{
    if (!_studentPhoneNum) {
        _studentPhoneNum = TheCurUser.phone;
    }
    return _studentPhoneNum;
}

#pragma mark -

- (void)dealloc{
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"isSNSPush"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end

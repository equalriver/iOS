//
//  WLKTMyCourseGoPayVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTMyCourseGoPayVC.h"
#import "WLKTPayWayCell.h"
#import "WLKTTianfuPayRepay.h"
#import "WLKTAlipayRepay.h"
#import "WLKTPaySuccessVC.h"
#import "WLKTPayFailVC.h"
#import "WLKTWeixinRepay.h"

@interface WLKTMyCourseGoPayVC ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UILabel *payLabel;
@property (strong, nonatomic) UITableView *payWayTableView;
@property (strong, nonatomic) UIButton *payButton;

@property (strong, nonatomic) WLKTPayCourseData *data;
@property (assign, nonatomic) NSInteger payCellSelectedItem;
@property (assign, nonatomic) NSInteger selectedIndex;
@end

@implementation WLKTMyCourseGoPayVC
- (instancetype)initWithData:(WLKTPayCourseData *)data
{
    self = [super init];
    if (self) {
        _data = data;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(paySuccess:) name:@"paySuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payFail:) name:@"payFail" object:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)setupUI{
    self.title = @"确认付款";
    self.view.backgroundColor = UIColorHex(fafafa);
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"需支付：¥%.2f", self.data.totalmoney.doubleValue - self.data.schyhq.doubleValue - self.data.ptyhq.doubleValue]];
    [str setAttributes:@{NSForegroundColorAttributeName: KMainTextColor_3,
                         NSFontAttributeName: [UIFont systemFontOfSize:13]
                         } range:NSMakeRange(0, 4)];
    [str setAttributes:@{NSForegroundColorAttributeName: UIColorHex(ee402d),
                         NSFontAttributeName: [UIFont systemFontOfSize:15]
                         } range:NSMakeRange(4, str.length - 4)];
    self.payLabel.attributedText = str;
    [self.view addSubview:self.payLabel];
    [self.view addSubview:self.payWayTableView];
    [self.view addSubview:self.payButton];
    [self makeConstraints];
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

#pragma mark - aciton
- (void)payButtonAct:(UIButton *)sender{
//    if (self.selectedIndex == 0) {//tianfu
//        [WLKTTianfuPayRepay tianfuPayWithOrderId:self.data.idid target:self];
//    }
    if (self.selectedIndex == 0) {//alipay
        [WLKTAlipayRepay AlipayWithOrderId:self.data.idid];
    }
    if (self.selectedIndex == 1) {//weixin
        [WLKTWeixinRepay WeixinPayWithOrderId:self.data.idid];
    }
}

#pragma mark - table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 3;
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    UIView *line = [UIView new];
    line.backgroundColor = UIColorHex(33c4da);
    UILabel *title = [UILabel new];
    title.font = [UIFont systemFontOfSize:14];
    title.textColor = KMainTextColor_3;
    
    [v addSubview:line];
    [v addSubview:title];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(2, 13));
        make.centerY.mas_equalTo(v);
        make.left.mas_equalTo(v).offset(15 * ScreenRatio_6);
    }];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(line.mas_right).offset(3);
        make.centerY.mas_equalTo(v);
    }];

    title.text = @"支付方式";
    return v;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLKTPayWayCell *cell = [[WLKTPayWayCell alloc]init];
    [cell setCellData:@[/*[UIImage imageNamed:@"tianfu"], */[UIImage imageNamed:@"支付宝"], [UIImage imageNamed:@"微信支付"]] title:@[/*@"钱包余额支付", */@"支付宝", @"微信"] indexPath:indexPath selectedItem:self.payCellSelectedItem];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndex = self.payCellSelectedItem = indexPath.row;
    [self.payWayTableView reloadData];
}

#pragma mark - make constraints
- (void)makeConstraints{
    [self.payLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth - 15, 45));
        make.top.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view.mas_right).offset(-15);
    }];
    [self.payWayTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 190));
        make.top.mas_equalTo(self.payLabel.mas_bottom);
        make.left.mas_equalTo(self.view);
    }];
    [self.payButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 50));
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.left.mas_equalTo(self.view);
    }];
}

#pragma mark - get
- (UILabel *)payLabel{
    if (!_payLabel) {
        _payLabel = [UILabel new];
        _payLabel.backgroundColor = UIColorHex(fafafa);
        _payLabel.textAlignment = NSTextAlignmentRight;
    }
    return _payLabel;
}
- (UITableView *)payWayTableView{
    if (!_payWayTableView) {
        _payWayTableView = [[UITableView alloc]initWithFrame:CGRectNull style:UITableViewStylePlain];
        _payWayTableView.dataSource = self;
        _payWayTableView.delegate = self;
        _payWayTableView.bounces = NO;
        _payWayTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _payWayTableView.backgroundColor = [UIColor whiteColor];
    }
    return _payWayTableView;
}
- (UIButton *)payButton{
    if (!_payButton) {
        _payButton = [UIButton new];
        [_payButton setTitle:@"立即支付" forState:UIControlStateNormal];
        [_payButton setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        _payButton.backgroundColor = UIColorHex(33c4da);
        [_payButton addTarget:self action:@selector(payButtonAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payButton;
}

@end
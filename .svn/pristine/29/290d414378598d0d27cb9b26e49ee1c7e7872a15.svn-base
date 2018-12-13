//
//  WLKTConfirmOrderVC.m
//  wlkt
//
//  Created by 尹平江 on 17/4/1.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTConfirmOrderVC.h"
#import "WLKTAlipay.h"
#import "WLKTTianfuPay.h"
#import "WLKTPaySuccessVC.h"
#import "WLKTPayFailVC.h"
#import "WLKTCoursePriceRange.h"
#import "WLKTLogin.h"
#import "WLKTConfirmOrderHeadCell.h"
#import "WLKTConfirmOrderCourseMsgCell.h"
#import "WLKTConfirmOrderStundentMsgCell.h"
#import "WLKTPayWayCell.h"
#import "WLKTOrderGetCouponAndSaleApi.h"
#import "WLKTCourseManjianData.h"
#import "WLKTConfirmOrderCouponCell.h"
#import "WLKTWeixinPay.h"

@interface WLKTConfirmOrderVC ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, couponHeadCellDelegate, StundentMessageDelegate, WLKTCourseDetailCouponAlertDelegate>
@property (strong, nonatomic) UITableView *orderTableView;
@property (strong, nonatomic) UIView *bottomView;
@property (strong, nonatomic) UIButton *payButton;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *totalLabel;
@property (strong, nonatomic) WLKTConfirmOrderHeadCell *headCell;
@property (strong, nonatomic) WLKTConfirmOrderStundentMsgCell *stdnameCell;
@property (strong, nonatomic) WLKTConfirmOrderStundentMsgCell *stdageCell;
@property (strong, nonatomic) WLKTConfirmOrderStundentMsgCell *stdphoneCell;

@property (copy, nonatomic) NSString *studentName;
@property (assign, nonatomic) int studentAge;
@property (copy, nonatomic) NSString *studentPhoneNum;
@property (assign, nonatomic) NSInteger payButtonTag;
@property (copy, nonatomic) NSString *currentPrice;
@property (copy, nonatomic) NSString *courePrice;
@property (assign, nonatomic) NSInteger payCellSelectedItem;

@property (copy, nonatomic) NSMutableArray<WLKTCourseCouponData *> *ptCouponArr;
@property (copy, nonatomic) NSMutableArray<WLKTCourseCouponData *> *schoolCouponArr;
@property (copy, nonatomic) NSMutableArray<WLKTCourseManjianData *> *manjianArr;

@property (strong, nonatomic) WLKTCourseCouponData *selectedPtCoupon;
@property (strong, nonatomic) WLKTCourseCouponData *selectedSchoolCoupon;
@property (strong, nonatomic) WLKTCourseManjianData *selectedManjianData;

@property (strong, nonatomic) WLKTCDData *data;
@property (strong, nonatomic) WLKTCDOneprice *oneprice;
@property (copy, nonatomic) NSString *addressId;
@property (copy, nonatomic) NSString *showprice;
@property (copy, nonatomic) NSString *oldprice;
@property (copy, nonatomic) NSString *priceName;
@property (copy, nonatomic) NSDictionary *paramDic;
@property (assign, nonatomic) double totalPrice;
@property (assign, nonatomic) NSInteger courseNumber;
@property (assign, nonatomic) double ptYouhuiPrice;
@property (assign, nonatomic) double schoolYouhuiPrice;
@property (assign, nonatomic) double manjianPrice;

@end

@implementation WLKTConfirmOrderVC

- (instancetype)initWithCourseData:(WLKTCDData *)data dic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _data = data;
        _addressId = dic[@"address"];
        _showprice = dic[@"showprice"];
        _oldprice = dic[@"oldprice"];
        _priceName = dic[@"priceName"];
        _oneprice = dic[@"oneprice"];
        _paramDic = [NSDictionary dictionaryWithDictionary:dic];
        _courseNumber = [(NSNumber *)dic[@"courseNumber"] integerValue];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _studentPhoneNum = TheCurUser.phone;
    _studentName = TheCurUser.truename;
    [self setupUI];
    //keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    //pay
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(paySuccess:) name:@"paySuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payFail:) name:@"payFail" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payWayTag:) name:@"payWayTag" object:nil];
    [self requestWithCourseId:self.data.courseinfo.cid addressId:self.addressId];
    self.headCell = [[WLKTConfirmOrderHeadCell alloc]initWithCourse:self.data oneprice:self.oneprice courseNumber:self.courseNumber manjian:self.manjianArr isPingou:self.isPingou priceName:self.priceName];
    
    self.headCell.delegate = self;
}

- (void)dealloc{
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"isSNSPush"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - network
- (void)requestWithCourseId:(NSString *)cid addressId:(NSString *)aid{
    self.orderTableView.state = WLKTViewStateLoading;
    WLKTOrderGetCouponAndSaleApi *api = [[WLKTOrderGetCouponAndSaleApi alloc]initWithCourseId:cid addressId:aid];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {

        NSArray *jianArr = [NSArray modelArrayWithClass:[WLKTCourseManjianData class] json:request.responseJSONObject[@"result"][@"manjian"]];
        NSArray *ptarr = [NSArray modelArrayWithClass:[WLKTCourseCouponData class] json:request.responseJSONObject[@"result"][@"ptcoupon"]];
        NSArray *scharr = [NSArray modelArrayWithClass:[WLKTCourseCouponData class] json:request.responseJSONObject[@"result"][@"schcoupon"]];
        if (jianArr) {
            self.manjianArr = jianArr.mutableCopy;
        }
        if (ptarr) {
            [self.ptCouponArr addObjectsFromArray:ptarr];
        }
        if (scharr) {
            [self.schoolCouponArr addObjectsFromArray:scharr];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self checkPrice];
            self.headCell = [[WLKTConfirmOrderHeadCell alloc]initWithCourse:self.data oneprice:self.oneprice courseNumber:self.courseNumber manjian:self.manjianArr isPingou:self.isPingou priceName:self.priceName];

            double price = 0;
            if (self.data.courseinfo.have_pg.intValue == 1 && self.isPingou) {
                self.courseNumber = 1;
                price = self.data.courseinfo.pg_showprice.floatValue;
            }
            else{
                price = self.showprice.floatValue;
            }
            if ([self.priceName isEqualToString:@"一口价"]) {
                self.totalPrice = price;
            }
            else{
                self.totalPrice = self.courseNumber * price;
            }
            
            [self checkBottomPriceWithCount:self.courseNumber];
            [self.orderTableView reloadData];
        });
        
    } failure:^(__kindof YTKBaseRequest *request) {
        WS(weakSelf);
        self.orderTableView.state = WLKTViewStateError;
        self.orderTableView.emptyButtonClickBlock = ^{
            [weakSelf requestWithCourseId:weakSelf.data.courseinfo.cid addressId:weakSelf.addressId];
        };
    }];
}

#pragma mark - setupUI
- (void)setupUI{
    self.title = @"确认订单";
    self.view.backgroundColor = [UIColor whiteColor];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"箭头左"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonAct)];
    [self.payButton addTarget:self action:@selector(payOrderAct:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.orderTableView];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.payButton];
    [self.bottomView addSubview:self.priceLabel];
    [self.bottomView addSubview:self.totalLabel];
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

#pragma mark - keyboard
- (void)keyboardFrameChange:(NSNotification *)noti{
    CGRect keyboardFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.view.transform = CGAffineTransformMakeTranslation(0, keyboardFrame.origin.y - self.view.frame.size.height - 64);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 0;
    if (self.ptCouponArr.count > 0) {
        count ++;
    }
    if (self.schoolCouponArr.count > 0) {
        count ++;
    }
    switch (section) {
        case 0:
            return 1 + count;
        case 1:
            return 3;
        case 2:
            return 3;
        case 3://pay
//            return 3;
            return 2;

        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger count = 0;
    if (self.ptCouponArr.count > 0) {
        count ++;
    }
    if (self.schoolCouponArr.count > 0) {
        count ++;
    }
    switch (indexPath.section) {
        case 0:
            if (indexPath.row  == 0) {
                return 205;
            }
            if (count == 1) {
                if (indexPath.row == 1) {
                    return 50;
                }
                return 45;
            }
            if (count == 2) {
                if (indexPath.row == 1 || indexPath.row == 2) {
                    return 50;
                }
                return 45;
            }
            return 45;
        case 1:
            if (indexPath.row == 2) {
                return 50;
            }
            return 40;
        case 2: case 3:
            return 50;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 45;
    }
    return 5;
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
    
    NSArray *arr = @[@"确认课程信息", @"填写上课人信息", @"支付方式"];
    title.text = arr[section - 1];
    return v;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    [self checkPrice];
    if (section == 0) {
        UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        contentView.backgroundColor = [UIColor whiteColor];
        
        UILabel *youhuiLabel = [UILabel new];
        youhuiLabel.font = [UIFont systemFontOfSize:12];
        
        UILabel *totalLabel = [UILabel new];
        
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 40, ScreenWidth, 5)];
        v.backgroundColor = fillViewColor;
        [contentView addSubview:youhuiLabel];
        [contentView addSubview:totalLabel];
        [contentView addSubview:v];
        double youhui = self.ptYouhuiPrice + self.schoolYouhuiPrice + self.manjianPrice;
        if (youhui > 0) {
            NSString *str = [NSString stringWithFormat:@"已优惠¥%.2f", youhui];
            NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc]initWithString:str];
            [attStr setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12],
                                    NSForegroundColorAttributeName: KMainTextColor_3
                                    } range:NSMakeRange(0, 3)];
            [attStr setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14],
                                    NSForegroundColorAttributeName: kMainTextColor_red
                                    } range:NSMakeRange(3, str.length - 3)];
            youhuiLabel.attributedText = attStr;
        }
        NSString *strTotal = [NSString stringWithFormat:@"合计：¥%.2f", self.totalPrice - youhui];
        NSMutableAttributedString *attStrTotal = [[NSMutableAttributedString alloc]initWithString:strTotal];
        [attStrTotal setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12],
                                     NSForegroundColorAttributeName: KMainTextColor_3
                                     } range:NSMakeRange(0, 3)];
        [attStrTotal setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12],
                                     NSForegroundColorAttributeName: kMainTextColor_red
                                     } range:NSMakeRange(3, 1)];
        [attStrTotal setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14],
                                     NSForegroundColorAttributeName: kMainTextColor_red
                                     } range:NSMakeRange(4, strTotal.length - 4)];
        totalLabel.attributedText = attStrTotal;
        
        [totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(contentView);
            make.right.mas_equalTo(contentView.mas_right).offset(-15 * ScreenRatio_6);
        }];
        [youhuiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(contentView);
            make.right.mas_equalTo(totalLabel.mas_left).offset(-15 * ScreenRatio_6);
        }];

        return contentView;
    }
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 5)];
    v.backgroundColor = fillViewColor;
    return v;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];
    [self checkPrice];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell = self.headCell ? self.headCell : [UITableViewCell new];
        }
        else{
            WLKTConfirmOrderCouponCell *couponCell = [[WLKTConfirmOrderCouponCell alloc]init];
            if (self.ptCouponArr.count > 0 && self.schoolCouponArr.count == 0) {//只有平台优惠券
                [couponCell setCellTitle:@"平台优惠券折扣" couponCount:self.ptCouponArr.count youhuiPrice:self.ptYouhuiPrice];
                cell = couponCell;
            }
            else if (self.schoolCouponArr.count > 0 && self.ptCouponArr.count == 0) {//只有学校优惠券
                [couponCell setCellTitle:@"学校优惠券折扣" couponCount:self.schoolCouponArr.count youhuiPrice:self.schoolYouhuiPrice];
                cell = couponCell;
            }
            else{//都有
                if (indexPath.row == 1) {
                    [couponCell setCellTitle:@"平台优惠券折扣" couponCount:self.ptCouponArr.count youhuiPrice:self.ptYouhuiPrice];
                    cell = couponCell;
                }
                if (indexPath.row == 2) {
                    [couponCell setCellTitle:@"学校优惠券折扣" couponCount:self.schoolCouponArr.count youhuiPrice:self.schoolYouhuiPrice];
                    cell = couponCell;
                }
            }
        }
    }
    
    if (indexPath.section == 1) {
        WLKTConfirmOrderCourseMsgCell *msgCell = [[WLKTConfirmOrderCourseMsgCell alloc]init];
        
        NSString *classType = @"无";
        NSString *standard = @"无";
        NSString *address = @"无";
        NSString *location = @"";
        
        for (WLKTCDDataPriceSystem *p in self.oneprice.price_system ? self.oneprice.price_system : self.data.price_system) {
            
            if ([p.value isEqualToString:@"banxing"]) {
                for (CDDataPriceSystemSub *sub in p.sub) {
                    if (sub.checkStaus.intValue == 1) {
                        classType = sub.title;
                        break;
                    }
                }
            }
            if ([p.value isEqualToString:@"biaozhun"]) {
                for (CDDataPriceSystemSub *sub in p.sub) {
                    if (sub.checkStaus.intValue == 1) {
                        standard = sub.title;
                        break;
                    }
                }
            }
            if ([p.value isEqualToString:@"address"]) {
                for (CDDataPriceSystemSub *sub in p.sub) {
                    if (sub.checkStaus.intValue == 1) {
                        address = sub.title;
                        break;
                    }
                }
            }
        }
        
        for (WLKTCDDataPoint *p in self.data.point) {
            if ([p.name isEqualToString:address]) {
                location = p.address;
            }
        }
        
        [msgCell setCellData:@[@"课程班型", @"等级分类", @"授课点"] detail:@[classType, standard, address] location:location indexPath:indexPath];
        cell = msgCell;
    }
    if (indexPath.section == 2) {
        NSArray *arr = @[self.stdnameCell, self.stdageCell, self.stdphoneCell];
        cell = arr[indexPath.row];
    }
    if (indexPath.section == 3) {
        WLKTPayWayCell *payCell = [[WLKTPayWayCell alloc]init];
        [payCell setCellData:@[/*[UIImage imageNamed:@"tianfu"], */[UIImage imageNamed:@"支付宝"], [UIImage imageNamed:@"微信支付"]] title:@[/*@"钱包余额支付", */@"支付宝", @"微信"] indexPath:indexPath selectedItem:self.payCellSelectedItem];
        cell = payCell;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (self.ptCouponArr.count > 0 && self.schoolCouponArr.count > 0) {//都有
            if (indexPath.row == 1) {//平台优惠券
                [self couponAlertWithCoupon:self.ptCouponArr index:1];
            }
            if (indexPath.row == 2) {//学校优惠券
                [self couponAlertWithCoupon:self.schoolCouponArr index:2];
            }
        }
        if (self.ptCouponArr.count > 0 && self.schoolCouponArr.count == 0) {//只有平台优惠券
            if (indexPath.row == 1) {
                [self couponAlertWithCoupon:self.ptCouponArr index:1];
            }
        }
        if (self.ptCouponArr.count == 0 && self.schoolCouponArr.count > 0) {//只有学校优惠券
            if (indexPath.row == 1) {
                [self couponAlertWithCoupon:self.schoolCouponArr index:2];
            }
        }
    }
    if (indexPath.section == 3) {
        self.payButtonTag = self.payCellSelectedItem = indexPath.row;
        [self.orderTableView reloadSection:indexPath.section withRowAnimation:UITableViewRowAnimationNone];
    }
}

#pragma mark - checkPrice
- (void)checkPrice{
    //满减
    self.manjianPrice = 0;
    [self.manjianArr enumerateObjectsUsingBlock:^(WLKTCourseManjianData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            if (self.totalPrice < obj.man.floatValue) {
                *stop = YES;
            }
        }
        if (self.totalPrice >= obj.man.floatValue) {//现总价
            self.manjianPrice = obj.jian.integerValue;
            self.selectedManjianData = obj;
        }
        else{
            *stop = YES;
        }
    }];
}

- (void)checkBottomPriceWithCount:(NSInteger)count{
    self.courseNumber = count;

    double price = 0;
    if (self.data.courseinfo.have_pg.intValue == 1 && self.isPingou) {
        self.courseNumber = 1;
        price = self.data.courseinfo.pg_showprice.floatValue;
    }
    else{
        price = self.showprice.floatValue;
    }
    if ([self.priceName isEqualToString:@"一口价"]) {
        self.totalPrice = price;
    }
    else{
        self.totalPrice = self.courseNumber * price;
    }
    
    double youhuiPrice = self.ptYouhuiPrice + self.schoolYouhuiPrice + self.manjianPrice;
    if (youhuiPrice != 0) {
        self.totalLabel.text = [NSString stringWithFormat:@"总额:¥%.2f  优惠¥%.2f", self.totalPrice, youhuiPrice];
    }
    else{
        self.totalLabel.text = [NSString stringWithFormat:@"总额:¥%.2f", self.totalPrice];
    }
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"应付：¥%.2f", self.totalPrice - youhuiPrice]];
    [str setAttributes:@{NSForegroundColorAttributeName: KMainTextColor_3} range:NSMakeRange(0, 3)];
    [str setAttributes:@{NSForegroundColorAttributeName: kMainTextColor_red} range:NSMakeRange(3, str.length - 3)];
    self.priceLabel.attributedText = str;
}

#pragma mark - coupon alert delegate
- (void)courseDetailCouponSelected:(WLKTCourseCouponData *)data couponIndex:(NSInteger)couponIndex complete:(void (^)(void))complete{
    if (couponIndex == 1) {//平台优惠券
        if (self.totalPrice < data.man_money.integerValue) {
            [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"总额满¥ %ld才能使用", data.man_money.integerValue]];
            return;
        }
        else{
            self.selectedPtCoupon = data;
            self.ptYouhuiPrice = data.money.floatValue;
            complete();
        }
    }
    if (couponIndex == 2) {//学校优惠券
        if (self.totalPrice < data.man_money.integerValue) {
            [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"总额满¥ %ld才能使用", data.man_money.integerValue]];
            return;
        }
        else{
            self.selectedSchoolCoupon = data;
            self.schoolYouhuiPrice = data.money.floatValue;
            complete();
        }
    }
    [self checkBottomPriceWithCount:self.courseNumber];
    [self.orderTableView reloadData];
}

#pragma mark - head cell price & coupon change delegate
- (void)didSelectedTotalCourse:(NSInteger)total{
    [self checkBottomPriceWithCount:total];
    [self.orderTableView reloadData];
}

#pragma mark - student textField delegate
- (void)textFieldValueChanged:(NSString *)text indexTitle:(NSString *)title{
    if ([title isEqualToString:@"姓名"]) {
        self.studentName = text;
    }
    if ([title isEqualToString:@"年龄"]) {
        self.studentAge = text.intValue;
    }
    if ([title isEqualToString:@"电话"]) {
        self.studentPhoneNum = text;
    }
}

#pragma mark - button
- (void)couponAlertWithCoupon:(NSMutableArray<WLKTCourseCouponData *> *)coupon index:(NSInteger)index{
    WLKTCourseDetailCouponAlert *alert = [[WLKTCourseDetailCouponAlert alloc]initWithData:coupon isGetCoupon:NO couponIndex:index Target:self];
    alert.delegate = self;
    [self.view addSubview:alert];
}

- (void)backButtonAct{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)payWayTag:(NSNotification *)noti{
    NSString *tag = noti.userInfo[@"tag"];
    self.payButtonTag = tag.intValue;
}

- (void)payOrderAct:(UIButton *)payOrderButton{
    [self.view endEditing:YES];
    if ((self.studentName.length == 0 || self.studentName.length < 2 || self.studentName.length > 6) || ![self.studentName isValidChinese] ){
        [SVProgressHUD showInfoWithStatus:@"姓名输入不正确或未输入"];
        return;
    }
    else if (self.studentAge == 0 || self.studentAge > 200){
        [SVProgressHUD showInfoWithStatus:@"年龄输入不正确或未输入"];
        return;
    }
    else if (self.studentPhoneNum.length == 0 || ![self.studentPhoneNum isValidPhoneNumber]){
        [SVProgressHUD showInfoWithStatus:@"电话输入不正确或未输入"];
        return;
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSNSPush"];
        
        NSString *pay_type = [NSString stringWithFormat:@"%@,%@,%@", self.paramDic[@"priceType"], self.paramDic[@"classType"], self.paramDic[@"standard"]];
        dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.25);
        dispatch_after(t, dispatch_get_main_queue(), ^{
            /*if (self.payButtonTag == 0) {//天府银行
                [WLKTTianfuPay tianfuPayWithGoodsName:self.data.courseinfo.coursename counts:self.courseNumber suid:self.data.schinfo.suid uid:self.data.courseinfo.cid classType:self.paramDic[@"classType"] address:self.addressId personName:_studentName age:_studentAge phone:_studentPhoneNum target:self pay_type:pay_type school_mj:self.selectedManjianData.sid school_yhq:self.selectedSchoolCoupon.cid pt_yhq:self.selectedPtCoupon.cid];
                //NSLog(@"天府银行");
            }*/
            if (self.payButtonTag == 0) {//支付宝
                [WLKTAlipay AlipayWithGoodsName:self.data.courseinfo.coursename counts:self.courseNumber suid:self.data.schinfo.suid uid:self.data.courseinfo.cid classType:self.paramDic[@"classType"] address:self.addressId personName:self.studentName age:_studentAge phone:_studentPhoneNum total_amount:[NSString stringWithFormat:@"%.2f", self.totalPrice] pay_type:pay_type school_mj:self.selectedManjianData.sid school_yhq:self.selectedSchoolCoupon.cid pt_yhq:self.selectedPtCoupon.cid];
                //NSLog(@"支付宝");
            }
            if (self.payButtonTag == 1) {//weixin
                [WLKTWeixinPay WeixinPayWithGoodsName:self.data.courseinfo.coursename counts:self.courseNumber suid:self.data.schinfo.suid uid:self.data.courseinfo.cid classType:self.paramDic[@"classType"] address:self.addressId personName:self.studentName age:_studentAge phone:_studentPhoneNum total_amount:[NSString stringWithFormat:@"%.2f", self.totalPrice] pay_type:pay_type school_mj:self.selectedManjianData.sid school_yhq:self.selectedSchoolCoupon.cid pt_yhq:self.selectedPtCoupon.cid];
            }
        });
    }
}

#pragma mark - make constraints
- (void)makeConstraints{
    [self.orderTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, ScreenHeight - 50 - NavigationBarAndStatusHeight));
        make.top.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view);
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 50));
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.left.mas_equalTo(self.view);
    }];
    [self.payButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140 * ScreenRatio_6, 50));
        make.right.mas_equalTo(self.bottomView.mas_right);
        make.top.mas_equalTo(self.bottomView);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.payButton.mas_left).offset(-20 * ScreenRatio_6);
        make.top.mas_equalTo(self.bottomView).offset(10);
    }];
    [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.priceLabel.mas_bottom).offset(5);
        make.right.mas_equalTo(self.payButton.mas_left).offset(-20 * ScreenRatio_6);
    }];
}

#pragma mark - get
- (UITableView *)orderTableView{
    if (!_orderTableView) {
        _orderTableView = [[UITableView alloc]initWithFrame:CGRectNull style:UITableViewStyleGrouped];
        _orderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _orderTableView.dataSource = self;
        _orderTableView.delegate = self;
        _orderTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.01)];
    }
    return _orderTableView;
}
- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}
- (UIButton *)payButton{
    if (!_payButton) {
        _payButton = [[UIButton alloc]init];
        [_payButton setTitle:@"确认支付" forState:UIControlStateNormal];
        _payButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _payButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _payButton.backgroundColor = UIColorHex(33c4da);
    }
    return _payButton;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:15];
        _priceLabel.textAlignment = NSTextAlignmentRight;
    }
    return _priceLabel;
}
- (UILabel *)totalLabel{
    if (!_totalLabel) {
        _totalLabel = [UILabel new];
        _totalLabel.font = [UIFont systemFontOfSize:9];
        _totalLabel.textColor = KMainTextColor_3;
        _totalLabel.textAlignment = NSTextAlignmentRight;
    }
    return _totalLabel;
}
- (WLKTConfirmOrderStundentMsgCell *)stdnameCell{
    if (!_stdnameCell) {
        _stdnameCell = [[WLKTConfirmOrderStundentMsgCell alloc]initWithTitle:@"姓名" placeholder:@"请填写上课人的姓名"];
        _stdnameCell.delegate = self;
        _stdnameCell.detailTF.text = TheCurUser.truename;
    }
    return _stdnameCell;
}
- (WLKTConfirmOrderStundentMsgCell *)stdageCell{
    if (!_stdageCell) {
        _stdageCell = [[WLKTConfirmOrderStundentMsgCell alloc]initWithTitle:@"年龄" placeholder:@"请填写上课人的实际年龄"];
        _stdageCell.delegate = self;
        _stdageCell.detailTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _stdageCell;
}
- (WLKTConfirmOrderStundentMsgCell *)stdphoneCell{
    if (!_stdphoneCell) {
        _stdphoneCell = [[WLKTConfirmOrderStundentMsgCell alloc]initWithTitle:@"电话" placeholder:@"请填写上课人的手机号码"];
        _stdphoneCell.delegate = self;
        _stdphoneCell.detailTF.text = TheCurUser.phone;
        _stdphoneCell.detailTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _stdphoneCell;
}
- (NSMutableArray<WLKTCourseManjianData *> *)manjianArr{
    if (!_manjianArr) {
        _manjianArr = [NSMutableArray arrayWithCapacity:2];
    }
    return _manjianArr;
}
- (NSMutableArray<WLKTCourseCouponData *> *)ptCouponArr{
    if (!_ptCouponArr) {
        _ptCouponArr = [NSMutableArray arrayWithCapacity:5];
    }
    return _ptCouponArr;
}
- (NSMutableArray<WLKTCourseCouponData *> *)schoolCouponArr{
    if (!_schoolCouponArr) {
        _schoolCouponArr = [NSMutableArray arrayWithCapacity:5];
    }
    return _schoolCouponArr;
}

@end

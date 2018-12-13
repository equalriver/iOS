
//
//  WLKTCDCouponAlert.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/19.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDCouponAlert.h"
#import "WLKTCDGetCouponApi.h"

@interface CDCouponAlertTableCell: UITableViewCell
@property (strong, nonatomic) UIImageView *bgImgIV;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *ruleLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UILabel *stateLabel;

@property (assign, nonatomic) BOOL isGetCoupon;
@property (strong, nonatomic) WLKTCDDataCoupon *data;
@end

@implementation CDCouponAlertTableCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.bgImgIV];
        [self.bgImgIV addSubview:self.priceLabel];
        [self.bgImgIV addSubview:self.ruleLabel];
        [self.bgImgIV addSubview:self.timeLabel];
        [self.bgImgIV addSubview:self.stateLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)setData:(WLKTCDDataCoupon *)data{
    _data = data;
    self.priceLabel.text = data.money;
    self.ruleLabel.text = data.rule;
    self.timeLabel.text = data.time;
}

- (void)setIsGetCoupon:(BOOL)isGetCoupon{
    _isGetCoupon = isGetCoupon;
    if (isGetCoupon) {
        self.stateLabel.text = @"已经领取";
        self.stateLabel.textColor = KMainTextColor_9;
    }
    else{
        self.stateLabel.textColor = kMainTextColor_red;
        self.stateLabel.text = @"立即领取";
    }
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.priceLabel.text = nil;
    self.ruleLabel.text = nil;
    self.timeLabel.text = nil;
    
}

- (void)makeConstraints{
    [self.bgImgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth -25 *ScreenRatio_6, 90 *ScreenRatio_6));
        make.center.mas_equalTo(self.contentView);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgImgIV).offset(15 *ScreenRatio_6);
        make.top.mas_equalTo(self.bgImgIV).offset(10 *ScreenRatio_6);
    }];
    [self.ruleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.priceLabel);
        make.top.mas_equalTo(self.priceLabel.mas_bottom).offset(5);
        make.right.mas_equalTo(self.stateLabel.mas_left).offset(-30 *ScreenRatio_6);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.ruleLabel);
        make.top.mas_equalTo(self.ruleLabel.mas_bottom).offset(5);
    }];
    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60 *ScreenRatio_6, 20));
        make.centerY.mas_equalTo(self.bgImgIV);
        make.right.mas_equalTo(self.bgImgIV).offset(-20 *ScreenRatio_6);
    }];
}

#pragma mark - get
- (UIImageView *)bgImgIV{
    if (!_bgImgIV) {
        _bgImgIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"课程优惠券背景"]];
    }
    return _bgImgIV;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:28 *ScreenRatio_6];
        _priceLabel.textColor = kMainTextColor_red;
    }
    return _priceLabel;
}
- (UILabel *)ruleLabel{
    if (!_ruleLabel) {
        _ruleLabel = [UILabel new];
        _ruleLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _ruleLabel.textColor = kMainTextColor_red;
    }
    return _ruleLabel;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _timeLabel.textColor = kMainTextColor_red;
    }
    return _timeLabel;
}
- (UILabel *)stateLabel{
    if (!_stateLabel) {
        _stateLabel = [UILabel new];
        _stateLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _stateLabel.textColor = kMainTextColor_red;
        _stateLabel.text = @"立即领取";
    }
    return _stateLabel;
}

@end

/**********************************************************/
@interface WLKTCDCouponAlert ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIButton *closeBtn;

@property (strong, nonatomic) NSMutableArray<WLKTCDDataCoupon *> *ptCouponArr;
@property (strong, nonatomic) NSMutableArray<WLKTCDDataCoupon *> *schCouponArr;
@end

@implementation WLKTCDCouponAlert
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.tableView];
        [self.contentView addSubview:self.closeBtn];
        [self makeConstraints];
        
        [UIView viewAnimateComeOutWithDuration:0.5 delay:0 target:self.contentView completion:^(BOOL finished) {
            
        }];
        
    }
    return self;
}

- (void)setData:(WLKTCDData *)data{
    _data = data;
    [self.ptCouponArr removeAllObjects];
    [self.schCouponArr removeAllObjects];
    
    for (WLKTCDDataCoupon *obj in data.yhq) {
        if ([obj.platform isEqualToString:@"平台"]) {
            [self.ptCouponArr addObject:obj];
        }
        else{
            [self.schCouponArr addObject:obj];
        }
    }
    [self.tableView reloadData];
}

- (void)closeBtnAct{
    [UIView viewAnimateDismissWithDuration:0.5 delay:0 target:self.contentView completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger count = 0;
    if (self.ptCouponArr.count) {
        count++;
    }
    if (self.schCouponArr.count) {
        count++;
    }
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 0;
    if (self.ptCouponArr.count) {
        count++;
    }
    if (self.schCouponArr.count) {
        count++;
    }
    
    if (count == 1) {
        return self.ptCouponArr.count ? self.ptCouponArr.count : self.schCouponArr.count;
    }
    if (count == 2) {
        if (section == 0) {
            return self.ptCouponArr.count;
        }
        else{
            return self.schCouponArr.count;
        }
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110 *ScreenRatio_6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 55 *ScreenRatio_6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CDCouponAlertTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CDCouponAlertTableCell"];
    if (cell == nil) {
        cell = [[CDCouponAlertTableCell alloc]init];
    }
    if (indexPath.section == 0) {//平台?
        cell.data = self.ptCouponArr.count ? self.ptCouponArr[indexPath.row] : self.schCouponArr[indexPath.row];
    }
    if (indexPath.section == 1) {//机构
        cell.data = self.schCouponArr[indexPath.row];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 55 *ScreenRatio_6)];
    v.backgroundColor = [UIColor whiteColor];
    
    UILabel *l = [UILabel new];
    l.font = [UIFont systemFontOfSize:18 *ScreenRatio_6];
    l.textColor = KMainTextColor_3;
    [v addSubview:l];
    [l mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(v).offset(12.5 *ScreenRatio_6);
        make.right.centerY.mas_equalTo(v);
    }];
    if (section == 0) {//平台?
        l.text = self.ptCouponArr.count ? @"平台优惠券" : @"机构优惠券";
    }
    if (section == 1) {//机构
         l.text = @"机构优惠券";
    }
    return v;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CDCouponAlertTableCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    if (indexPath.section == 0) {//平台?

        if (self.ptCouponArr.count) {
            WLKTCDGetCouponApi *api = [[WLKTCDGetCouponApi alloc]initWithPingtaiCouponId:self.ptCouponArr[indexPath.row].cid];
            [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
                NSString *str = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"message"]];
                [SVProgressHUD showInfoWithStatus:str];
                cell.isGetCoupon = YES;
                
            } failure:^(__kindof YTKBaseRequest *request) {
                
            }];
        }
        else if (self.schCouponArr.count){
            WLKTCDGetCouponApi *api = [[WLKTCDGetCouponApi alloc]initWithSchoolCouponId:self.schCouponArr[indexPath.row].cid];
            [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
                NSString *str = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"message"]];
                [SVProgressHUD showInfoWithStatus:str];
                cell.isGetCoupon = YES;
                
            } failure:^(__kindof YTKBaseRequest *request) {
                
            }];
        }
    }
    if (indexPath.section == 1) {//机构
        WLKTCDGetCouponApi *api = [[WLKTCDGetCouponApi alloc]initWithSchoolCouponId:self.schCouponArr[indexPath.row].cid];
        [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            NSString *str = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"message"]];
            [SVProgressHUD showInfoWithStatus:str];
            cell.isGetCoupon = YES;
            
        } failure:^(__kindof YTKBaseRequest *request) {
            
        }];
    }
    
}

#pragma mark -
- (void)makeConstraints{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.centerX.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.closeBtn.mas_top).offset(-10 *ScreenRatio_6);
    }];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 50 *ScreenRatio_6));
        make.centerX.bottom.mas_equalTo(self.contentView);
    }];
}

#pragma mark - get
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 370 *ScreenRatio_6)];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}
- (UIButton *)closeBtn{
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        _closeBtn.titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        _closeBtn.backgroundColor = kMainTextColor_red;
        [_closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
        [_closeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(closeBtnAct) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}
- (NSMutableArray<WLKTCDDataCoupon *> *)ptCouponArr{
    if (!_ptCouponArr) {
        _ptCouponArr = [NSMutableArray arrayWithCapacity:3];
    }
    return _ptCouponArr;
}
- (NSMutableArray<WLKTCDDataCoupon *> *)schCouponArr{
    if (!_schCouponArr) {
        _schCouponArr = [NSMutableArray arrayWithCapacity:3];
    }
    return _schCouponArr;
}
@end



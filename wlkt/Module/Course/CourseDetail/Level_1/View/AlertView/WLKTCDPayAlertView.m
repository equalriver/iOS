//
//  WLKTCDPayAlertView.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/16.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDPayAlertView.h"
#import "WLKTConfirmOrderVC.h"
#import "WLKTCDPriceFilterApi.h"

@interface CDPayAlertViewCollectionCell: UICollectionViewCell
@property (strong, nonatomic) UILabel *itemLabel;
@property (strong, nonatomic) CDDataPriceSystemSub *data;
@property (assign, nonatomic) BOOL isSelected;

@end

@implementation CDPayAlertViewCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.itemLabel];
        [self.itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.width.height.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.itemLabel.text = nil;
    self.itemLabel.backgroundColor = kMainBackgroundColor;
    self.itemLabel.textColor = KMainTextColor_6;

}

- (void)setData:(CDDataPriceSystemSub *)data{
    _data = data;
    self.itemLabel.text = data.title;
}

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (isSelected) {
        self.itemLabel.textColor = [UIColor whiteColor];
        self.itemLabel.backgroundColor = kMainTextColor_red;
    }
    else{
        self.itemLabel.backgroundColor = kMainBackgroundColor;
        self.itemLabel.textColor = KMainTextColor_6;
    }
    
}

- (UILabel *)itemLabel{
    if (!_itemLabel) {
        _itemLabel = [[UILabel alloc]init];
        _itemLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
        _itemLabel.textColor = KMainTextColor_6;
        _itemLabel.layer.masksToBounds = YES;
        _itemLabel.layer.cornerRadius = 4 * ScreenRatio_6;
        _itemLabel.textAlignment = NSTextAlignmentCenter;
        _itemLabel.backgroundColor = kMainBackgroundColor;
    }
    return _itemLabel;
}
@end
/**********************************************************************/

@interface CDPayAlertTextFieldCell: UITableViewCell
@property (strong, nonatomic) UILabel *tagLabel;
@property (strong, nonatomic) UIView *courseSelectBgView;
@property (strong, nonatomic) UIButton *minusButton;
@property (strong, nonatomic) UIButton *addButton;
@property (strong, nonatomic) UITextField *courseNumTF;

@property (strong, nonatomic) WLKTCDOneprice *data;
@property (assign, nonatomic) BOOL isPingou;
@property (assign, nonatomic) NSInteger courseNumber;
@property (assign, nonatomic) NSInteger minCourseNumber;
@property (assign, nonatomic) NSInteger maxCourseNumber;
@property (copy, nonatomic) void(^buttonBlock)(NSInteger courseNumber);
@property (copy, nonatomic) void(^textFieldBlock)(NSInteger courseNumber);
@end

@implementation CDPayAlertTextFieldCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.tagLabel];
        [self.contentView addSubview:self.courseSelectBgView];
        [self.courseSelectBgView addSubview:self.minusButton];
        [self.courseSelectBgView addSubview:self.addButton];
        [self.courseSelectBgView addSubview:self.courseNumTF];
        [self makeConstraints];
    }
    return self;
}

- (void)setData:(WLKTCDOneprice *)data{
    _data = data;
    _minCourseNumber = data.mincourse.integerValue ? data.mincourse.integerValue : 1;
    _maxCourseNumber = data.totalcourse.integerValue ? data.totalcourse.integerValue : 999;
    self.courseNumTF.text = data.mincourse ? data.mincourse : @"1";
    self.courseNumber = _minCourseNumber;
}

- (void)setIsPingou:(BOOL)isPingou{
    _isPingou = isPingou;
    if (isPingou) {
        self.courseNumTF.text = @"1";
        self.courseNumber = _minCourseNumber = _maxCourseNumber = 1;
    }
}

- (void)courseNumAct:(UIButton *)sender{
    
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    if (self.maxCourseNumber) {
        if (sender.tag == 0) {// -
            if (self.courseNumber > self.minCourseNumber && self.courseNumber > 1) {
                self.courseNumber--;
            }
            else{
                [SVProgressHUD showInfoWithStatus:@"低于最小购买数"];
                return;
            }
        }
        if (sender.tag == 1) {// +
            if (self.courseNumber < self.maxCourseNumber) {
                self.courseNumber++;
            }
            else{
                [SVProgressHUD showInfoWithStatus:@"超出最大购买数"];
                return;
            }
        }
    }
    else{
        if (sender.tag == 0 && self.courseNumber > self.minCourseNumber && self.courseNumber > 1) {// -
            self.courseNumber--;
        }
        if (sender.tag == 1) {// +
            self.courseNumber++;
        }
    }
    self.courseNumTF.text = [NSString stringWithFormat:@"%ld", (long)self.courseNumber];

    //tag == 0 为 "-"
    !self.buttonBlock ?: self.buttonBlock(self.courseNumber);
    
}

- (void)courseNumTFAct:(UITextField *)sender{
    if (sender.text.integerValue > self.maxCourseNumber) {
        sender.text = [NSString stringWithFormat:@"%ld", (long)self.courseNumber];
        [SVProgressHUD showInfoWithStatus:@"超出最大购买数"];
        return;
    }
    if (sender.text.integerValue < self.minCourseNumber) {
        sender.text = [NSString stringWithFormat:@"%ld", (long)self.courseNumber];
        [SVProgressHUD showInfoWithStatus:@"低于最小购买数"];
        return;
    }
    !self.textFieldBlock ?: self.textFieldBlock(sender.text.integerValue);

}

- (void)makeConstraints{
    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(70, 20 *ScreenRatio_6));
    }];
    [self.courseSelectBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(115 , 30));
        make.right.mas_equalTo(self.contentView).offset(-10 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.minusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(28, 30));
        make.left.mas_equalTo(self.courseSelectBgView);
        make.centerY.mas_equalTo(self.courseSelectBgView);
    }];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(28, 30));
        make.right.mas_equalTo(self.courseSelectBgView.mas_right);
        make.centerY.mas_equalTo(self.courseSelectBgView);
    }];
    [self.courseNumTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(55, 30));
        make.center.mas_equalTo(self.courseSelectBgView);
    }];
}

#pragma mark - get
- (UILabel *)tagLabel{
    if (!_tagLabel) {
        _tagLabel = [UILabel new];
        _tagLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _tagLabel.textColor = KMainTextColor_6;
        _tagLabel.text = @"选择课时";
    }
    return _tagLabel;
}
- (UIView *)courseSelectBgView{
    if (!_courseSelectBgView) {
        _courseSelectBgView = [UIView new];
        _courseSelectBgView.layer.borderColor = UIColorHex(231812).CGColor;
        _courseSelectBgView.layer.borderWidth = 0.5;
        _courseSelectBgView.layer.masksToBounds = YES;
        _courseSelectBgView.layer.cornerRadius = 2.5 * ScreenRatio_6;
        _courseSelectBgView.backgroundColor = [UIColor whiteColor];
    }
    return _courseSelectBgView;
}
- (UIButton *)minusButton{
    if (!_minusButton) {
        _minusButton = [[UIButton alloc]init];
        [_minusButton setTitle:@"-" forState:UIControlStateNormal];
        [_minusButton setTitleColor:KMainTextColor_3 forState:UIControlStateNormal];
        _minusButton.titleLabel.font = [UIFont systemFontOfSize:20 * ScreenRatio_6];
        _minusButton.tag = 0;
        [_minusButton addTarget:self action:@selector(courseNumAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _minusButton;
}
- (UIButton *)addButton{
    if (!_addButton) {
        _addButton = [[UIButton alloc]init];
        [_addButton setTitle:@"+" forState:UIControlStateNormal];
        [_addButton setTitleColor:KMainTextColor_3 forState:UIControlStateNormal];
        _addButton.titleLabel.font = [UIFont systemFontOfSize:18 * ScreenRatio_6];
        _addButton.tag = 1;
        [_addButton addTarget:self action:@selector(courseNumAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}
- (UITextField *)courseNumTF{
    if (!_courseNumTF) {
        _courseNumTF = [[UITextField alloc]init];
        _courseNumTF.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _courseNumTF.textColor = KMainTextColor_3;
        _courseNumTF.layer.borderColor = UIColorHex(231812).CGColor;
        _courseNumTF.layer.borderWidth = 0.5;
        _courseNumTF.textAlignment = NSTextAlignmentCenter;
        _courseNumTF.keyboardType = UIKeyboardTypeNumberPad;
        [_courseNumTF addTarget:self action:@selector(courseNumTFAct:) forControlEvents:UIControlEventValueChanged | UIControlEventEditingChanged];
        _courseNumTF.text = @"1";
    }
    return _courseNumTF;
}
@end

/**********************************************************************/
@interface WLKTCDPayAlertView ()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIView *tapBgView;
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) YYLabel *rawPriceLabel;
@property (strong, nonatomic) UITableView *contentScroll;
@property (strong, nonatomic) UIButton *commitBtn;
@property (strong, nonatomic) UIViewController *targetVC;

@property (assign, nonatomic) NSInteger courseNumber;
@property (strong, nonatomic) NSMutableDictionary<NSIndexPath *, UICollectionView *> *collectionDic;
@property (strong, nonatomic) NSMutableDictionary *payParamDic;
@property (strong, nonatomic) WLKTCDOneprice *priceNewData;
@property (copy, nonatomic) NSString *addressId;
@property (copy, nonatomic) NSString *showprice;
@property (copy, nonatomic) NSString *oldprice;
@property (assign, nonatomic) BOOL isPingou;
@property (assign, nonatomic) BOOL isPriceRefresh;
@end

@implementation WLKTCDPayAlertView

- (instancetype)initWithFrame:(CGRect)frame target:(UIViewController *)targetVC isPingou:(BOOL)isPingou
{
    self = [super initWithFrame:frame];
    if (self) {
        _targetVC = targetVC;
        _isPingou = isPingou;
        self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
        [self addSubview:self.tapBgView];
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.imgIV];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.rawPriceLabel];
        [self.contentView addSubview:self.contentScroll];
        [self.contentView addSubview:self.commitBtn];
        [self makeConstraints];
        
        WS(weakSelf);
        [self.tapBgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            [UIView viewAnimateDismissWithDuration:0.7 delay:0.0 target:weakSelf.contentView completion:^(BOOL finished) {
                if (finished) {
                    [weakSelf endEditing:YES];
                    [weakSelf removeFromSuperview];

                }
            }];
        }]];
        
        [UIView viewAnimateComeOutWithDuration:0.7 delay:0.0 target:self.contentView completion:^(BOOL finished) {
            if (finished) {
                
            }
        }];
    }
    //keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - set
- (void)setCourseData:(WLKTCDData *)courseData{
    _courseData = courseData;
    self.courseNumber = courseData.oneprice.mincourse.integerValue ? courseData.oneprice.mincourse.integerValue : 1;
    [self.imgIV setImageURL:[NSURL URLWithString:courseData.courseinfo.img]];
    self.titleLabel.text = courseData.courseinfo.coursename;
    NSString *price = @"";
    if (courseData.courseinfo.have_pg.intValue == 1 && self.isPingou) {
        price = courseData.courseinfo.pg_showprice;
    }
    else{
        price = courseData.courseinfo.showprice;
    }
    self.showprice = price;
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@", price];
    [self.priceLabel alignBottom];
    
    if (courseData.courseinfo.oldprice.length) {
        self.oldprice = courseData.courseinfo.oldprice;
        NSMutableAttributedString *s = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@", courseData.courseinfo.oldprice]];
        [s setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14 *ScreenRatio_6], NSForegroundColorAttributeName: KMainTextColor_9} range:NSMakeRange(0, s.length)];
        [s setTextStrikethrough:[YYTextDecoration decorationWithStyle:YYTextLineStyleSingle | YYTextLineStylePatternSolid]];
        
        self.rawPriceLabel.attributedText = s;
    }
}

- (void)setData:(NSArray<WLKTCDDataPriceSystem *> *)data{
    _data = [data copy];
    [self.contentScroll reloadData];
    [self filterPayParam:data];
}

#pragma mark - aciton
- (void)updatePrice:(WLKTCDOneprice *)data{
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@", data.showprice];
    [self.priceLabel alignBottom];
    self.showprice = data.showprice;
    if (!data.oldprice.length) {
        return;
    }
    self.oldprice = data.oldprice;
    NSMutableAttributedString *s = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@", data.oldprice]];
    [s setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14 *ScreenRatio_6], NSForegroundColorAttributeName: KMainTextColor_9} range:NSMakeRange(0, s.length)];
    [s setTextStrikethrough:[YYTextDecoration decorationWithStyle:YYTextLineStyleSingle | YYTextLineStylePatternSolid]];
    
    self.rawPriceLabel.attributedText = s;
}

- (void)filterPayParam:(NSArray<WLKTCDDataPriceSystem *> *)data{
    
    __block NSString *priceType = @"";
    __block NSString *classType = @"";
    __block NSString *standard = @"";
    __block NSString *address = @"";
    __block NSString *priceName = @"";
    [data enumerateObjectsUsingBlock:^(WLKTCDDataPriceSystem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj.value isEqualToString:@"shoufei"]) {
            for (CDDataPriceSystemSub *sub in obj.sub) {
                if (sub.checkStaus.intValue == 1) {
                    priceType = sub.index;
                    if ([sub.title isEqualToString:@"一口价"]) {
                        priceName = @"一口价";
                    }
                }
            }
        }
        if ([obj.value isEqualToString:@"banxing"]) {
            for (CDDataPriceSystemSub *sub in obj.sub) {
                if (sub.checkStaus.intValue == 1) {
                    classType = sub.index;
                    break;
                }
            }
        }
        if ([obj.value isEqualToString:@"biaozhun"]) {
            for (CDDataPriceSystemSub *sub in obj.sub) {
                if (sub.checkStaus.intValue == 1) {
                    standard = sub.index;
                    break;
                }
            }
        }
        if ([obj.value isEqualToString:@"address"]) {
            for (CDDataPriceSystemSub *sub in obj.sub) {
                if (sub.checkStaus.intValue == 1) {
                    address = sub.index;
                    break;
                }
            }
        }
        
    }];
    self.payParamDic[@"priceType"] = priceType;
    self.payParamDic[@"classType"] = classType;
    self.payParamDic[@"standard"] = standard;
    self.payParamDic[@"address"] = address;
    self.payParamDic[@"priceName"] = priceName;
}

- (void)commitBtnAct:(UIButton *)sender{
    [self endEditing:YES];
    if (!self.showprice && !self.oldprice) {
        return;
    }
    dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.25);
    dispatch_after(t, dispatch_get_main_queue(), ^{
        self.payParamDic[@"courseNumber"] = @(self.courseNumber);
        self.payParamDic[@"showprice"] = self.showprice;
        self.payParamDic[@"oldprice"] = self.oldprice;
        self.payParamDic[@"oneprice"] = self.priceNewData ? self.priceNewData : self.courseData.oneprice;
        WLKTConfirmOrderVC *vc = [[WLKTConfirmOrderVC alloc]initWithCourseData:self.courseData dic:self.payParamDic];
        vc.isPingou = self.isPingou;
        [self.targetVC.navigationController pushViewController:vc animated:YES];
        [self removeFromSuperview];
    });
}

#pragma mark - keyboard
- (void)keyboardFrameChange:(NSNotification *)noti{
    CGRect keyboardFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.transform = CGAffineTransformMakeTranslation(0, keyboardFrame.origin.y - self.frame.size.height);
}

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == self.data.count) {
        return 60;
    }
    return 45 *ScreenRatio_6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40 *ScreenRatio_6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    if (indexPath.section == self.data.count) {//购买课时
        CDPayAlertTextFieldCell *c = [[CDPayAlertTextFieldCell alloc]init];
        c.data = self.courseData.oneprice;
        c.isPingou = self.isPingou;
        c.textFieldBlock = ^(NSInteger courseNumber) {
            self.courseNumber = courseNumber;
        };
        c.buttonBlock = ^(NSInteger courseNumber) {
            self.courseNumber = courseNumber;
        };
        cell = c;
    }
    else{
        if ([self.collectionDic.allKeys containsObject:indexPath] && self.collectionDic[indexPath]) {
            [cell.contentView addSubview:self.collectionDic[indexPath]];
        }
        else{
            UICollectionView *cv = [self createCollectionViewWithTag:indexPath.section];
            [cell.contentView addSubview:cv];
            self.collectionDic[indexPath] = cv;

        }
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40 *ScreenRatio_6)];
    v.backgroundColor = [UIColor whiteColor];
    
    UILabel *l = [UILabel new];
    l.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
    l.textColor = KMainTextColor_3;
    [v addSubview:l];
    [l mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(v).offset(10 *ScreenRatio_6);
        make.bottom.mas_equalTo(v);
        make.height.mas_equalTo(30 *ScreenRatio_6);
    }];
    
    UIView *sep = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5)];
    sep.backgroundColor = kMainBackgroundColor;
    [v addSubview:sep];
    
    if (section == self.data.count) {//购买课时
        l.text = @"购买课时";
    }
    else{
        l.text = self.data[section].name;
    }
    
    return v;
}

#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.data.count > collectionView.tag) {
        return self.data[collectionView.tag].sub.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CDPayAlertViewCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CDPayAlertViewCollectionCell" forIndexPath:indexPath];
    if (self.priceNewData) {
        cell.data = self.priceNewData.price_system[collectionView.tag].sub[indexPath.item];
    }
    else{
        cell.data = self.data[collectionView.tag].sub[indexPath.item];
    }
    
    cell.isSelected = false;
    if (cell.data.checkStaus.intValue == 1) {
        cell.isSelected = YES;
    }
    else{
        cell.isSelected = false;
    }
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    __block WLKTCDPriceFilterType type = WLKTCDPriceFilterTypeDefault;
    __block NSString *priceType = @"";
    __block NSString *classType = @"";
    __block NSString *standard = @"";
    __block NSString *address = @"";
    
    [self.data enumerateObjectsUsingBlock:^(WLKTCDDataPriceSystem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (!self.collectionDic[[NSIndexPath indexPathForRow:0 inSection:idx]]) {
            *stop = YES;
        }
        
        if (self.collectionDic[[NSIndexPath indexPathForRow:0 inSection:idx]] == collectionView) {
            if ([obj.value isEqualToString:@"shoufei"]) {
                type = WLKTCDPriceFilterTypePriceType;
                priceType = obj.sub[indexPath.item].index;
            }
            if ([obj.value isEqualToString:@"banxing"]) {
                type = WLKTCDPriceFilterTypeClassType;
                classType = obj.sub[indexPath.item].index;
            }
            if ([obj.value isEqualToString:@"biaozhun"]) {
                type = WLKTCDPriceFilterTypeStandard;
                standard = obj.sub[indexPath.item].index;
            }
            if ([obj.value isEqualToString:@"address"]) {
                address = obj.sub[indexPath.item].index;
                type = WLKTCDPriceFilterTypeAddress;
            }
            if ([obj.value isEqualToString:@"tese"]) {
                return ;
            }
        }
        else{
            if ([obj.value isEqualToString:@"shoufei"]) {
                for (CDDataPriceSystemSub *sub in obj.sub) {
                    if (sub.checkStaus.intValue == 1) {
                        priceType = sub.index;
                        break;
                    }
                }
            }
            if ([obj.value isEqualToString:@"banxing"]) {
                for (CDDataPriceSystemSub *sub in obj.sub) {
                    if (sub.checkStaus.intValue == 1) {
                        classType = sub.index;
                        break;
                    }
                }
            }
            if ([obj.value isEqualToString:@"biaozhun"]) {
                for (CDDataPriceSystemSub *sub in obj.sub) {
                    if (sub.checkStaus.intValue == 1) {
                        standard = sub.index;
                        break;
                    }
                }
            }
            if ([obj.value isEqualToString:@"address"]) {
                for (CDDataPriceSystemSub *sub in obj.sub) {
                    if (sub.checkStaus.intValue == 1) {
                        address = sub.index;
                        break;
                    }
                }
            }
        }
    }];

    self.addressId = address;
    self.payParamDic[@"priceType"] = priceType;
    self.payParamDic[@"classType"] = classType;
    self.payParamDic[@"standard"] = standard;
    self.payParamDic[@"address"] = address;
    double lat = self.currentCoordinate.latitude;
    double lng = self.currentCoordinate.longitude;
    WLKTCDPriceFilterApi *api = [[WLKTCDPriceFilterApi alloc]initWithCourseId:self.courseData.courseinfo.cid priceType:priceType classType:classType standard:standard address:address type:type lat:[NSString stringWithFormat:@"%lf", lat] lng:[NSString stringWithFormat:@"%lf", lng]];
    
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        
        self.priceNewData = [WLKTCDOneprice modelWithJSON:request.responseJSONObject];
        [self filterPayParam:self.priceNewData.price_system];
        [self updatePrice:self.priceNewData];
        [collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
        
    } failure:^(__kindof YTKBaseRequest *request) {
        
    }];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self endEditing:YES];
}

#pragma mark - collection view flow layout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    CGFloat w = [self.data[collectionView.tag].sub[indexPath.item].title getSizeWithHeight:30 *ScreenRatio_6 Font:14 *ScreenRatio_6].width;
    return CGSizeMake(w + 30 *ScreenRatio_6, 30 *ScreenRatio_6);
    
}

- (UICollectionView *)createCollectionViewWithTag:(NSInteger)tag {
    
    UICollectionViewFlowLayout *l = [UICollectionViewFlowLayout new];
    l.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    l.sectionInset = UIEdgeInsetsMake(0, 10 *ScreenRatio_6, 10 *ScreenRatio_6, 0);
    l.minimumLineSpacing = 5;
    l.minimumInteritemSpacing = 5;
    UICollectionView *_collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40 *ScreenRatio_6) collectionViewLayout:l];
    _collectionView.bounces = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsHorizontalScrollIndicator = false;
    [_collectionView registerClass:[CDPayAlertViewCollectionCell class] forCellWithReuseIdentifier:@"CDPayAlertViewCollectionCell"];
    _collectionView.tag = tag;

    return _collectionView;
    
}

#pragma mark - make constraints
- (void)makeConstraints{
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(115 * ScreenRatio_6, 85 * ScreenRatio_6));
        make.top.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
    }];
    [self.rawPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.priceLabel.mas_right).offset(10 * ScreenRatio_6);
        make.bottom.mas_equalTo(self.priceLabel.mas_bottom);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(240 * ScreenRatio_6);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.priceLabel.mas_bottom).offset(5);
        make.bottom.mas_equalTo(self.imgIV);
    }];
    [self.contentScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.imgIV.mas_bottom).offset(10 *ScreenRatio_6);
        make.bottom.mas_equalTo(self.commitBtn.mas_top);
    }];
    [self.commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 50 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
}

#pragma mark - get
- (UIView *)tapBgView{
    if (!_tapBgView) {
        _tapBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 480 *ScreenRatio_6)];
        _tapBgView.userInteractionEnabled = YES;
    }
    return _tapBgView;
}
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 480 *ScreenRatio_6)];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}
- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [UIImageView new];
        _imgIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imgIV;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:16 * ScreenRatio_6];
        _titleLabel.textColor = KMainTextColor_3;
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:24 * ScreenRatio_6 weight:UIFontWeightSemibold];
        _priceLabel.textColor = kMainTextColor_red;
    }
    return _priceLabel;
}
- (YYLabel *)rawPriceLabel{
    if (!_rawPriceLabel) {
        _rawPriceLabel = [[YYLabel alloc]init];
    }
    return _rawPriceLabel;
}
- (UITableView *)contentScroll{
    if (!_contentScroll) {
        _contentScroll = [[UITableView alloc]initWithFrame:CGRectNull style:UITableViewStyleGrouped];
        _contentScroll.backgroundColor = [UIColor whiteColor];
        _contentScroll.showsVerticalScrollIndicator = false;
        _contentScroll.delegate = self;
        _contentScroll.dataSource = self;
        _contentScroll.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _contentScroll;
}
- (UIButton *)commitBtn{
    if (!_commitBtn) {
        _commitBtn = [UIButton new];
        [_commitBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_commitBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        _commitBtn.backgroundColor = kMainTextColor_red;
        _commitBtn.titleLabel.font = [UIFont systemFontOfSize:18 * ScreenRatio_6 weight:UIFontWeightSemibold];
        [_commitBtn addTarget:self action:@selector(commitBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commitBtn;
}
- (NSMutableDictionary<NSIndexPath *,UICollectionView *> *)collectionDic{
    if (!_collectionDic) {
        _collectionDic = [NSMutableDictionary dictionaryWithCapacity:5];
    }
    return _collectionDic;
}
- (NSMutableDictionary *)payParamDic{
    if (!_payParamDic) {
        _payParamDic = [NSMutableDictionary dictionaryWithCapacity:5];
    }
    return _payParamDic;
}
@end


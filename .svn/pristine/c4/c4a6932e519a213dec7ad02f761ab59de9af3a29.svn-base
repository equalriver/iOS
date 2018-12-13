//
//  WLKTConfirmOrderHeadCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/28.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTConfirmOrderHeadCell.h"

@interface WLKTConfirmOrderHeadCell ()
@property (strong, nonatomic) UIImageView *iconIV;
@property (strong, nonatomic) UILabel *schoolNameLabel;
@property (strong, nonatomic) UIView *grayBgView;
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) UILabel *courseNameLabel;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *typeLabel;
@property (strong, nonatomic) UILabel *rawPriceLabel;
@property (strong, nonatomic) UILabel *courseNumLabel;

@property (strong, nonatomic) UILabel *courseNumTitleLabel;
@property (strong, nonatomic) UIButton *minusBtn;
@property (strong, nonatomic) UITextField *courseTF;
@property (strong, nonatomic) UIButton *addBtn;
@property (strong, nonatomic) UIView *separatorView_1;
@property (strong, nonatomic) UIViewController *vc;

@property (assign, nonatomic) NSInteger courseNumber;
@property (assign, nonatomic) NSInteger minCourseNumber;

@property (strong, nonatomic) WLKTCDData *data;
@property (strong, nonatomic) WLKTCDOneprice *oneprice;
@property (assign, nonatomic) BOOL isPingou;
@property (strong, nonatomic) NSArray<WLKTCourseManjianData *> *manjian;
@property (copy, nonatomic) NSString *priceName;
@end
@implementation WLKTConfirmOrderHeadCell

- (instancetype)initWithCourse:(WLKTCDData *)data oneprice:(WLKTCDOneprice *)oneprice courseNumber:(NSInteger)courseNumber manjian:(NSArray<WLKTCourseManjianData *> *)manjian isPingou:(BOOL)isPingou priceName:(NSString *)priceName
{
    self = [super init];
    if (self) {
        _data = data;
        _isPingou = isPingou;
        _priceName = priceName;
        _oneprice = oneprice;
        _courseNumber = courseNumber;
        _manjian = [NSArray arrayWithArray:manjian];
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.schoolNameLabel];
        [self.contentView addSubview:self.grayBgView];
        [self.grayBgView addSubview:self.imgIV];
        [self.grayBgView addSubview:self.courseNameLabel];
        [self.grayBgView addSubview:self.priceLabel];
        [self.grayBgView addSubview:self.typeLabel];
        [self.grayBgView addSubview:self.rawPriceLabel];
        [self.grayBgView addSubview:self.courseNumLabel];

        [self.contentView addSubview:self.courseNumTitleLabel];
        [self.contentView addSubview:self.minusBtn];
        [self.contentView addSubview:self.courseTF];
        [self.contentView addSubview:self.addBtn];
        [self.contentView addSubview:self.separatorView_1];
        
        [self createManjianView];
        [self makeConstraints];
        [self.minusBtn addTarget:self action:@selector(buyCourseAct:) forControlEvents:UIControlEventTouchUpInside];
        [self.addBtn addTarget:self action:@selector(buyCourseAct:) forControlEvents:UIControlEventTouchUpInside];
        [self setCellData];
    }
    return self;
}

- (void)createManjianView{
    if (self.manjian.count == 0) {
        return;
    }
    for (int i = 0; i < self.manjian.count; i++) {
        UIView *saleBgView = [[UIView alloc]init];
        saleBgView.backgroundColor = UIColorHex(feebe1);
        
        UILabel *saleTagLabel = [[UILabel alloc]init];
        saleTagLabel.text = @"减";
        saleTagLabel.font = [UIFont systemFontOfSize:9];
        saleTagLabel.textColor = UIColorHex(ffffff);
        saleTagLabel.backgroundColor = kMainTextColor_red;
        saleTagLabel.textAlignment = NSTextAlignmentCenter;
        saleTagLabel.layer.masksToBounds = YES;
        saleTagLabel.layer.cornerRadius = 1.5;
        
        UILabel *saleTitleLabel = [UILabel new];
        saleTitleLabel.font = [UIFont systemFontOfSize:10];
        saleTitleLabel.textColor = UIColorHex(ef5040);
        saleTitleLabel.text = self.manjian[i].str;
        
        [self.contentView addSubview:saleBgView];
        [saleBgView addSubview:saleTagLabel];
        [saleBgView addSubview:saleTitleLabel];
        [saleBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(ScreenWidth, 15));
            make.left.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.grayBgView.mas_bottom).offset(i * 15);
        }];
        [saleTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(12, 12));
            make.left.mas_equalTo(saleBgView).offset(15 * ScreenRatio_6);
            make.centerY.mas_equalTo(saleBgView);
        }];
        [saleTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(330 * ScreenRatio_6, 15));
            make.left.mas_equalTo(saleTagLabel.mas_right).offset(5);
            make.centerY.mas_equalTo(saleBgView);
        }];
    }
}

#pragma mark - set data
- (void)setCellData{
   
    if (self.data.oneprice.mincourse) {
        self.minCourseNumber = self.oneprice.mincourse.integerValue ? self.oneprice.mincourse.integerValue : 1;
    }
    else{
        self.minCourseNumber = self.oneprice.minks.integerValue ? self.oneprice.minks.integerValue : 1;
    }
   
    self.schoolNameLabel.text = self.data.schinfo.schoolname;
    [self.imgIV setImageURL:[NSURL URLWithString:self.data.courseinfo.img]];
    self.courseNameLabel.text = self.data.courseinfo.coursename;
    if (self.data.courseinfo.have_pg.intValue == 1 && self.isPingou) {
        self.courseNumber = 1;
    }
    [self setPrice:self.courseNumber];

}

- (void)setPrice:(NSInteger)count{
    NSInteger num = count;

    self.courseTF.text = [NSString stringWithFormat:@"%ld", (long)count];
    self.courseNumLabel.text = [NSString stringWithFormat:@"x%ld", (long)count];
    double price = 0;
    double totalPrice = 0;
    if (self.data.courseinfo.have_pg.intValue == 1 && self.isPingou) {
        price = self.data.courseinfo.pg_showprice.floatValue;
    }
    else{
        price = self.oneprice.showprice.floatValue ? self.oneprice.showprice.floatValue : self.data.courseinfo.showprice.floatValue;
    }
    if ([self.priceName isEqualToString:@"一口价"]) {
        totalPrice = price;
        num = 1;
    }
    else{
        totalPrice = num * price;
    }
    self.priceLabel.text = [NSString stringWithFormat:@"¥%.2f", totalPrice];
//    self.typeLabel.text = self.course.target;
    for (WLKTCDDataPriceSystem *p in self.oneprice.price_system ? self.oneprice.price_system : self.data.price_system) {
        if ([p.value isEqualToString:@"shoufei"]) {
            for (CDDataPriceSystemSub *s in p.sub) {
                if (s.checkStaus.intValue == 1) {
                    self.typeLabel.text = s.title;
                }
            }
        }
    }
    if (self.oneprice.oldprice && ![self.oneprice.oldprice containsString:@"null"] && ![self.oneprice.oldprice isEqualToString:@""]) {
        NSString *str = [NSString stringWithFormat:@"原价：¥%@", [NSString stringWithFormat:@"%.2f", self.oneprice.oldprice.floatValue * num]];
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc]initWithString:str];
        [attStr setAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlinePatternSolid | NSUnderlineStyleSingle),
                                NSFontAttributeName: [UIFont systemFontOfSize:13]
                                } range:NSMakeRange(3, str.length - 3)];
        [attStr setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]
                                } range:NSMakeRange(0, 3)];
        self.rawPriceLabel.attributedText = attStr;
    }
//    self.totalPrice = self.priceData.price.floatValue * num;
    if ([self.delegate respondsToSelector:@selector(didSelectedTotalCourse:)]) {
        [self.delegate didSelectedTotalCourse:num];
    }
}

#pragma mark - action
- (void)buyCourseAct:(UIButton *)sender{
    [self.vc.view endEditing:YES];
    if (self.isPingou) {
        [SVProgressHUD showInfoWithStatus:@"限购一课时"];
        return;
    }
    if (self.oneprice.totalcourse || self.oneprice.maxks) {
        NSInteger max = self.oneprice.totalcourse.integerValue ? self.oneprice.totalcourse.integerValue : self.oneprice.maxks.integerValue;
        if (sender.tag == 0 && self.courseNumber > self.minCourseNumber) {// -
            self.courseNumber--;
        }
        if (sender.tag == 1 && self.courseNumber < max) {// +
            self.courseNumber++;
        }
    }
    else{
        if (sender.tag == 0 && self.courseNumber > self.minCourseNumber) {// -
            self.courseNumber--;
        }
        if (sender.tag == 1) {// +
            self.courseNumber++;
        }
    }
    self.courseTF.text = [NSString stringWithFormat:@"%ld", self.courseNumber];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setPrice:self.courseNumber];
    });
}


#pragma mark - make constraints
- (void)makeConstraints{
    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(12);
    }];
    [self.schoolNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconIV.mas_right).offset(6);
        make.centerY.mas_equalTo(self.iconIV);
    }];
    [self.grayBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 100));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.iconIV.mas_bottom).offset(12);
    }];
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(111, 83));
        make.left.mas_equalTo(self.grayBgView);
        make.centerY.mas_equalTo(self.grayBgView);
    }];
    [self.courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(235 * ScreenRatio_6, 18));
        make.left.mas_equalTo(self.imgIV.mas_right).offset(5);
        make.top.mas_equalTo(self.grayBgView).offset(20);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgIV.mas_right).offset(5);
        make.top.mas_equalTo(self.courseNameLabel.mas_bottom).offset(15);
    }];
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 11));
        make.left.mas_equalTo(self.priceLabel.mas_right).offset(7);
        make.centerY.mas_equalTo(self.priceLabel);
    }];
    [self.rawPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgIV.mas_right).offset(5);
        make.top.mas_equalTo(self.priceLabel.mas_bottom);
    }];
    [self.courseNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.grayBgView.mas_right).offset(-15 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.rawPriceLabel);
    }];
    [self.courseNumTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.grayBgView.mas_bottom).offset(15 + self.manjian.count * 15);
    }];
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(34, 27));
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.courseNumTitleLabel);
    }];
    [self.courseTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(34, 27));
        make.right.mas_equalTo(self.addBtn.mas_left).offset(-3);
        make.centerY.mas_equalTo(self.courseNumTitleLabel);
    }];
    [self.minusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(34, 27));
        make.right.mas_equalTo(self.courseTF.mas_left).offset(-3);
        make.centerY.mas_equalTo(self.courseNumTitleLabel);
    }];
    [self.separatorView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.top.mas_equalTo(self.courseNumTitleLabel.mas_bottom).offset(15);
        make.left.mas_equalTo(self.contentView);
    }];
}

#pragma mark - get
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"课程详情学校"]];
    }
    return _iconIV;
}
- (UILabel *)schoolNameLabel{
    if (!_schoolNameLabel) {
        _schoolNameLabel = [UILabel new];
        _schoolNameLabel.font = [UIFont systemFontOfSize:12];
        _schoolNameLabel.textColor = KMainTextColor_3;
    }
    return _schoolNameLabel;
}
- (UIView *)grayBgView{
    if (!_grayBgView) {
        _grayBgView = [UIView new];
        _grayBgView.backgroundColor = UIColorHex(f5f5f5);
    }
    return _grayBgView;
}
- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [UIImageView new];
    }
    return _imgIV;
}
- (UILabel *)courseNameLabel{
    if (!_courseNameLabel) {
        _courseNameLabel = [UILabel new];
        _courseNameLabel.font = [UIFont systemFontOfSize:12];
        _courseNameLabel.textColor = KMainTextColor_3;
        _courseNameLabel.numberOfLines = 2;
    }
    return _courseNameLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightSemibold];
        _priceLabel.textColor = UIColorHex(ee402d);
    }
    return _priceLabel;
}
- (UILabel *)typeLabel{
    if (!_typeLabel) {
        _typeLabel = [UILabel new];
        _typeLabel.font = [UIFont systemFontOfSize:9];
        _typeLabel.textColor = KMainTextColor_9;
        _typeLabel.backgroundColor = UIColorHex(ececec);
    }
    return _typeLabel;
}
- (UILabel *)rawPriceLabel{
    if (!_rawPriceLabel) {
        _rawPriceLabel = [UILabel new];
        _rawPriceLabel.textColor = UIColorHex(c0c0c0);
    }
    return _rawPriceLabel;
}
- (UILabel *)courseNumLabel{
    if (!_courseNumLabel) {
        _courseNumLabel = [UILabel new];
        _courseNumLabel.font = [UIFont systemFontOfSize:12];
        _courseNumLabel.textColor = KMainTextColor_3;
    }
    return _courseNumLabel;
}
- (UILabel *)courseNumTitleLabel{
    if (!_courseNumTitleLabel) {
        _courseNumTitleLabel = [UILabel new];
        _courseNumTitleLabel.font = [UIFont systemFontOfSize:14];
        _courseNumTitleLabel.textColor = KMainTextColor_3;
        _courseNumTitleLabel.text = @"课时数";
    }
    return _courseNumTitleLabel;
}
- (UIButton *)minusBtn{
    if (!_minusBtn) {
        _minusBtn = [UIButton new];
        [_minusBtn setTitle:@"-" forState:UIControlStateNormal];
        [_minusBtn setTitleColor:KMainTextColor_3 forState:UIControlStateNormal];
        _minusBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _minusBtn.backgroundColor = UIColorHex(ececec);
        _minusBtn.tag = 0;
    }
    return _minusBtn;
}
- (UITextField *)courseTF{
    if (!_courseTF) {
        _courseTF = [UITextField new];
        _courseTF.font = [UIFont systemFontOfSize:14];
        _courseTF.textColor = KMainTextColor_3;
        _courseTF.backgroundColor = UIColorHex(f6f6f6);
        _courseTF.textAlignment = NSTextAlignmentCenter;
        _courseTF.userInteractionEnabled = NO;
    }
    return _courseTF;
}
- (UIButton *)addBtn{
    if (!_addBtn) {
        _addBtn = [UIButton new];
        [_addBtn setTitle:@"+" forState:UIControlStateNormal];
        [_addBtn setTitleColor:KMainTextColor_3 forState:UIControlStateNormal];
        _addBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _addBtn.backgroundColor = UIColorHex(ececec);
        _addBtn.tag = 1;
    }
    return _addBtn;
}
- (UIView *)separatorView_1{
    if (!_separatorView_1) {
        _separatorView_1 = [UIView new];
        _separatorView_1.backgroundColor = separatorView_color;
    }
    return _separatorView_1;
}

@end

//
//  WLKTPayCourseCell.m
//  wlkt
//
//  Created by 尹平江 on 17/3/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUnPayCourseCell.h"

@implementation WLKTUnPayCourseCell

#pragma mark - init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellContent:(WLKTPayCourseData *)data{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];
        
        [self.contentView addSubview:self.separatorView_1];
        [self.contentView addSubview:self.separatorView_2];
        [self.contentView addSubview:self.separatorView_3];
        [self.contentView addSubview:self.separatorView_4];
        [self.contentView addSubview:self.separatorView_5];
        [self.contentView addSubview:self.schoolIconIV];
        [self.contentView addSubview:self.schoolTitleBtn];
        [self.contentView addSubview:self.payTimeLabel];
        [self.contentView addSubview:self.payStateLabel];
        [self.contentView addSubview:self.courseImageView];
        [self.contentView addSubview:self.courseNameLabel];
        [self.contentView addSubview:self.priceTypeLabel];
        [self.contentView addSubview:self.courseTypeLabel];
        [self.contentView addSubview:self.standardLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.rawPriceLabel];
        [self.contentView addSubview:self.courseNumLabel];
        [self.contentView addSubview:self.tradeNumIcon];
        [self.contentView addSubview:self.tradeNumLabel];
        [self.contentView addSubview:self.openTimeIcon];
        [self.contentView addSubview:self.openTimeLabel];
        [self.contentView addSubview:self.locationImageView];
        [self.contentView addSubview:self.locationMsgLabel];
        [self.contentView addSubview:self.totalPriceTagLabel];
        [self.contentView addSubview:self.totalPriceLabel];
        [self.contentView addSubview:self.youhuiPriceTagLabel];
        [self.contentView addSubview:self.youhuiPriceLabel];
        [self.contentView addSubview:self.payPriceLabel];
        [self.contentView addSubview:self.goPayBtn];
    }
    return self;
}

#pragma mark - setData
- (void)setCellContent:(WLKTPayCourseData *)data{
    [self.schoolTitleBtn setTitle:[NSString stringWithFormat:@"%@ ", data.schoolname] forState:UIControlStateNormal];
    [self.courseImageView setImageWithURL:[NSURL URLWithString: data.img] options:YYWebImageOptionProgressive];
    self.courseNameLabel.text = data.coursename;
    self.payTimeLabel.text = data.payment_notify_time;
    self.courseTypeLabel.text = data.ctype;
    if (data.standard.length > 0) {
        self.standardLabel.text = data.standard;
    }
    else{
        self.standardLabel.hidden = YES;
    }
    self.priceLabel.text = [NSString stringWithFormat:@"¥%.2f", data.price.doubleValue];
    NSString *rawStr = [NSString stringWithFormat:@"¥ %.2f", data.oldprice.doubleValue];
    NSMutableAttributedString *rawAttStr = [[NSMutableAttributedString alloc]initWithString:rawStr];
    [rawAttStr setAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlinePatternSolid | NSUnderlineStyleSingle)
                               } range:NSMakeRange(0, rawAttStr.length)];
    self.rawPriceLabel.attributedText = rawAttStr;
    self.priceTypeLabel.text = data.feestype;
    self.courseNumLabel.text = [NSString stringWithFormat:@"x%@", data.keshi];
    self.tradeNumLabel.text = [NSString stringWithFormat:@"报名编号：%@", data.orderid];
    self.openTimeLabel.text = [NSString stringWithFormat:@"预计开班时间：%@", @"暂无"];
    self.locationMsgLabel.text = [NSString stringWithFormat:@"%@: %@",data.pointname, data.pointaddress];
    self.totalPriceLabel.text = [NSString stringWithFormat:@"¥%.2f", data.totalmoney.doubleValue];
    double youhui = data.ptyhq.doubleValue + data.schyhq.doubleValue;
    if (youhui > 0) {
        self.youhuiPriceLabel.text = [NSString stringWithFormat:@"-¥%.2f", youhui];
    }
    else{
        self.youhuiPriceLabel.text = @"无折扣";
    }
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"合计：¥%.2f", data.totalmoney.doubleValue - youhui]];
    [str setAttributes:@{NSForegroundColorAttributeName: KMainTextColor_3,
                         NSFontAttributeName: [UIFont systemFontOfSize:12]
                         } range:NSMakeRange(0, 3)];
    [str setAttributes:@{NSForegroundColorAttributeName: UIColorHex(ee402d),
                         NSFontAttributeName: [UIFont systemFontOfSize:12]
                         } range:NSMakeRange(3, 1)];
    [str setAttributes:@{NSForegroundColorAttributeName: UIColorHex(ee402d),
                         NSFontAttributeName: [UIFont systemFontOfSize:15]
                         } range:NSMakeRange(4, str.length - 7)];
    [str setAttributes:@{NSForegroundColorAttributeName: UIColorHex(ee402d),
                         NSFontAttributeName: [UIFont systemFontOfSize:10]
                         } range:NSMakeRange(str.length - 3, 3)];
    self.payPriceLabel.attributedText = str;
    [self makeConstraints];
}

#pragma mark - makeConstraints
- (void)makeConstraints{
    [self.schoolIconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(12);
    }];
    [self.schoolTitleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.schoolIconIV.mas_right).offset(7);
        make.centerY.mas_equalTo(self.schoolIconIV);
    }];
    [self.payStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.schoolIconIV);
    }];
    [self.payTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.payStateLabel.mas_left).offset(-5);
        make.centerY.mas_equalTo(self.schoolIconIV);
    }];
    //分割线1
    [self.separatorView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.top.mas_equalTo(self.schoolIconIV.mas_bottom).offset(12);
    }];
    [self.courseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 55));
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView_1.mas_bottom).offset(8);
    }];
    [self.courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.courseImageView);
        make.left.mas_equalTo(self.courseImageView.mas_right).offset(6);
    }];
    [self.courseTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 15));
        make.left.mas_equalTo(self.courseImageView.mas_right).offset(6);
        make.bottom.mas_equalTo(self.courseImageView.mas_bottom);
    }];
    [self.standardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 15));
        make.centerY.mas_equalTo(self.courseTypeLabel);
        make.left.mas_equalTo(self.courseTypeLabel.mas_right).offset(4);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15 * ScreenRatio_6);
        make.top.mas_equalTo(self.courseImageView);
    }];
    [self.rawPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15 * ScreenRatio_6);
        make.top.mas_equalTo(self.priceLabel.mas_bottom).offset(5);
    }];
    [self.priceTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15 * ScreenRatio_6);
        make.top.mas_equalTo(self.rawPriceLabel.mas_bottom).offset(5);
    }];
    [self.courseNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15 * ScreenRatio_6);
        make.top.mas_equalTo(self.priceTypeLabel.mas_bottom).offset(5);
    }];
    [self.separatorView_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.top.mas_equalTo(self.courseImageView.mas_bottom).offset(12);
    }];
    [self.tradeNumIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(12, 12));
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView_2.mas_bottom).offset(12);
    }];
    [self.tradeNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.tradeNumIcon.mas_right).offset(5);
        make.centerY.mas_equalTo(self.tradeNumIcon);
    }];
    [self.separatorView_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.top.mas_equalTo(self.tradeNumIcon.mas_bottom).offset(12);
    }];
    [self.openTimeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(12, 12));
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView_3.mas_bottom).offset(12);
    }];
    [self.openTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.openTimeIcon.mas_right).offset(5);
        make.centerY.mas_equalTo(self.openTimeIcon);
    }];
    [self.locationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(12, 12));
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.openTimeIcon.mas_bottom).offset(8);
    }];
    [self.locationMsgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.locationImageView.mas_right).offset(5);
        make.centerY.mas_equalTo(self.locationImageView);
        make.width.mas_equalTo(330 * ScreenRatio_6);
    }];
    [self.separatorView_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.top.mas_equalTo(self.locationImageView.mas_bottom).offset(12);
    }];
    [self.totalPriceTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView_4.mas_bottom).offset(12);
    }];
    [self.totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.totalPriceTagLabel);
    }];
    [self.youhuiPriceTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.totalPriceTagLabel.mas_bottom).offset(8);
    }];
    [self.youhuiPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.youhuiPriceTagLabel);
    }];
    [self.separatorView_5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.top.mas_equalTo(self.youhuiPriceTagLabel.mas_bottom).offset(12);
    }];
    [self.goPayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 25));
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView_5).offset(13);
    }];
    [self.payPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.goPayBtn.mas_left).offset(-10);
        make.centerY.mas_equalTo(self.goPayBtn);
    }];
}

#pragma mark - Reuse

- (void)prepareForReuse{
    [super prepareForReuse];
    [self.schoolTitleBtn setTitle:@"" forState:UIControlStateNormal];
    self.courseImageView.image = nil;
    self.courseNameLabel.text = nil;
    self.priceTypeLabel.text = nil;
    self.courseTypeLabel.text = nil;
    self.standardLabel.text = nil;
    self.priceLabel.text = nil;
    self.rawPriceLabel.attributedText = nil;
    self.courseNumLabel.text = nil;
    self.tradeNumLabel.text = nil;
    self.openTimeLabel.text = nil;
    self.locationMsgLabel.text = nil;
    self.totalPriceLabel.text = nil;
    self.youhuiPriceLabel.text = nil;
    self.payPriceLabel.attributedText = nil;
}

#pragma mark - get
- (UIView *)separatorView_1{
    if (!_separatorView_1) {
        _separatorView_1 = [[UIView alloc]init];
        _separatorView_1.backgroundColor = separatorView_color;
    }
    return _separatorView_1;
}
- (UIView *)separatorView_2{
    if (!_separatorView_2) {
        _separatorView_2 = [[UIView alloc]init];
        _separatorView_2.backgroundColor = separatorView_color;
    }
    return _separatorView_2;
}
- (UIView *)separatorView_3{
    if (!_separatorView_3) {
        _separatorView_3 = [[UIView alloc]init];
        _separatorView_3.backgroundColor = separatorView_color;
    }
    return _separatorView_3;
}
- (UIView *)separatorView_4{
    if (!_separatorView_4) {
        _separatorView_4 = [[UIView alloc]init];
        _separatorView_4.backgroundColor = separatorView_color;
    }
    return _separatorView_4;
}
- (UIView *)separatorView_5{
    if (!_separatorView_5) {
        _separatorView_5 = [[UIView alloc]init];
        _separatorView_5.backgroundColor = separatorView_color;
    }
    return _separatorView_5;
}
- (UIImageView *)schoolIconIV{
    if (!_schoolIconIV) {
        _schoolIconIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"我报名的_学校"]];
    }
    return _schoolIconIV;
}
- (WLKTExchangeButton *)schoolTitleBtn{
    if (!_schoolTitleBtn) {
        _schoolTitleBtn = [WLKTExchangeButton new];
        [_schoolTitleBtn setImage:[UIImage imageNamed:@"我报名的_进入"] forState:UIControlStateNormal];
        _schoolTitleBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_schoolTitleBtn setTitleColor:UIColorHex(6c6c6c) forState:UIControlStateNormal];
    }
    return _schoolTitleBtn;
}
- (UILabel *)payTimeLabel{
    if (!_payTimeLabel) {
        _payTimeLabel = [UILabel new];
        _payTimeLabel.font = [UIFont systemFontOfSize:12];
        _payTimeLabel.textColor = KMainTextColor_3;
    }
    return _payTimeLabel;
}
- (UILabel *)payStateLabel{
    if (!_payStateLabel) {
        _payStateLabel = [UILabel new];
        _payStateLabel.font = [UIFont systemFontOfSize:13];
        _payStateLabel.textColor = UIColorHex(ff5a4a);
        _payStateLabel.text = @"待支付";
    }
    return _payStateLabel;
}
- (UIImageView *)courseImageView{
    if (!_courseImageView) {
        _courseImageView = [UIImageView new];
    }
    return _courseImageView;
}
- (UILabel *)courseNameLabel{
    if (!_courseNameLabel) {
        _courseNameLabel = [UILabel new];
        _courseNameLabel.font = [UIFont systemFontOfSize:12];
        _courseNameLabel.textColor = KMainTextColor_3;
        _courseNameLabel.numberOfLines = 3;
    }
    return _courseNameLabel;
}
- (UILabel *)priceTypeLabel{
    if (!_priceTypeLabel) {
        _priceTypeLabel = [UILabel new];
        _priceTypeLabel.font = [UIFont systemFontOfSize:9];
        _priceTypeLabel.textColor = KMainTextColor_9;
        _priceTypeLabel.backgroundColor = UIColorHex(e8e9eb);
        _priceTypeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _priceTypeLabel;
}
- (UILabel *)courseTypeLabel{
    if (!_courseTypeLabel) {
        _courseTypeLabel = [UILabel new];
        _courseTypeLabel.font = [UIFont systemFontOfSize:9];
        _courseTypeLabel.textColor = UIColorHex(33c4da);
        _courseTypeLabel.textAlignment = NSTextAlignmentCenter;
        _courseTypeLabel.layer.masksToBounds = YES;
        _courseTypeLabel.layer.cornerRadius = 1;
        _courseTypeLabel.layer.borderColor = UIColorHex(33c4da).CGColor;
        _courseTypeLabel.layer.borderWidth = 0.5;
    }
    return _courseTypeLabel;
}
- (UILabel *)standardLabel{
    if (!_standardLabel) {
        _standardLabel = [UILabel new];
        _standardLabel.font = [UIFont systemFontOfSize:9];
        _standardLabel.textColor = UIColorHex(33c4da);
        _standardLabel.textAlignment = NSTextAlignmentCenter;
        _standardLabel.layer.masksToBounds = YES;
        _standardLabel.layer.cornerRadius = 1;
        _standardLabel.layer.borderColor = UIColorHex(33c4da).CGColor;
        _standardLabel.layer.borderWidth = 0.5;
    }
    return _standardLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:13];
        _priceLabel.textColor = KMainTextColor_3;
        _priceLabel.textAlignment = NSTextAlignmentRight;
    }
    return _priceLabel;
}
- (UILabel *)rawPriceLabel{
    if (!_rawPriceLabel) {
        _rawPriceLabel = [UILabel new];
        _rawPriceLabel.font = [UIFont systemFontOfSize:10];
        _rawPriceLabel.textColor = UIColorHex(c0c0c0);
        _rawPriceLabel.textAlignment = NSTextAlignmentRight;
    }
    return _rawPriceLabel;
}
- (UILabel *)courseNumLabel{
    if (!_courseNumLabel) {
        _courseNumLabel = [UILabel new];
        _courseNumLabel.font = [UIFont systemFontOfSize:10];
        _courseNumLabel.textColor = KMainTextColor_9;
        _courseNumLabel.textAlignment = NSTextAlignmentRight;
    }
    return _courseNumLabel;
}
- (UIImageView *)tradeNumIcon{
    if (!_tradeNumIcon) {
        _tradeNumIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"活动报名"]];
    }
    return _tradeNumIcon;
}
- (UILabel *)tradeNumLabel{
    if (!_tradeNumLabel) {
        _tradeNumLabel = [[UILabel alloc]init];
        _tradeNumLabel.font = [UIFont systemFontOfSize:12];
        _tradeNumLabel.textColor = KMainTextColor_3;
    }
    return _tradeNumLabel;
}
- (UIImageView *)openTimeIcon{
    if (!_openTimeIcon) {
        _openTimeIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"时间"]];
    }
    return _openTimeIcon;
}
- (UILabel *)openTimeLabel{
    if (!_openTimeLabel) {
        _openTimeLabel = [[UILabel alloc]init];
        _openTimeLabel.textColor = KMainTextColor_3;
        _openTimeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _openTimeLabel;
}
- (UIImageView *)locationImageView{
    if (!_locationImageView) {
        _locationImageView = [[UIImageView alloc]init];
        _locationImageView.image = [UIImage imageNamed:@"定位"];
    }
    return _locationImageView;
}
- (UILabel *)locationMsgLabel{
    if (!_locationMsgLabel) {
        _locationMsgLabel = [[UILabel alloc]init];
        _locationMsgLabel.font = [UIFont systemFontOfSize:12];
        _locationMsgLabel.numberOfLines = 0;
        _locationMsgLabel.textColor = KMainTextColor_3;
    }
    return _locationMsgLabel;
}
- (UILabel *)totalPriceTagLabel{
    if (!_totalPriceTagLabel) {
        _totalPriceTagLabel = [UILabel new];
        _totalPriceTagLabel.font = [UIFont systemFontOfSize:12];
        _totalPriceTagLabel.textColor = KMainTextColor_3;
        _totalPriceTagLabel.text = @"总额";
    }
    return _totalPriceTagLabel;
}
- (UILabel *)totalPriceLabel{
    if (!_totalPriceLabel) {
        _totalPriceLabel = [UILabel new];
        _totalPriceLabel.font = [UIFont systemFontOfSize:12];
        _totalPriceLabel.textColor = KMainTextColor_3;
        _totalPriceLabel.textAlignment = NSTextAlignmentRight;
    }
    return _totalPriceLabel;
}
- (UILabel *)youhuiPriceTagLabel{
    if (!_youhuiPriceTagLabel) {
        _youhuiPriceTagLabel = [UILabel new];
        _youhuiPriceTagLabel.font = [UIFont systemFontOfSize:12];
        _youhuiPriceTagLabel.textColor = KMainTextColor_3;
        _youhuiPriceTagLabel.text = @"优惠券折扣";
    }
    return _youhuiPriceTagLabel;
}
- (UILabel *)youhuiPriceLabel{
    if (!_youhuiPriceLabel) {
        _youhuiPriceLabel = [UILabel new];
        _youhuiPriceLabel.font = [UIFont systemFontOfSize:12];
        _youhuiPriceLabel.textColor = KMainTextColor_3;
        _youhuiPriceLabel.textAlignment = NSTextAlignmentRight;
    }
    return _youhuiPriceLabel;
}
- (UILabel *)payPriceLabel{
    if (!_payPriceLabel) {
        _payPriceLabel = [UILabel new];
        _payPriceLabel.textAlignment = NSTextAlignmentRight;
    }
    return _payPriceLabel;
}
- (UIButton *)goPayBtn{
    if (!_goPayBtn) {
        _goPayBtn = [UIButton new];
        [_goPayBtn setTitle:@"去支付" forState:UIControlStateNormal];
        _goPayBtn.backgroundColor = UIColorHex(33c4da);
        _goPayBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_goPayBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
    }
    return _goPayBtn;
}
@end


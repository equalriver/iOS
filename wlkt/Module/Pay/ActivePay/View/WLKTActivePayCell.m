//
//  WLKTActivePayCell.m
//  wlkt
//
//  Created by 尹平江 on 2017/7/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivePayCell.h"
#import "WLKTActivePayWayTV.h"
#import "WLKTLogin.h"

@interface WLKTActivePayCell ()
@property (strong, nonatomic) WLKTActivePayWayTV *payWayTableView;

@end

@implementation WLKTActivePayCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.registerCountLabel];
        [self.contentView addSubview:self.separatorView_1];
        [self.contentView addSubview:self.addButton];
        [self.contentView addSubview:self.buyTF];
        [self.contentView addSubview:self.minusButton];
        [self.contentView addSubview:self.totalLabel];
        [self.contentView addSubview:self.separatorView_2];
        [self.contentView addSubview:self.separatorView_3];
        [self.contentView addSubview:self.separatorView_4];
        [self.contentView addSubview:self.fillViewOne];
        [self.contentView addSubview:self.studentInfoTitle];
        [self.contentView addSubview:self.studentNameLabel];
        [self.contentView addSubview:self.studentNameTF];
        [self.contentView addSubview:self.phoneLabel];
        [self.contentView addSubview:self.phoneTF];
        [self.contentView addSubview:self.fillViewTwo];
        [self.contentView addSubview:self.payTypeTitle];
        [self.contentView addSubview:self.payWayTableView];
        [self.contentView addSubview:self.studentBadgeLabel];
        [self.contentView addSubview:self.phoneBadgeLabel];
    }
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    return self;
}

#pragma mark - updateConstraints

- (void)updateConstraints{

    [self.registerCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 20 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
    }];
    
    [self.separatorView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 1));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.registerCountLabel.mas_bottom).offset(15 * ScreenRatio_6);
    }];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35 * ScreenRatio_6, 28 * ScreenRatio_6));
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.registerCountLabel);
    }];
    [self.buyTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35 * ScreenRatio_6, 28 * ScreenRatio_6));
        make.right.mas_equalTo(self.addButton.mas_left).offset(-2);
        make.centerY.mas_equalTo(self.registerCountLabel);
    }];
    [self.minusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35 * ScreenRatio_6, 28 * ScreenRatio_6));
        make.centerY.mas_equalTo(self.registerCountLabel);
        make.right.mas_equalTo(self.buyTF.mas_left).offset(-2);
    }];
    [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth - 50 * ScreenRatio_6, 30 * ScreenRatio_6));
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView_1.mas_bottom).offset(10 * ScreenRatio_6);
    }];
    [self.fillViewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 5));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.totalLabel.mas_bottom).offset(10 * ScreenRatio_6);
    }];
    [self.studentInfoTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth/2, 20 * ScreenRatio_6));
        make.top.mas_equalTo(self.fillViewOne.mas_bottom).offset(10 * ScreenRatio_6);
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
    }];
    [self.separatorView_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 1));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.studentInfoTitle.mas_bottom).offset(10 * ScreenRatio_6);
    }];
    [self.studentNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35 * ScreenRatio_6, 20 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView_2.mas_bottom).offset(15 * ScreenRatio_6);
    }];
    [self.studentBadgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15 * ScreenRatio_6, 15 * ScreenRatio_6));
        make.left.mas_equalTo(self.studentNameLabel.mas_right);
        make.top.mas_equalTo(self.studentNameLabel);
    }];
    [self.studentNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(250 * ScreenRatio_6, 20 * ScreenRatio_6));
        make.left.mas_equalTo(self.studentBadgeLabel.mas_right);
        make.centerY.mas_equalTo(self.studentNameLabel);
    }];
    [self.separatorView_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 1));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.studentNameLabel.mas_bottom).offset(15 * ScreenRatio_6);
    }];
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35 * ScreenRatio_6, 20 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView_3.mas_bottom).offset(15 * ScreenRatio_6);
    }];
    [self.phoneBadgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15 * ScreenRatio_6, 15 * ScreenRatio_6));
        make.left.mas_equalTo(self.phoneLabel.mas_right);
        make.top.mas_equalTo(self.separatorView_3.mas_bottom).offset(15 * ScreenRatio_6);
    }];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(250 * ScreenRatio_6, 20 * ScreenRatio_6));
        make.left.mas_equalTo(self.phoneBadgeLabel.mas_right);
        make.centerY.mas_equalTo(self.phoneLabel);
    }];
    [self.fillViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 5));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.phoneLabel.mas_bottom).offset(15 * ScreenRatio_6);
    }];
    [self.payTypeTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80 * ScreenRatio_6, 20 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.fillViewTwo.mas_bottom).offset(10 * ScreenRatio_6);
    }];
    [self.separatorView_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 1));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.payTypeTitle.mas_bottom).offset(10 * ScreenRatio_6);
    }];
    [self.payWayTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 180 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.separatorView_4.mas_bottom);
    }];
    
    [super updateConstraints];
}

#pragma mark - get

- (UILabel *)registerCountLabel{
    if (!_registerCountLabel) {
        _registerCountLabel = [[UILabel alloc]init];
        _registerCountLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _registerCountLabel.text = @"报名人数";
        _registerCountLabel.font = [UIFont systemFontOfSize:14];
    }
    return _registerCountLabel;
}
- (UIButton *)minusButton{
    if (!_minusButton) {
        _minusButton = [[UIButton alloc]init];
        [_minusButton setTitle:@"－" forState:UIControlStateNormal];
        [_minusButton setBackgroundColor:[UIColor colorWithHexString:@"#ececec"]];
        [_minusButton setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
        _minusButton.tag = 0;
    }
    return _minusButton;
}
- (UIButton *)addButton{
    if (!_addButton) {
        _addButton = [[UIButton alloc]init];
        [_addButton setTitle:@"＋" forState:UIControlStateNormal];
        [_addButton setBackgroundColor:[UIColor colorWithHexString:@"#ececec"]];
        [_addButton setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
        _addButton.tag = 1;
    }
    return _addButton;
}
- (UITextField *)buyTF{
    if (!_buyTF) {
        _buyTF = [[UITextField alloc]init];
        _buyTF.textAlignment = NSTextAlignmentCenter;
        _buyTF.textColor = [UIColor colorWithHexString:@"#666666"];
        _buyTF.keyboardType = UIKeyboardTypeNumberPad;
        _buyTF.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
    }
    return _buyTF;
}
- (UILabel *)totalLabel{
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.textAlignment = NSTextAlignmentRight;
    }
    return _totalLabel;
}

- (UILabel *)studentInfoTitle{
    if (!_studentInfoTitle) {
        _studentInfoTitle = [[UILabel alloc]init];
        _studentInfoTitle.text = @"填写报名信息";
        _studentInfoTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        _studentInfoTitle.font = [UIFont systemFontOfSize:14];
    }
    return _studentInfoTitle;
}
- (UILabel *)studentNameLabel{
    if (!_studentNameLabel) {
        _studentNameLabel = [[UILabel alloc]init];
        _studentNameLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _studentNameLabel.text = @"姓名";
        _studentNameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _studentNameLabel;
}
- (UILabel *)studentBadgeLabel{
    if (!_studentBadgeLabel) {
        _studentBadgeLabel = [[UILabel alloc]init];
        _studentBadgeLabel.textColor = kMainTextColor_red;
        _studentBadgeLabel.text = @"*";
        _studentBadgeLabel.font = [UIFont systemFontOfSize:20 * ScreenRatio_6];
    }
    return _studentBadgeLabel;
}
- (UILabel *)phoneLabel{
    if (!_phoneLabel) {
        _phoneLabel = [[UILabel alloc]init];
        _phoneLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _phoneLabel.text = @"电话";
        _phoneLabel.font = [UIFont systemFontOfSize:14];
    }
    return _phoneLabel;
}
- (UILabel *)phoneBadgeLabel{
    if (!_phoneBadgeLabel) {
        _phoneBadgeLabel = [[UILabel alloc]init];
        _phoneBadgeLabel.textColor = kMainTextColor_red;
        _phoneBadgeLabel.text = @"*";
        _phoneBadgeLabel.font = [UIFont systemFontOfSize:20 * ScreenRatio_6];
    }
    return _phoneBadgeLabel;
}
- (UITextField *)studentNameTF{
    if (!_studentNameTF) {
        _studentNameTF = [[UITextField alloc]init];
        _studentNameTF.placeholder = @"请填写你的姓名";
        _studentNameTF.text = TheCurUser.truename;
        _studentNameTF.font = [UIFont systemFontOfSize:11];
        _studentNameTF.textColor = [UIColor colorWithHexString:@"#333333"];
        _studentNameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _studentNameTF;
}
- (UITextField *)phoneTF{
    if (!_phoneTF) {
        _phoneTF = [[UITextField alloc]init];
        _phoneTF.placeholder = @"请填写你的手机号码";
        _phoneTF.text = TheCurUser.phone;
        _phoneTF.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTF.font = [UIFont systemFontOfSize:11];
        _phoneTF.textColor = [UIColor colorWithHexString:@"#333333"];
        _phoneTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _phoneTF;
}
-(UILabel *)payTypeTitle{
    if (!_payTypeTitle) {
        _payTypeTitle = [[UILabel alloc]init];
        _payTypeTitle.text = @"支付方式";
        _payTypeTitle.font = [UIFont systemFontOfSize:14];
        _payTypeTitle.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _payTypeTitle;
}

- (UIView *)fillViewOne{
    if (!_fillViewOne) {
        _fillViewOne = [[UIView alloc]init];
        _fillViewOne.backgroundColor = fillViewColor;
    }
    return _fillViewOne;
}
- (UIView *)fillViewTwo{
    if (!_fillViewTwo) {
        _fillViewTwo = [[UIView alloc]init];
        _fillViewTwo.backgroundColor = fillViewColor;
    }
    return _fillViewTwo;
}
- (UIView *)separatorView_1{
    if (!_separatorView_1) {
        _separatorView_1 = [[UIView alloc]init];
        _separatorView_1.backgroundColor = fillViewColor;
    }
    return _separatorView_1;
}
- (UIView *)separatorView_2{
    if (!_separatorView_2) {
        _separatorView_2 = [[UIView alloc]init];
        _separatorView_2.backgroundColor = fillViewColor;
    }
    return _separatorView_2;
}
- (UIView *)separatorView_3{
    if (!_separatorView_3) {
        _separatorView_3 = [[UIView alloc]init];
        _separatorView_3.backgroundColor = fillViewColor;
    }
    return _separatorView_3;
}
- (UIView *)separatorView_4{
    if (!_separatorView_4) {
        _separatorView_4 = [[UIView alloc]init];
        _separatorView_4.backgroundColor = fillViewColor;
    }
    return _separatorView_4;
}
- (WLKTActivePayWayTV *)payWayTableView{
    if (!_payWayTableView) {
        _payWayTableView = [[WLKTActivePayWayTV alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _payWayTableView;
}

@end

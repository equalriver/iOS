//
//  WLKTJoinTableViewController.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTJoinTableViewController.h"
#import <AFNetworking.h>
#import "WLKTJoinPickerView.h"
#import "WLKTJoinSchoolClassifyApi.h"
#import "WLKTJoinSchoolClassifyData.h"

@protocol WLKTJoinImagePickerDelegate <NSObject>
- (void)didTapImagePickerWithType:(WLKTJoinImagePickerType)type;
@end

@interface WLKTJoinImagePickerView: UIView
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) UIButton *cancelBtn;
@property (strong, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) id<WLKTJoinImagePickerDelegate> delegate;
@end

@implementation WLKTJoinImagePickerView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.imgIV];
        [self addSubview:self.cancelBtn];
        [self addSubview:self.titleLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)cancelBtnAct{
    if (self.imgIV.image != [UIImage imageNamed:@"上传图片"]) {
        self.imgIV.image = [UIImage imageNamed:@"上传图片"];
        self.cancelBtn.hidden = YES;
    }
}

- (void)makeConstraints{
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.top.mas_equalTo(self).offset(15);
        make.left.mas_equalTo(self);
    }];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(self);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.imgIV);
        make.top.mas_equalTo(self.imgIV.mas_bottom).offset(5);
    }];
}

- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"上传图片"]];
        _imgIV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithActionBlock:^(UITapGestureRecognizer * sender) {
            if ([self.delegate respondsToSelector:@selector(didTapImagePickerWithType:)]) {
                [self.delegate didTapImagePickerWithType:sender.view.superview.tag];
            }
        }];
        [_imgIV addGestureRecognizer:tap];
    }
    return _imgIV;
}
- (UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [UIButton new];
        [_cancelBtn setImage:[UIImage imageNamed:@"我的-关"] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelBtnAct) forControlEvents:UIControlEventTouchUpInside];
        _cancelBtn.hidden = YES;
    }
    return _cancelBtn;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textColor = KMainTextColor_9;
    }
    return _titleLabel;
}
@end

/*********************************************************/
@protocol WLKTJoinSchoolClassifyDelegate <NSObject>
- (void)didClickSchoolClassifyButton:(UIButton *)sender;
@end

@interface WLKTJoinTableViewCell: UITableViewCell
@property (strong, nonatomic) UILabel *schoolClassifyLabel;
@property (strong, nonatomic) UIButton *schoolClassifyBtn;
@property (strong, nonatomic) UIView *separatorView;
@property (strong, nonatomic) UILabel *schoolNameLabel;
@property (strong, nonatomic) UITextField *schoolTF;
@property (strong, nonatomic) UIView *separatorView_1;
@property (strong, nonatomic) UILabel *certificateLabel;
@property (strong, nonatomic) WLKTJoinImagePickerView *certificateIPV;
@property (strong, nonatomic) UIView *separatorView_2;
@property (strong, nonatomic) UILabel *faRenPhoneLabel;
@property (strong, nonatomic) UITextField *faRenTF;
@property (strong, nonatomic) UIView *separatorView_3;
@property (strong, nonatomic) UILabel *faRenIDCardLabel;
@property (strong, nonatomic) WLKTJoinImagePickerView *faRenIPV_1;
@property (strong, nonatomic) WLKTJoinImagePickerView *faRenIPV_2;
@property (strong, nonatomic) UIView *separatorView_4;
@property (strong, nonatomic) UILabel *applicantPhoneLabel;
@property (strong, nonatomic) UITextField *applicantPhoneTF;
@property (strong, nonatomic) UIView *separatorView_5;
@property (strong, nonatomic) UILabel *applicantNameLabel;
@property (strong, nonatomic) UITextField *applicantNameTF;
@property (strong, nonatomic) UIView *separatorView_6;
@property (strong, nonatomic) UILabel *applicantEmailLabel;
@property (strong, nonatomic) UITextField *applicantEmailTF;
@property (strong, nonatomic) UIView *separatorView_7;
@property (strong, nonatomic) UILabel *applicantIDCardLabel;
@property (strong, nonatomic) WLKTJoinImagePickerView *applicantIPV_1;
@property (strong, nonatomic) WLKTJoinImagePickerView *applicantIPV_2;
@property (weak, nonatomic) id<WLKTJoinSchoolClassifyDelegate> delegate;
@end

@implementation WLKTJoinTableViewCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        [self.contentView addSubview:self.schoolClassifyLabel];
        [self.contentView addSubview:self.schoolClassifyBtn];
        [self.contentView addSubview:self.separatorView];
        [self.contentView addSubview:self.schoolNameLabel];
        [self.contentView addSubview:self.schoolTF];
        [self.contentView addSubview:self.separatorView_1];
        [self.contentView addSubview:self.certificateLabel];
        [self.contentView addSubview:self.certificateIPV];
        [self.contentView addSubview:self.separatorView_2];
        [self.contentView addSubview:self.faRenPhoneLabel];
        [self.contentView addSubview:self.faRenTF];
        [self.contentView addSubview:self.separatorView_3];
        [self.contentView addSubview:self.faRenIDCardLabel];
        [self.contentView addSubview:self.faRenIPV_1];
        [self.contentView addSubview:self.faRenIPV_2];
        [self.contentView addSubview:self.separatorView_4];
        [self.contentView addSubview:self.applicantPhoneLabel];
        [self.contentView addSubview:self.applicantPhoneTF];
        [self.contentView addSubview:self.separatorView_5];
        [self.contentView addSubview:self.applicantNameLabel];
        [self.contentView addSubview:self.applicantNameTF];
        [self.contentView addSubview:self.separatorView_6];
        [self.contentView addSubview:self.applicantEmailLabel];
        [self.contentView addSubview:self.applicantEmailTF];
        [self.contentView addSubview:self.separatorView_7];
        [self.contentView addSubview:self.applicantIDCardLabel];
        [self.contentView addSubview:self.applicantIPV_1];
        [self.contentView addSubview:self.applicantIPV_2];
        [self makeConstraints];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UIView *v in self.contentView.subviews) {
        if ([v isKindOfClass:[UITextField class]]) {
            [v resignFirstResponder];
        }
    }
}

- (void)schoolClassifyBtnAct:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(didClickSchoolClassifyButton:)]) {
        [self.delegate didClickSchoolClassifyButton:sender];
    }
}

- (void)makeConstraints{
    [self.schoolClassifyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.top.mas_equalTo(self.contentView).offset(20);
        make.width.mas_equalTo(70);
    }];
    [self.schoolClassifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.left.mas_equalTo(self.schoolClassifyLabel.mas_right);
        make.centerY.mas_equalTo(self.schoolClassifyLabel);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.schoolClassifyBtn.mas_bottom).offset(10);
    }];
    [self.schoolNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.top.mas_equalTo(self.separatorView).offset(20);
        make.width.mas_equalTo(self.schoolClassifyLabel);
    }];
    [self.schoolTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.left.mas_equalTo(self.schoolNameLabel.mas_right);
        make.centerY.mas_equalTo(self.schoolNameLabel);
    }];
    [self.separatorView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.schoolTF.mas_bottom).offset(10);
    }];
    [self.certificateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.top.mas_equalTo(self.separatorView_1).offset(10);
    }];
    [self.certificateIPV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 105));
        make.top.mas_equalTo(self.certificateLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(self.contentView).offset(10);
    }];
    [self.separatorView_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 5));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.certificateIPV.mas_bottom).offset(15);
    }];
    [self.faRenPhoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.top.mas_equalTo(self.separatorView_2.mas_bottom).offset(20);
    }];
    [self.faRenTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.left.mas_equalTo(self.faRenPhoneLabel.mas_right).offset(5);
        make.centerY.mas_equalTo(self.faRenPhoneLabel);
    }];
    [self.separatorView_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.faRenTF.mas_bottom).offset(10);
    }];
    [self.faRenIDCardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.top.mas_equalTo(self.separatorView_3.mas_bottom).offset(10);
    }];
    [self.faRenIPV_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 105));
        make.top.mas_equalTo(self.faRenIDCardLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(self.contentView).offset(10);
    }];
    [self.faRenIPV_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 105));
        make.top.mas_equalTo(self.faRenIPV_1);
        make.left.mas_equalTo(self.faRenIPV_1.mas_right).offset(20);
    }];
    [self.separatorView_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 5));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.faRenIPV_1.mas_bottom).offset(10);
    }];
    [self.applicantNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.top.mas_equalTo(self.separatorView_4.mas_bottom).offset(20);
        make.width.mas_equalTo(80);
    }];
    [self.applicantNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.left.mas_equalTo(self.applicantNameLabel.mas_right);
        make.centerY.mas_equalTo(self.applicantNameLabel);
    }];
    [self.separatorView_5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.applicantNameTF.mas_bottom).offset(10);
    }];
    [self.applicantPhoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.top.mas_equalTo(self.separatorView_5.mas_bottom).offset(20);
        make.width.mas_equalTo(80);
    }];
    [self.applicantPhoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.left.mas_equalTo(self.applicantPhoneLabel.mas_right);
        make.centerY.mas_equalTo(self.applicantPhoneLabel);
    }];
    [self.separatorView_6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.applicantPhoneTF.mas_bottom).offset(10);
    }];
    [self.applicantEmailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.top.mas_equalTo(self.separatorView_6.mas_bottom).offset(20);
        make.width.mas_equalTo(80);
    }];
    [self.applicantEmailTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.left.mas_equalTo(self.applicantEmailLabel.mas_right);
        make.centerY.mas_equalTo(self.applicantEmailLabel);
    }];
    [self.separatorView_7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.applicantEmailTF.mas_bottom).offset(10);
    }];
    [self.applicantIDCardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.top.mas_equalTo(self.separatorView_7.mas_bottom).offset(15);
    }];
    [self.applicantIPV_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 105));
        make.top.mas_equalTo(self.applicantIDCardLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(self.contentView).offset(10);
    }];
    [self.applicantIPV_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 105));
        make.top.mas_equalTo(self.applicantIPV_1);
        make.left.mas_equalTo(self.applicantIPV_1.mas_right).offset(20);
    }];
}

#pragma mark - get
- (UILabel *)schoolClassifyLabel{
    if (!_schoolClassifyLabel) {
        _schoolClassifyLabel = [UILabel new];
        _schoolClassifyLabel.font = [UIFont systemFontOfSize:13];
        _schoolClassifyLabel.textColor = KMainTextColor_3;
        _schoolClassifyLabel.text = @"机构分类：";
    }
    return _schoolClassifyLabel;
}
- (UIButton *)schoolClassifyBtn{
    if (!_schoolClassifyBtn) {
        _schoolClassifyBtn = [UIButton new];
        _schoolClassifyBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_schoolClassifyBtn setTitle:@" 请选择机构分类（一级分类）" forState:UIControlStateNormal];
        [_schoolClassifyBtn setTitleColor:KMainTextColor_9 forState:UIControlStateNormal];
        _schoolClassifyBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _schoolClassifyBtn.layer.borderColor = KMainTextColor_9.CGColor;
        _schoolClassifyBtn.layer.borderWidth = 0.5;
        [_schoolClassifyBtn addTarget:self action:@selector(schoolClassifyBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _schoolClassifyBtn;
}
- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}
- (UILabel *)schoolNameLabel{
    if (!_schoolNameLabel) {
        _schoolNameLabel = [UILabel new];
        _schoolNameLabel.font = [UIFont systemFontOfSize:13];
        _schoolNameLabel.textColor = KMainTextColor_3;
        _schoolNameLabel.text = @"机构名称：";
    }
    return _schoolNameLabel;
}
- (UITextField *)schoolTF{
    if (!_schoolTF) {
        _schoolTF = [UITextField new];
        _schoolTF.font = [UIFont systemFontOfSize:12];
        _schoolTF.placeholder = @" 请填写机构名称/可填写简称";
        _schoolTF.layer.borderColor = KMainTextColor_9.CGColor;
        _schoolTF.layer.borderWidth = 0.5;
    }
    return _schoolTF;
}
- (UIView *)separatorView_1{
    if (!_separatorView_1) {
        _separatorView_1 = [UIView new];
        _separatorView_1.backgroundColor = separatorView_color;
    }
    return _separatorView_1;
}
- (UILabel *)certificateLabel{
    if (!_certificateLabel) {
        _certificateLabel = [UILabel new];
        _certificateLabel.font = [UIFont systemFontOfSize:13];
        _certificateLabel.textColor = KMainTextColor_3;
        _certificateLabel.text = @"办学许可证/相关证件";
    }
    return _certificateLabel;
}
- (WLKTJoinImagePickerView *)certificateIPV{
    if (!_certificateIPV) {
        _certificateIPV = [[WLKTJoinImagePickerView alloc]init];
        _certificateIPV.tag = WLKTJoinImagePickerTypeCertificate;
        _certificateIPV.titleLabel.text = @"正面";
    }
    return _certificateIPV;
}
- (UIView *)separatorView_2{
    if (!_separatorView_2) {
        _separatorView_2 = [UIView new];
        _separatorView_2.backgroundColor = separatorView_color;
    }
    return _separatorView_2;
}
- (UILabel *)faRenPhoneLabel{
    if (!_faRenPhoneLabel) {
        _faRenPhoneLabel = [UILabel new];
        _faRenPhoneLabel.font = [UIFont systemFontOfSize:13];
        _faRenPhoneLabel.textColor = KMainTextColor_3;
        _faRenPhoneLabel.text = @"法人电话：";
    }
    return _faRenPhoneLabel;
}
- (UITextField *)faRenTF{
    if (!_faRenTF) {
        _faRenTF = [UITextField new];
        _faRenTF.font = [UIFont systemFontOfSize:12];
        _faRenTF.textColor = KMainTextColor_3;
        _faRenTF.placeholder = @" 请输入法人手机号，用于开校信息通知与金额提现使用";
        _faRenTF.layer.borderColor = KMainTextColor_9.CGColor;
        _faRenTF.layer.borderWidth = 0.5;
    }
    return _faRenTF;
}
- (UIView *)separatorView_3{
    if (!_separatorView_3) {
        _separatorView_3 = [UIView new];
        _separatorView_3.backgroundColor = separatorView_color;
    }
    return _separatorView_3;
}
- (UILabel *)faRenIDCardLabel{
    if (!_faRenIDCardLabel) {
        _faRenIDCardLabel = [UILabel new];
        _faRenIDCardLabel.font = [UIFont systemFontOfSize:13];
        _faRenIDCardLabel.textColor = KMainTextColor_3;
        _faRenIDCardLabel.text = @"法人身份证";
    }
    return _faRenIDCardLabel;
}
- (WLKTJoinImagePickerView *)faRenIPV_1{
    if (!_faRenIPV_1) {
        _faRenIPV_1 = [[WLKTJoinImagePickerView alloc]init];
        _faRenIPV_1.titleLabel.text = @"正面";
        _faRenIPV_1.tag = WLKTJoinImagePickerTypeFaRenFront;
    }
    return _faRenIPV_1;
}
- (WLKTJoinImagePickerView *)faRenIPV_2{
    if (!_faRenIPV_2) {
        _faRenIPV_2 = [[WLKTJoinImagePickerView alloc]init];
        _faRenIPV_2.titleLabel.text = @"反面";
        _faRenIPV_2.tag = WLKTJoinImagePickerTypeFaRenReverse;
    }
    return _faRenIPV_2;
}
- (UIView *)separatorView_4{
    if (!_separatorView_4) {
        _separatorView_4 = [UIView new];
        _separatorView_4.backgroundColor = separatorView_color;
    }
    return _separatorView_4;
}
- (UILabel *)applicantPhoneLabel{
    if (!_applicantPhoneLabel) {
        _applicantPhoneLabel = [UILabel new];
        _applicantPhoneLabel.font = [UIFont systemFontOfSize:12];
        _applicantPhoneLabel.textColor = KMainTextColor_3;
        _applicantPhoneLabel.text = @"申请人电话：";
    }
    return _applicantPhoneLabel;
}
- (UITextField *)applicantPhoneTF{
    if (!_applicantPhoneTF) {
        _applicantPhoneTF = [UITextField new];
        _applicantPhoneTF.font = [UIFont systemFontOfSize:12];
        _applicantPhoneTF.textColor = KMainTextColor_3;
        _applicantPhoneTF.placeholder = @" 请输入申请人手机号，以便及时沟通";
        _applicantPhoneTF.layer.borderColor = KMainTextColor_9.CGColor;
        _applicantPhoneTF.layer.borderWidth = 0.5;
    }
    return _applicantPhoneTF;
}
- (UIView *)separatorView_5{
    if (!_separatorView_5) {
        _separatorView_5 = [UIView new];
        _separatorView_5.backgroundColor = separatorView_color;
    }
    return _separatorView_5;
}
- (UILabel *)applicantNameLabel{
    if (!_applicantNameLabel) {
        _applicantNameLabel = [UILabel new];
        _applicantNameLabel.font = [UIFont systemFontOfSize:12];
        _applicantNameLabel.textColor = KMainTextColor_3;
        _applicantNameLabel.text = @"申请人姓名：";
    }
    return _applicantNameLabel;
}
- (UITextField *)applicantNameTF{
    if (!_applicantNameTF) {
        _applicantNameTF = [UITextField new];
        _applicantNameTF.font = [UIFont systemFontOfSize:12];
        _applicantNameTF.textColor = KMainTextColor_3;
        _applicantNameTF.placeholder = @" 请输入申请人姓名，以便及时沟通";
        _applicantNameTF.layer.borderColor = KMainTextColor_9.CGColor;
        _applicantNameTF.layer.borderWidth = 0.5;
    }
    return _applicantNameTF;
}
- (UIView *)separatorView_6{
    if (!_separatorView_6) {
        _separatorView_6 = [UIView new];
        _separatorView_6.backgroundColor = separatorView_color;
    }
    return _separatorView_6;
}
- (UILabel *)applicantEmailLabel{
    if (!_applicantEmailLabel) {
        _applicantEmailLabel = [UILabel new];
        _applicantEmailLabel.font = [UIFont systemFontOfSize:12];
        _applicantEmailLabel.textColor = KMainTextColor_3;
        _applicantEmailLabel.text = @"申请人邮箱：";
    }
    return _applicantEmailLabel;
}
- (UITextField *)applicantEmailTF{
    if (!_applicantEmailTF) {
        _applicantEmailTF = [UITextField new];
        _applicantEmailTF.font = [UIFont systemFontOfSize:12];
        _applicantEmailTF.textColor = KMainTextColor_3;
        _applicantEmailTF.placeholder = @" 请输入申请人邮箱，以便及时沟通";
        _applicantEmailTF.layer.borderColor = KMainTextColor_9.CGColor;
        _applicantEmailTF.layer.borderWidth = 0.5;
    }
    return _applicantEmailTF;
}
- (UIView *)separatorView_7{
    if (!_separatorView_7) {
        _separatorView_7 = [UIView new];
        _separatorView_7.backgroundColor = separatorView_color;
    }
    return _separatorView_7;
}
- (UILabel *)applicantIDCardLabel{
    if (!_applicantIDCardLabel) {
        _applicantIDCardLabel = [UILabel new];
        _applicantIDCardLabel.font = [UIFont systemFontOfSize:13];
        _applicantIDCardLabel.textColor = KMainTextColor_3;
        _applicantIDCardLabel.text = @"申请人身份证：";
    }
    return _applicantIDCardLabel;
}
- (WLKTJoinImagePickerView *)applicantIPV_1{
    if (!_applicantIPV_1) {
        _applicantIPV_1 = [[WLKTJoinImagePickerView alloc]init];
        _applicantIPV_1.titleLabel.text = @"正面";
        _applicantIPV_1.tag = WLKTJoinImagePickerTypeApplicantFront;
    }
    return _applicantIPV_1;
}
- (WLKTJoinImagePickerView *)applicantIPV_2{
    if (!_applicantIPV_2) {
        _applicantIPV_2 = [[WLKTJoinImagePickerView alloc]init];
        _applicantIPV_2.titleLabel.text = @"反面";
        _applicantIPV_2.tag = WLKTJoinImagePickerTypeApplicantReverse;
    }
    return _applicantIPV_2;
}

@end

/*********************************************************/
@interface WLKTJoinTableViewController ()<WLKTJoinImagePickerDelegate, WLKTJoinSchoolClassifyDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, WLKTJoinPickerViewDelegate>
@property (strong, nonatomic) WLKTJoinTableViewCell *cell;
@property (strong, nonatomic) WLKTJoinPickerView *pickView;

@property (strong, nonatomic) NSMutableArray<WLKTJoinSchoolClassifyData *> *pickerDataArr;
@property (strong, nonatomic) WLKTJoinSchoolClassifyData *pickerData;
@property (nonatomic) WLKTJoinImagePickerType type;
@property (copy, nonatomic) NSArray<WLKTJoinSchoolClassifyData *> *classifyDataArr;
@property (strong, nonatomic) NSMutableDictionary<NSString *, NSData *> *photoDic;
@property (strong, nonatomic) NSData *licenseimg;
@property (strong, nonatomic) NSData *fr_idimg;
@property (strong, nonatomic) NSData *fr_idimg_back;
@property (strong, nonatomic) NSData *idimg;
@property (strong, nonatomic) NSData *idimg_back;
@end

@implementation WLKTJoinTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我要入驻";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIBarButtonItem *rigt = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAct)];
    self.navigationItem.rightBarButtonItem = rigt;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [self getSchoolClassify];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - 键盘出现
-(void)keyboardWillShow:(NSNotification *)noti
{
    CGRect keyBoardRect = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, keyBoardRect.size.height, 0);
}

-(void)keyboardWillHide:(NSNotification *)noti{
    self.tableView.contentInset = UIEdgeInsetsZero;
}

#pragma mark - network
- (void)getSchoolClassify{
    WLKTJoinSchoolClassifyApi *api = [[WLKTJoinSchoolClassifyApi alloc]init];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSArray *arr = [NSArray modelArrayWithClass:[WLKTJoinSchoolClassifyData class] json:request.responseJSONObject[@"result"][@"list"]];
        self.classifyDataArr = [NSArray arrayWithArray:arr];
        if (self.classifyDataArr) {
            [self.pickerDataArr addObjectsFromArray:self.classifyDataArr];
            self.pickerData = self.classifyDataArr.firstObject;
        }
    } failure:^(__kindof YTKBaseRequest *request) {
        
    }];
}

- (void)uploadJoinMessage{
    if (!self.pickerData.cid || !self.cell.schoolTF.text || !self.cell.faRenTF.text || !self.cell.applicantPhoneTF.text || !self.cell.applicantEmailTF.text || !self.cell.applicantNameTF.text) {
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =
    [NSSet setWithObjects:@"application/json", @"text/json",
     @"text/javascript", @"text/html", nil];
    NSDictionary *param = @{
                            @"schify": self.pickerData.cid,
                            @"schname": self.cell.schoolTF.text,
                            @"fr_phone": self.cell.faRenTF.text,
                            @"user": self.cell.applicantNameTF.text,
                            @"phone": self.cell.applicantPhoneTF.text,
                            @"email": self.cell.applicantEmailTF.text,
                            RequestMD5String
                            };
    //发出请求
    NSString *url = [NSString stringWithFormat:@"%@enter/enter", kBaseURL];
    [manager POST:url parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //利用时间戳当做图片名字
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *imageName = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg",imageName];
        if (self.licenseimg) {
            [formData appendPartWithFileData:self.licenseimg name:@"licenseimg" fileName:fileName mimeType:@"image/jpeg"];
        }
        if (self.fr_idimg) {
            [formData appendPartWithFileData:self.fr_idimg name:@"fr_idimg" fileName:fileName mimeType:@"image/jpeg"];
        }
        if (self.fr_idimg_back) {
            [formData appendPartWithFileData:self.fr_idimg_back name:@"fr_idimg_back" fileName:fileName mimeType:@"image/jpeg"];
        }
        if (self.idimg) {
            [formData appendPartWithFileData:self.idimg name:@"idimg" fileName:fileName mimeType:@"image/jpeg"];
        }
        if (self.idimg_back) {
            [formData appendPartWithFileData:self.idimg_back name:@"idimg_back" fileName:fileName mimeType:@"image/jpeg"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        [SVProgressHUD showProgress:uploadProgress.fractionCompleted status:@"正在上传..."];
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD showSuccessWithStatus:@"提交成功!"];
//        NSString *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingAllowFragments error:nil];
        [self.navigationController popViewControllerAnimated:YES];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"提交失败"];
        NSLog(@"%@", error.localizedDescription);
    }];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 830;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cell;
}

#pragma mark - action
- (void)rightBarButtonAct{
    for (NSString *key in self.photoDic.allKeys) {
        if (key.integerValue == WLKTJoinImagePickerTypeCertificate) {
            self.licenseimg = self.photoDic[key];
        }
        if (key.integerValue == WLKTJoinImagePickerTypeFaRenFront) {
            self.fr_idimg = self.photoDic[key];
        }
        if (key.integerValue == WLKTJoinImagePickerTypeFaRenReverse) {
            self.fr_idimg_back = self.photoDic[key];
        }
        if (key.integerValue == WLKTJoinImagePickerTypeApplicantFront) {
            self.idimg = self.photoDic[key];
        }
        if (key.integerValue == WLKTJoinImagePickerTypeApplicantReverse) {
            self.idimg_back = self.photoDic[key];
        }
    }

    if ([self.cell.schoolClassifyBtn.titleLabel.text isEqualToString:@" 请选择机构分类（一级分类）"]) {
        [SVProgressHUD showInfoWithStatus:@"机构分类未填或未输入正确"];
        return;
    }
    if (!self.cell.schoolTF.text.length) {
        [SVProgressHUD showInfoWithStatus:@"机构名称未填或未输入正确"];
        return;
    }
    if (!self.licenseimg) {
        [SVProgressHUD showInfoWithStatus:@"办学许可证未上传"];
        return;
    }
    if (![self.cell.faRenTF.text isValidPhoneNumber]) {
        [SVProgressHUD showInfoWithStatus:@"法人电话未填或未输入正确"];
        return;
    }
    if (!self.fr_idimg) {
        [SVProgressHUD showInfoWithStatus:@"法人身份证正面未上传"];
        return;
    }
    if (!self.fr_idimg_back) {
        [SVProgressHUD showInfoWithStatus:@"法人身份证反面未上传"];
        return;
    }
    if (self.cell.applicantNameTF.text.length < 2) {
        [SVProgressHUD showInfoWithStatus:@"申请人姓名未填或未输入正确"];
        return;
    }
    if (![self.cell.applicantPhoneTF.text isValidPhoneNumber]) {
        [SVProgressHUD showInfoWithStatus:@"申请人电话未填或未输入正确"];
        return;
    }
    if (![self.cell.applicantEmailTF.text isEmailAddress]) {
        [SVProgressHUD showInfoWithStatus:@"申请人邮箱未填或未输入正确"];
        return;
    }
    if (!self.idimg) {
        [SVProgressHUD showInfoWithStatus:@"申请人身份证正面未上传"];
        return;
    }
    if (!self.idimg_back) {
        [SVProgressHUD showInfoWithStatus:@"申请人身份证反面未上传"];
        return;
    }
    [self uploadJoinMessage];
}

#pragma mark - WLKTJoinImagePickerDelegate
- (void)didTapImagePickerWithType:(WLKTJoinImagePickerType)type{
    _type = type;
    UIImagePickerController *vc = [[UIImagePickerController alloc]init];
    vc.delegate = self;
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

#pragma mark - WLKTJoinSchoolClassifyDelegate
- (void)didClickSchoolClassifyButton:(UIButton *)sender{
    [self.view addSubview:self.pickView];
}

#pragma mark - WLKTJoinPickerView
- (void)didSelectedActionButtonWithType:(PickerViewActionType)type{
    if (type == PickerViewActionTypeCancel) {
        
    }
    else{
        [self.cell.schoolClassifyBtn setTitleColor:KMainTextColor_3 forState:UIControlStateNormal];
        [self.cell.schoolClassifyBtn setTitle:self.pickerData.title forState:UIControlStateNormal];
    }
    [self.pickView removeFromSuperview];
}

#pragma mark - image picker
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *i = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    NSData *data = UIImageJPEGRepresentation(i, 0.4f);
    UIImage *img = [UIImage imageWithData:data];
    NSString *s = [NSString stringWithFormat:@"%ld", self.type];
    [self.photoDic setObject:data forKey:s];
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        switch (self.type) {
            case WLKTJoinImagePickerTypeCertificate:
                self.cell.certificateIPV.imgIV.image = img;
                self.cell.certificateIPV.cancelBtn.hidden = false;
                break;
            case WLKTJoinImagePickerTypeFaRenFront:
                self.cell.faRenIPV_1.imgIV.image = img;
                self.cell.faRenIPV_1.cancelBtn.hidden = false;
                break;
            case WLKTJoinImagePickerTypeFaRenReverse:
                self.cell.faRenIPV_2.imgIV.image = img;
                self.cell.faRenIPV_2.cancelBtn.hidden = false;
                break;
            case WLKTJoinImagePickerTypeApplicantFront:
                self.cell.applicantIPV_1.imgIV.image = img;
                self.cell.applicantIPV_1.cancelBtn.hidden = false;
                break;
            case WLKTJoinImagePickerTypeApplicantReverse:
                self.cell.applicantIPV_2.imgIV.image = img;
                self.cell.applicantIPV_2.cancelBtn.hidden = false;
                break;
            default:
                break;
        }
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - picker view
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 200;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 25;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.pickerDataArr.count;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSAttributedString *s = [[NSAttributedString alloc]initWithString:self.pickerDataArr[row].title attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: KMainTextColor_3}];
    return s;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.pickerData = self.pickerDataArr[row];
}

#pragma mark - get
- (WLKTJoinTableViewCell *)cell{
    if (!_cell) {
        _cell = [[WLKTJoinTableViewCell alloc]init];
        _cell.certificateIPV.delegate = self;
        _cell.faRenIPV_1.delegate = self;
        _cell.faRenIPV_2.delegate = self;
        _cell.applicantIPV_1.delegate = self;
        _cell.applicantIPV_2.delegate = self;
        _cell.delegate = self;
        _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return _cell;
}
- (WLKTJoinPickerView *)pickView{
    if (!_pickView) {
        _pickView = [[WLKTJoinPickerView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _pickView.pickView.dataSource = self;
        _pickView.pickView.delegate = self;
        _pickView.delegate = self;
    }
    return _pickView;
}
- (NSMutableDictionary<NSString *,NSData *> *)photoDic{
    if (!_photoDic) {
        _photoDic = [NSMutableDictionary dictionaryWithCapacity:5];
    }
    return _photoDic;
}
- (NSMutableArray<WLKTJoinSchoolClassifyData *> *)pickerDataArr{
    if (!_pickerDataArr) {
        _pickerDataArr = [NSMutableArray arrayWithCapacity:10];
    }
    return _pickerDataArr;
}
@end

//
//  WLKTSchoolIntroCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolIntroCell.h"

@interface WLKTSchoolIntroCell ()
@property (strong, nonatomic) UILabel *createTimeFix;
@property (strong, nonatomic) UILabel *createTimeDetail;
@property (strong, nonatomic) UILabel *introFix;
@property (strong, nonatomic) UILabel *introDetail;
@property (strong, nonatomic) UILabel *workTimeFix;
@property (strong, nonatomic) UILabel *workTimeDetail;
@end

@implementation WLKTSchoolIntroCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.createTimeFix];
        [self.contentView addSubview:self.createTimeDetail];
        [self.contentView addSubview:self.introFix];
        [self.contentView addSubview:self.introDetail];
        [self.contentView addSubview:self.workTimeFix];
        [self.contentView addSubview:self.workTimeDetail];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellData:(WLKTSchoolInfo *)data{
    if (data.stime.length) {
        self.createTimeFix.hidden = false;
        self.createTimeDetail.hidden = false;
        self.createTimeDetail.text = data.stime;
    }
    else{
        [self.introFix mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView).offset(5);
            make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        }];
        self.createTimeFix.hidden = YES;
        self.createTimeDetail.hidden = YES;
    }
    self.introDetail.text = data.introduce;
    if (data.businesshours.length) {
        self.workTimeFix.hidden = false;
        self.workTimeDetail.hidden = false;
        self.workTimeDetail.text = data.businesshours;
        
    }
    else{
        self.workTimeFix.hidden = YES;
        self.workTimeDetail.hidden = YES;
    }
}

- (void)makeConstraints{
    [self.createTimeFix mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
    }];
    [self.createTimeDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.createTimeFix);
        make.left.mas_equalTo(self.createTimeFix.mas_right).offset(10 * ScreenRatio_6);
    }];
    [self.introFix mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.createTimeFix.mas_bottom).offset(15 * ScreenRatio_6);
    }];
    [self.introDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.introFix);
        make.left.mas_equalTo(self.introFix.mas_right).offset(10 * ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 * ScreenRatio_6);
    }];
    [self.workTimeFix mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.introDetail.mas_bottom).offset(15 * ScreenRatio_6);
    }];
    [self.workTimeDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.workTimeFix.mas_right).offset(10 * ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 * ScreenRatio_6);
        make.top.mas_equalTo(self.workTimeFix);
    }];
}

#pragma mark - get
- (UILabel *)createTimeFix{
    if (!_createTimeFix) {
        _createTimeFix = [UILabel new];
        _createTimeFix.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _createTimeFix.textColor = KMainTextColor_9;
        _createTimeFix.text = @"创立时间";
    }
    return _createTimeFix;
}
- (UILabel *)createTimeDetail{
    if (!_createTimeDetail) {
        _createTimeDetail = [UILabel new];
        _createTimeDetail.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _createTimeDetail.textColor = KMainTextColor_3;
    }
    return _createTimeDetail;
}
- (UILabel *)introFix{
    if (!_introFix) {
        _introFix = [UILabel new];
        _introFix.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _introFix.textColor = KMainTextColor_9;
        _introFix.text = @"学校简介";
    }
    return _introFix;
}
- (UILabel *)introDetail{
    if (!_introDetail) {
        _introDetail = [UILabel new];
        _introDetail.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _introDetail.textColor = KMainTextColor_3;
        _introDetail.numberOfLines = 0;
    }
    return _introDetail;
}
- (UILabel *)workTimeFix{
    if (!_workTimeFix) {
        _workTimeFix = [UILabel new];
        _workTimeFix.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _workTimeFix.textColor = KMainTextColor_9;
        _workTimeFix.text = @"营业时间";
    }
    return _workTimeFix;
}
- (UILabel *)workTimeDetail{
    if (!_workTimeDetail) {
        _workTimeDetail = [UILabel new];
        _workTimeDetail.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _workTimeDetail.textColor = KMainTextColor_3;
        _workTimeDetail.numberOfLines = 0;
    }
    return _workTimeDetail;
}

@end

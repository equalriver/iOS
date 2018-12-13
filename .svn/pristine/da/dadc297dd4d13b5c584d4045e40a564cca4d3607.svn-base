//
//  WLKTActivityDetail_Q_A_2_cell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityDetail_Q_A_2_cell.h"

@interface WLKTActivityDetail_Q_A_2_cell ()
@property (strong, nonatomic) UIImageView *iconIV;
@property (strong, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) UILabel *username_timeLabel;
@property (strong, nonatomic) UIImageView *answerIV;
@end

@implementation WLKTActivityDetail_Q_A_2_cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.answerIV];
        [self.contentView addSubview:self.detailLabel];
        [self.contentView addSubview:self.username_timeLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.detailLabel.text = nil;
    self.username_timeLabel.text = nil;
}

- (void)setCellData:(WLKTActivityDetail_QA_answer *)data{
    self.detailLabel.text = data.answer;
    self.username_timeLabel.text = [NSString stringWithFormat:@"回答人：%@  回答时间：%@", data.username, data.create_time];
}

#pragma mark - make constraints
- (void)makeConstraints{
    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(6 * ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(12, 12));
    }];
    [self.answerIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 * ScreenRatio_6);
        make.left.mas_equalTo(self.iconIV.mas_right).offset(10 * ScreenRatio_6);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-5 * ScreenRatio_6);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconIV.mas_right).offset(20 * ScreenRatio_6);
        make.top.mas_equalTo(self.iconIV).offset(10 * ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20 * ScreenRatio_6);
    }];
    [self.username_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.detailLabel);
        make.top.mas_equalTo(self.detailLabel.mas_bottom).offset(10 * ScreenRatio_6);
        make.right.mas_equalTo(self.answerIV.mas_right).offset(-5 * ScreenRatio_6);
    }];
}

#pragma mark - get
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"答"]];
    }
    return _iconIV;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _detailLabel.textColor = KMainTextColor_3;
        _detailLabel.numberOfLines = 0;
    }
    return _detailLabel;
}
- (UILabel *)username_timeLabel{
    if (!_username_timeLabel) {
        _username_timeLabel = [UILabel new];
        _username_timeLabel.font = [UIFont systemFontOfSize:11 * ScreenRatio_6];
        _username_timeLabel.textColor = KMainTextColor_9;
    }
    return _username_timeLabel;
}
- (UIImageView *)answerIV{
    if (!_answerIV) {
        _answerIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"气泡框"]];
    }
    return _answerIV;
}

@end


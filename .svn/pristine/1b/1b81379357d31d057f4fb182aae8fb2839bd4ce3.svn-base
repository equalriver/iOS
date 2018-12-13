//
//  WLKTSchoolActivityCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/30.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolActivityCell.h"

@interface WLKTSchoolActivityCell ()
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) UIImageView *seeIV;
@property (strong, nonatomic) UILabel *seeCountLabel;
@property (strong, nonatomic) UILabel *activeNameLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UILabel *locationLabel;
@property (strong, nonatomic) UILabel *statusLabel;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *comment_saleLabel;
@end

@implementation WLKTSchoolActivityCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.imgIV];
        [self.contentView addSubview:self.seeIV];
        [self.contentView addSubview:self.seeCountLabel];
        [self.contentView addSubview:self.activeNameLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.locationLabel];
        [self.contentView addSubview:self.statusLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.comment_saleLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellData:(WLKTActivity *)data{
    [self.imgIV setImageURL:[NSURL URLWithString:data.img]];
    self.seeCountLabel.text = data.hits;
    self.activeNameLabel.text = data.title;
    self.timeLabel.text = data.asctime;
    self.locationLabel.text = [NSString stringWithFormat:@"地点:%@%@", data.shortaddress, data.distance];
    self.statusLabel.text = data.actstatus;
    if ([data.actstatus isEqualToString:@"即将开始"]) {
        self.statusLabel.layer.borderColor = UIColorHex(ffc62b).CGColor;
        self.statusLabel.textColor = UIColorHex(ffc62b);
    } else if ([data.actstatus isEqualToString:@"进行中"]) {
        self.statusLabel.layer.borderColor = UIColorHex(f05252).CGColor;
        self.statusLabel.textColor = UIColorHex(f05252);
    } else if([data.actstatus isEqualToString:@"已结束"]) {
        self.statusLabel.layer.borderColor = KMainTextColor_9.CGColor;
        self.statusLabel.textColor = KMainTextColor_9;
    }
    [self.statusLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo([data.actstatus getSizeWithHeight:15 Font:12 *ScreenRatio_6]);
    }];
    self.priceLabel.text = [NSString stringWithFormat:@"%@元", data.price];
    if (data.feesxz.integerValue == 0) {
        self.priceLabel.text = @"免费";
    }
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.imgIV.image = nil;
    self.seeCountLabel.text = nil;
    self.activeNameLabel.text = nil;
    self.timeLabel.text = nil;
    self.locationLabel.text = nil;
    self.statusLabel.text = nil;
    self.priceLabel.text = nil;
    self.comment_saleLabel.text = nil;
}

- (void)makeConstraints{
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150 *ScreenRatio_6, 110 *ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.top.mas_equalTo(self.contentView);
    }];
    [self.seeCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.imgIV.mas_right).offset(-10 *ScreenRatio_6);
        make.bottom.mas_equalTo(self.imgIV.mas_bottom).offset(-10 *ScreenRatio_6);
    }];
    [self.seeIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.seeCountLabel.mas_left).offset(-3);
        make.centerY.mas_equalTo(self.seeCountLabel);
    }];
    [self.activeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgIV).offset(3);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 *ScreenRatio_6);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.activeNameLabel.mas_bottom).offset(8 *ScreenRatio_6);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 *ScreenRatio_6);
    }];
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.timeLabel.mas_bottom).offset(8 *ScreenRatio_6);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 *ScreenRatio_6);
    }];
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.locationLabel.mas_bottom).offset(8 *ScreenRatio_6);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 *ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(50, 15));
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.imgIV.mas_bottom);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 *ScreenRatio_6);
        make.right.mas_equalTo(self.comment_saleLabel.mas_left).offset(-10 *ScreenRatio_6);
    }];
    [self.comment_saleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 *ScreenRatio_6);
        make.centerY.mas_equalTo(self.priceLabel);
    }];
}

#pragma mark - get
- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [UIImageView new];
        _imgIV.layer.masksToBounds = YES;
    }
    return _imgIV;
}
- (UIImageView *)seeIV{
    if (!_seeIV) {
        _seeIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"预览b"]];
    }
    return _seeIV;
}
- (UILabel *)seeCountLabel{
    if (!_seeCountLabel) {
        _seeCountLabel = [UILabel new];
        _seeCountLabel.font = [UIFont systemFontOfSize:9 *ScreenRatio_6];
        _seeCountLabel.textColor = [UIColor whiteColor];
    }
    return _seeCountLabel;
}
- (UILabel *)activeNameLabel{
    if (!_activeNameLabel) {
        _activeNameLabel = [UILabel new];
        _activeNameLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _activeNameLabel.textColor = KMainTextColor_3;
        _activeNameLabel.numberOfLines = 1;
    }
    return _activeNameLabel;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:11 *ScreenRatio_6];
        _timeLabel.textColor = KMainTextColor_9;
        _timeLabel.numberOfLines = 1;
    }
    return _timeLabel;
}
- (UILabel *)locationLabel{
    if (!_locationLabel) {
        _locationLabel = [UILabel new];
        _locationLabel.font = [UIFont systemFontOfSize:11 *ScreenRatio_6];
        _locationLabel.textColor = KMainTextColor_9;
        _locationLabel.numberOfLines = 1;
    }
    return _locationLabel;
}
- (UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = [UILabel new];
        _statusLabel.font = [UIFont systemFontOfSize:11 *ScreenRatio_6];
        _statusLabel.textColor = kMainTextColor_red;
        _statusLabel.layer.borderColor = kMainTextColor_red.CGColor;
        _statusLabel.layer.borderWidth = 0.5;
        _statusLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _statusLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:15 *ScreenRatio_6];
        _priceLabel.textColor = kMainTextColor_red;
    }
    return _priceLabel;
}
- (UILabel *)comment_saleLabel{
    if (!_comment_saleLabel) {
        _comment_saleLabel = [UILabel new];
        _comment_saleLabel.font = [UIFont systemFontOfSize:10 *ScreenRatio_6];
        _comment_saleLabel.textColor = KMainTextColor_9;
    }
    return _comment_saleLabel;
}
@end

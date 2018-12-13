//
//  WLKTLoginLogCell.m
//  wlkt
//
//  Created by 尹平江 on 17/3/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTLoginLogCell.h"

@implementation WLKTLoginLogCell

#pragma mark - init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.headView];
        [self.contentView addSubview:self.separatorView_one];
        [self.contentView addSubview:self.timeTitleLabel];
        [self.contentView addSubview:self.loginTimeLabel];
        [self.contentView addSubview:self.IPLabel];
        [self.contentView addSubview:self.netLabel];
        [self.contentView addSubview:self.loginDeviceLabel];
    }
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    return self;
}
#pragma mark - updateConstraints

- (void)updateConstraints{
    //头部填充view
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 15 * ScreenRatio_6));
        make.top.mas_equalTo(self.contentView);
    }];
    //时间title
    [self.timeTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth / 2, 25 * ScreenRatio_6));
        make.top.mas_equalTo(self.headView.mas_bottom).offset(5 * ScreenRatio_6);
        make.left.mas_equalTo(self.contentView).offset(20 * ScreenRatio_6);
    }];
    //分割线1
    [self.separatorView_one mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 1));
        make.top.mas_equalTo(self.timeTitleLabel.mas_bottom).offset(5 * ScreenRatio_6);
    }];
    //登录时间
    [self.loginTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth * 0.8, 20 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(20 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView_one.mas_bottom).offset(5 * ScreenRatio_6);
    }];
    //ip地址
    [self.IPLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth * 0.8, 20 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(20 * ScreenRatio_6);
        make.top.mas_equalTo(self.loginTimeLabel.mas_bottom).offset(5 * ScreenRatio_6);
    }];
    //登录网络
    [self.netLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth * 0.8, 20 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(20 * ScreenRatio_6);
        make.top.mas_equalTo(self.IPLabel.mas_bottom).offset(5 * ScreenRatio_6);
    }];
    //登录设备
    [self.loginDeviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth * 0.8, 20 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(20 * ScreenRatio_6);
        make.top.mas_equalTo(self.netLabel.mas_bottom).offset(5 * ScreenRatio_6);
    }];
    
    [super updateConstraints];
}

#pragma mark - get

- (UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc]init];
        _headView.backgroundColor = fillViewColor;
    }
    return _headView;
}
- (UIView *)separatorView_one{
    if (!_separatorView_one) {
        _separatorView_one = [[UIView alloc]init];
        _separatorView_one.backgroundColor = fillViewColor;
    }
    return _separatorView_one;
}

- (UILabel *)timeTitleLabel{
    if (!_timeTitleLabel) {
        _timeTitleLabel = [[UILabel alloc]init];
        _timeTitleLabel.textColor = wordBlueColor;
        //_timeTitleLabel.text = @"2017.11.11";
        _timeTitleLabel.font = [UIFont systemFontOfSize:15 * ScreenRatio_6];
    }
    return _timeTitleLabel;
}

- (UILabel *)loginTimeLabel{
    if (!_loginTimeLabel) {
        _loginTimeLabel = [[UILabel alloc]init];
        //_loginTimeLabel.text = @"登录时间    2011.11.11";
        _loginTimeLabel.textColor = userLabelColor;
        _loginTimeLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
    }
    return _loginTimeLabel;
}

- (UILabel *)IPLabel{
    if (!_IPLabel) {
        _IPLabel = [[UILabel alloc]init];
        _IPLabel.textColor = userLabelColor;
        _IPLabel.font = [UIFont systemFontOfSize:13 * ScreenRatio_6];
        //_IPLabel.text = @"IP 地址      192.168.*.*";
    }
    return _IPLabel;
}

- (UILabel *)netLabel{
    if (!_netLabel) {
        _netLabel = [[UILabel alloc]init];
        _netLabel.textColor = userLabelColor;
        _netLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
       // _netLabel.text = @"参考地点    局域网";
    }
    return _netLabel;
}

- (UILabel *)loginDeviceLabel{
    if (!_loginDeviceLabel) {
        _loginDeviceLabel = [[UILabel alloc]init];
        _loginDeviceLabel.textColor = userLabelColor;
        _loginDeviceLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
       // _loginDeviceLabel.text = @"登录设备    Window/Google Chrome";
    }
    return _loginDeviceLabel;
}

#pragma mark - 

- (void)prepareForReuse{
    [super prepareForReuse];
    self.loginDeviceLabel.text = nil;
    self.netLabel.text = nil;
    self.IPLabel.text = nil;
    self.loginTimeLabel.text = nil;
    self.timeTitleLabel.text = nil;

}

#pragma mark - set data

- (void)setCellContent:(WLKTLoginLogData *)data{
    self.loginDeviceLabel.text = [NSString stringWithFormat:@"登录设备    %@",data.login_way];
    self.netLabel.text = [NSString stringWithFormat:@"参考地点    %@",data.location];
    self.IPLabel.text = [NSString stringWithFormat:@"IP    地址      %@",data.loginip];
    self.loginTimeLabel.text = [NSString stringWithFormat:@"登录时间    %@",data.logintime];
    self.timeTitleLabel.text = [NSString stringWithFormat:@"%@",data.day];
}

@end

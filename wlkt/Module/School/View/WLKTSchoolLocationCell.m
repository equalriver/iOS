//
//  WLKTSchoolLocationCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolLocationCell.h"
#import "WLKTCourseDetailMapVC.h"

@interface WLKTSchoolLocationCell ()
@property (strong, nonatomic) UILabel *schoolNameLabel;
@property (strong, nonatomic) UIImageView *dingweiIconIV;
@property (strong, nonatomic) UILabel *dingweiLabel;
@property (strong, nonatomic) UILabel *locationLabel;
@property (strong, nonatomic) UILabel *distanceLabel;
@property (strong, nonatomic) UIImageView *rightArrowIV;
@property (strong, nonatomic) UIView *separatorView;

@end

@implementation WLKTSchoolLocationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.schoolNameLabel];
        [self.contentView addSubview:self.locationLabel];
        [self.contentView addSubview:self.dingweiIconIV];
        [self.dingweiIconIV addSubview:self.dingweiLabel];
        [self.contentView addSubview:self.rightArrowIV];
        [self.contentView addSubview:self.distanceLabel];
        [self.contentView addSubview:self.separatorView];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellData:(WLKTAddress *)data index:(NSInteger)index currentCoordinate:(CLLocationCoordinate2D)currentCoordinate{
    self.schoolNameLabel.text = data.name;
    self.locationLabel.text = data.address;
    self.dingweiLabel.text = [NSString stringWithFormat:@"%c", (char)index + 17];
//    [WLKTCourseDetailMapVC getCoordinateByAddress:data.address completion:^(CLLocationCoordinate2D coordinate, NSError *error) {
//        if (!error) {
//            double distance = [self getDistanceLat1:coordinate.latitude whitLng1:coordinate.longitude whitLat2:currentCoordinate.latitude whitLng2:currentCoordinate.longitude];
//            NSString *dis = distance * 0.001 > 1 ? [NSString stringWithFormat:@"%.1fkm    ", distance * 0.001] : [NSString stringWithFormat:@"%.0fm    ", distance];
//            self.distanceLabel.text = dis;
//        }
//    }];
    self.distanceLabel.text = [NSString stringWithFormat:@"%@    ", data.distance ?: @""];
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.dingweiLabel.text = nil;
    self.schoolNameLabel.text = nil;
    self.locationLabel.text = nil;
    self.distanceLabel.text = nil;
}

#pragma mark - location
//根据角度计算弧度
-(double)radian:(double)d{
    return d * M_PI/180.0;
}

//根据两点经纬度计算两点距离
-(double)getDistanceLat1:(double)lat1 whitLng1:(double)lng1 whitLat2:(double)lat2 whitLng2:(double)lng2{
    
    double EARTH_RADIUS = 6378137;//地球半径  人类规定(单位：m)
    double radLat1 = [self radian:lat1];
    double radLat2 = [self radian:lat2];
    double radLng1 = [self radian:lng1];
    double radLng2 = [self radian:lng2];
    
    double a = radLat1 - radLat2;
    double b = radLng1 - radLng2;
    
    double s = 2 * asin(sqrt(pow(sin(a/2),2) + cos(radLat1)*cos(radLat2)*pow(sin(b/2),2)));//google maps里面实现的算法
    s = s * EARTH_RADIUS;
    
    return s;
}

#pragma mark - make constaints
- (void)makeConstraints{
    [self.dingweiIconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.dingweiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.dingweiIconIV);
    }];
    [self.schoolNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dingweiIconIV.mas_right).offset(7 * ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
    }];
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(260 * ScreenRatio_6, 15));
        make.left.mas_equalTo(self.schoolNameLabel);
        make.top.mas_equalTo(self.schoolNameLabel.mas_bottom).offset(5);
    }];
    [self.rightArrowIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.rightArrowIV.mas_left).offset(5);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.top.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView);
    }];
}

#pragma mark - get
- (UILabel *)schoolNameLabel{
    if (!_schoolNameLabel) {
        _schoolNameLabel = [[UILabel alloc]init];
        _schoolNameLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _schoolNameLabel.textColor = KMainTextColor_3;
    }
    return _schoolNameLabel;
}
- (UIImageView *)dingweiIconIV{
    if (!_dingweiIconIV) {
        _dingweiIconIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"定位黄"]];
    }
    return _dingweiIconIV;
}
- (UILabel *)dingweiLabel{
    if (!_dingweiLabel) {
        _dingweiLabel = [UILabel new];
        _dingweiLabel.font = [UIFont systemFontOfSize:10 * ScreenRatio_6];
        _dingweiLabel.textColor = UIColorHex(ffffff);
    }
    return _dingweiLabel;
}
- (UILabel *)locationLabel{
    if (!_locationLabel) {
        _locationLabel = [[UILabel alloc]init];
        _locationLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _locationLabel.textColor = KMainTextColor_9;
    }
    return _locationLabel;
}
- (UILabel *)distanceLabel{
    if (!_distanceLabel) {
        _distanceLabel = [UILabel new];
        _distanceLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _distanceLabel.textColor = KMainTextColor_3;
        _distanceLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _distanceLabel;
}
- (UIImageView *)rightArrowIV{
    if (!_rightArrowIV) {
        _rightArrowIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"课程详情进入"]];
    }
    return _rightArrowIV;
}
- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}
@end

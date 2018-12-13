//
//  WLKTCDLocationCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/15.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDLocationCell.h"

@interface WLKTCDLocationCell ()
@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UILabel *distanceLabel;
@property (strong, nonatomic) UIImageView *rightArrowIV;
@property (strong, nonatomic) UIView *sep;
@end

@implementation WLKTCDLocationCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.addressLabel];
        [self.contentView addSubview:self.distanceLabel];
        [self.contentView addSubview:self.rightArrowIV];
        [self.contentView addSubview:self.sep];
        [self makeConstraints];
    }
    return self;
}

- (void)setData:(WLKTCDDataPoint *)data{
    _data = data;
    [self getLocationEnabled];
    self.addressLabel.text = data.name;
    self.distanceLabel.text = data.distance;
    
    NSInteger length = 0;
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:3];
    UIView *temp = [UIView new];
    temp.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:temp];
    
    for (NSString *obj in data.tags) {
        
        UIView *v = [self createTagItemWithString:obj];
        [temp addSubview:v];
        [arr addObject:v];
        
        length += obj.length;
        
    }
    [temp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.addressLabel.mas_right).offset(10 *ScreenRatio_6);
        make.height.centerY.mas_equalTo(self.addressLabel);
        make.right.mas_equalTo(self.distanceLabel.mas_left).offset(-10 *ScreenRatio_6);
    }];
    [arr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.centerY.mas_equalTo(temp);
        make.width.mas_equalTo(40 *ScreenRatio_6);
    }];
    if (arr.count > 1) {
        [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 leadSpacing:5 tailSpacing:0];
    }
    else{
        [arr mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.height.centerY.mas_equalTo(temp);
            make.width.mas_equalTo(40 *ScreenRatio_6);
        }];
    }
    
//    [self.addressLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.contentView).offset(15 *ScreenRatio_6);
//        make.centerY.mas_equalTo(self.contentView);
//        make.size.mas_equalTo(CGSizeMake(270 *ScreenRatio_6 - length *20 *ScreenRatio_6, 15));
//    }];
    
}

//判断定位是否开启
- (void)getLocationEnabled{
    
    if ([CLLocationManager locationServicesEnabled]){
        //  判断用户是否允许程序获取位置权限
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways){
            //用户允许获取位置权限
            self.distanceLabel.hidden = false;
        }else{
            //用户拒绝开启用户权限
            self.distanceLabel.hidden = YES;
        }
    }else{
        self.distanceLabel.hidden = YES;
    }
    
}

- (UIView *)createTagItemWithString:(NSString *)string {
    UILabel *l = [UILabel new];
    l.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
    l.textColor = kMainTextColor_red;
    l.textAlignment = NSTextAlignmentCenter;
    l.layer.borderColor = kMainTextColor_red.CGColor;
    l.layer.borderWidth = 0.5;
    l.layer.masksToBounds = YES;
    l.layer.cornerRadius = 2;
    l.text = string;
    return l;
}

- (void)makeConstraints{
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(15 *ScreenRatio_6);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.rightArrowIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(7, 13));
    }];
    [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.rightArrowIV.mas_left).offset(-5);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.sep mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
    }];
    
}

#pragma mark - get
- (UILabel *)addressLabel{
    if (!_addressLabel) {
        _addressLabel = [UILabel new];
        _addressLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _addressLabel.textColor = KMainTextColor_6;
    }
    return _addressLabel;
}
- (UILabel *)distanceLabel{
    if (!_distanceLabel) {
        _distanceLabel = [UILabel new];
        _distanceLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _distanceLabel.textColor = KMainTextColor_9;
        _distanceLabel.textAlignment = NSTextAlignmentRight;
    }
    return _distanceLabel;
}
- (UIImageView *)rightArrowIV{
    if (!_rightArrowIV) {
        _rightArrowIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"箭头_右"]];
    }
    return _rightArrowIV;
}
- (UIView *)sep{
    if (!_sep) {
        _sep = [UIView new];
        _sep.backgroundColor = kMainBackgroundColor;
    }
    return _sep;
}

@end

//
//  WLKTClassifyCourseCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/4.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTClassifyCourseCell.h"
#import "ZFButton.h"
#import "WLKTCourseDetailMapVC.h"

@interface WLKTClassifyCourseCell ()
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) UILabel *courseTagLabel;
@property (strong, nonatomic) UILabel *courseNameLabel;
@property (strong, nonatomic) UIImageView *zekouIV;
@property (strong, nonatomic) UIImageView *manjianIV;
@property (strong, nonatomic) UIImageView *youhuiIV;
@property (strong, nonatomic) UIImageView *scoreIV;
@property (strong, nonatomic) UILabel *scoreLabel;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *rawPriceLabel;
@property (strong, nonatomic) UIImageView *seeIV;
@property (strong, nonatomic) UILabel *seeLabel;
@property (strong, nonatomic) UILabel *schoolNameLabel;
@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UILabel *distanceLabel;
@property (strong, nonatomic) UIImageView *renzhengIV;
@property (strong, nonatomic) UILabel *renzhengLabel;
@property (strong, nonatomic) UIImageView *schoolTagIV;
@property (strong, nonatomic) ZFButton *phoneBtn;
@property (strong, nonatomic) ZFButton *onlinePhoneBtn;
@property (strong, nonatomic) UIView *separatorView;

@property (nonatomic) NSInteger index;
@end

@implementation WLKTClassifyCourseCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.imgIV];
        [self.contentView addSubview:self.courseTagLabel];
        [self.contentView addSubview:self.courseNameLabel];
        [self.contentView addSubview:self.scoreIV];
        [self.contentView addSubview:self.scoreLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.rawPriceLabel];
        [self.contentView addSubview:self.seeIV];
        [self.contentView addSubview:self.seeLabel];
        [self.contentView addSubview:self.schoolNameLabel];
        [self.contentView addSubview:self.addressLabel];
        [self.contentView addSubview:self.distanceLabel];
        [self.contentView addSubview:self.renzhengIV];
        [self.contentView addSubview:self.renzhengLabel];
        [self.contentView addSubview:self.phoneBtn];
        [self.contentView addSubview:self.onlinePhoneBtn];
        [self.contentView addSubview:self.separatorView];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellData:(WLKTCourse *)data index:(NSInteger)index{
    _index = index;
//    [WLKTCourseDetailMapVC getCoordinateByAddress:data.address completion:^(CLLocationCoordinate2D coordinate, NSError *error) {
//        if (!error) {
//            double distance = [self getDistanceLat1:coordinate.latitude whitLng1:coordinate.longitude whitLat2:_currentCoordinate.latitude whitLng2:_currentCoordinate.longitude];
//            NSString *dis = distance * 0.001 > 1 ? [NSString stringWithFormat:@"%.1fkm ", distance * 0.001] : [NSString stringWithFormat:@"%.0fm ", distance];
//            if (distance * 0.001 > 999) {
//                dis = [NSString stringWithFormat:@"%.0fkm ", distance * 0.001];
//            }
//            self.distanceLabel.text = dis;
//        }
//    }];
    self.distanceLabel.text = data.distance;
    [self.imgIV setImageURL:[NSURL URLWithString:data.img]];
    if (!data.age_area.length) {
        self.courseTagLabel.hidden = YES;
    }
    self.courseTagLabel.text = data.age_area;
    self.courseNameLabel.text = data.coursename;
    CGFloat courseNameWidth = [data.coursename getSizeWithHeight:15 Font:13.5 *ScreenRatio_6].width > 250 * ScreenRatio_6 ? 250 *ScreenRatio_6 : [data.coursename getSizeWithHeight:15 Font:13.5 *ScreenRatio_6].width;
    [self.courseNameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(courseNameWidth);
    }];
    self.seeLabel.text = [NSString stringWithFormat:@"%ld人看过", data.hits];
//    if (data.distance.length) {
//        self.distanceLabel.text = data.distance;
//    }
    if (data.xiaoqu.length) {
        [self.contentView addSubview:self.schoolTagIV];
        [self.schoolTagIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.distanceLabel.mas_right).offset(2);
            make.bottom.mas_equalTo(self.distanceLabel.mas_bottom);
        }];
    }
    //
    if (data.score.floatValue >= 4.5) {
        self.scoreIV.image = [UIImage imageNamed:@"5星"];
    }
    else if (data.score.floatValue >= 3.5 && data.score.floatValue < 4.5){
        self.scoreIV.image = [UIImage imageNamed:@"4星"];
    }
    else if (data.score.floatValue >= 2.5 && data.score.floatValue < 3.5){
        self.scoreIV.image = [UIImage imageNamed:@"3星"];
    }
    else if (data.score.floatValue >= 1.5 && data.score.floatValue < 2.5){
        self.scoreIV.image = [UIImage imageNamed:@"2星"];
    }
    else{
        self.scoreIV.image = [UIImage imageNamed:@"1星"];
    }
    //
    if (ScreenHeight < 667) {
        self.scoreLabel.text = [NSString stringWithFormat:@"%ld条评论  |  效果：%@  |  师资：%@  |  环境：%@", data.comment_num, data.effect, data.teach_score, data.environment];
    }
    else{
        self.scoreLabel.text = [NSString stringWithFormat:@"%ld条评论   |   效果：%@   |   师资：%@   |   环境：%@", data.comment_num, data.effect, data.teach_score, data.environment];
    }
    //
    if ([data.showprice isEqualToString:@"免费"]) {
        self.priceLabel.text = data.showprice;
    }
    else{
        self.priceLabel.text = [NSString stringWithFormat:@"%@", data.showprice];
    }
    
    if (data.oldprice.length > 0) {
        NSString *s;
        NSMutableAttributedString *str;
        s = [NSString stringWithFormat:@"原价 %@", data.oldprice];
        str = [[NSMutableAttributedString alloc]initWithString:s];
        [str setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:9], NSForegroundColorAttributeName: KMainTextColor_3, NSStrikethroughStyleAttributeName: @(NSUnderlinePatternSolid | NSUnderlineStyleSingle)} range:NSMakeRange(0, s.length)];
        self.rawPriceLabel.attributedText = str;
    }
    //
    NSString *s = [NSString stringWithFormat:@"学校 %@", data.schoolname];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:s];
    [str setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: UIColorHex(37becc)} range:NSMakeRange(0, 3)];
    [str setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: KMainTextColor_9} range:NSMakeRange(3, s.length - 3)];
    self.schoolNameLabel.attributedText = str;
    //
    NSString *ss = [NSString stringWithFormat:@"地址 %@", data.address];
    NSMutableAttributedString *sstr = [[NSMutableAttributedString alloc]initWithString:ss];
    [sstr setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: UIColorHex(37becc)} range:NSMakeRange(0, 3)];
    [sstr setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: KMainTextColor_9} range:NSMakeRange(3, ss.length - 3)];
    self.addressLabel.attributedText = sstr;
    CGFloat addressWidth = [ss getSizeWithHeight:15 Font:10.5 *ScreenRatio_6].width > 170 * ScreenRatio_6 ? 170 *ScreenRatio_6 : [ss getSizeWithHeight:15 Font:10.5 *ScreenRatio_6].width;
    [self.addressLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(addressWidth, 15));
    }];
    [self.distanceLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.addressLabel.mas_right).offset(5);
    }];
    //
    if (data.youhui.count == 3) {
        [self.contentView addSubview:self.zekouIV];
        [self.zekouIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.courseNameLabel.mas_right).offset(5);
            make.centerY.mas_equalTo(self.courseNameLabel);
        }];
        [self.contentView addSubview:self.manjianIV];
        [self.manjianIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.zekouIV.mas_right).offset(7);
            make.centerY.mas_equalTo(self.courseNameLabel);
        }];
        [self.contentView addSubview:self.youhuiIV];
        [self.youhuiIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.manjianIV.mas_right).offset(7);
            make.centerY.mas_equalTo(self.courseNameLabel);
        }];
    }
    if (data.youhui.count == 2) {
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:2];
        for (NSString *obj in data.youhui) {
            if ([obj isEqualToString:@"折"]) {
                [self.contentView addSubview:self.zekouIV];
                [arr addObject:self.zekouIV];
            }
            if ([obj isEqualToString:@"减"]) {
                [self.contentView addSubview:self.manjianIV];
                [arr addObject:self.manjianIV];
            }
            if ([obj isEqualToString:@"券"]) {
                [self.contentView addSubview:self.youhuiIV];
                [arr addObject:self.youhuiIV];
            }
        }
        [arr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.courseNameLabel.mas_right).offset(5);
            make.centerY.mas_equalTo(self.courseNameLabel);
        }];
        [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:7 leadSpacing:0 tailSpacing:0];
    }
    if (data.youhui.count == 1) {
        for (NSString *obj in data.youhui) {
            if ([obj isEqualToString:@"折"]) {
                [self.contentView addSubview:self.zekouIV];
                [self.zekouIV mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(self.courseNameLabel.mas_right).offset(5);
                    make.centerY.mas_equalTo(self.courseNameLabel);
                }];
            }
            if ([obj isEqualToString:@"减"]) {
                [self.contentView addSubview:self.manjianIV];
                [self.manjianIV mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(self.courseNameLabel.mas_right).offset(5);
                    make.centerY.mas_equalTo(self.courseNameLabel);
                }];
            }
            if ([obj isEqualToString:@"券"]) {
                [self.contentView addSubview:self.youhuiIV];
                [self.youhuiIV mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(self.courseNameLabel.mas_right).offset(5);
                    make.centerY.mas_equalTo(self.courseNameLabel);
                }];
            }
        }
        
    }
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.imgIV.image = nil;
    self.courseTagLabel.text = nil;
    self.courseNameLabel.text = nil;
    self.scoreIV.image = nil;
    self.scoreLabel.text = nil;
    self.priceLabel.text = nil;
    self.rawPriceLabel.text = nil;
    self.seeLabel.text = nil;
    self.schoolNameLabel.attributedText = nil;
    self.addressLabel.attributedText = nil;
    [self.zekouIV removeFromSuperview];
    [self.manjianIV removeFromSuperview];
    [self.youhuiIV removeFromSuperview];
    [self.schoolTagIV removeFromSuperview];
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

#pragma mark - action
- (void)btnDidClick:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(didSelectedClassifyCoursePhone:index:)]) {
        [self.delegate didSelectedClassifyCoursePhone:sender.tag index:self.index];
    }
}

//图片在上  文字在下
- (ZFButton *)createZFButton:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag {
    ZFButton *btn = [ZFButton new];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:KMainTextColor_3 forState:UIControlStateNormal];
    btn.tag = tag;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//    btn.frame = CGRectMake(tag * 78 * ScreenRatio_6, 0, 75 * ScreenRatio_6, 50);
    btn.imageRect = CGRectMake(15 *ScreenRatio_6, 0, 20 *ScreenRatio_6, 20 *ScreenRatio_6);
    btn.titleRect = CGRectMake(0, 25 *ScreenRatio_6, 50 *ScreenRatio_6, 15 *ScreenRatio_6);
    [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)makeConstraints{
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(355 * ScreenRatio_6, 180 * ScreenRatio_6));
        make.top.mas_equalTo(self.contentView).offset(10);
        make.centerX.mas_equalTo(self.contentView);
    }];
    [self.courseTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60 *ScreenRatio_6, 15));
        make.left.mas_equalTo(self.imgIV);
        make.top.mas_equalTo(self.imgIV);
    }];
    [self.courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.top.mas_equalTo(self.imgIV.mas_bottom).offset(10);
        make.width.mas_equalTo(ScreenWidth / 2);
    }];
    [self.scoreIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.courseNameLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
    }];
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.scoreIV.mas_right).offset(10 *ScreenRatio_6);
        make.centerY.mas_equalTo(self.scoreIV);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.scoreIV.mas_bottom).offset(10);
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
    }];
    [self.rawPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.priceLabel.mas_right).offset(10 *ScreenRatio_6);
        make.bottom.mas_equalTo(self.priceLabel.mas_bottom);
    }];
    [self.seeIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.rawPriceLabel.mas_right).offset(10 *ScreenRatio_6);
        make.centerY.mas_equalTo(self.priceLabel);
    }];
    [self.seeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.seeIV.mas_right).offset(5);
        make.centerY.mas_equalTo(self.priceLabel);
    }];
    [self.schoolNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.top.mas_equalTo(self.priceLabel.mas_bottom).offset(10);
    }];
    [self.renzhengIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.schoolNameLabel.mas_right).offset(10 *ScreenRatio_6);
        make.bottom.mas_equalTo(self.schoolNameLabel.mas_bottom);
    }];
    [self.renzhengLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.renzhengIV.mas_right).offset(2);
        make.bottom.mas_equalTo(self.schoolNameLabel.mas_bottom);
    }];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.schoolNameLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth / 2, 15));
    }];
    [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.addressLabel.mas_right);
        make.centerY.mas_equalTo(self.addressLabel);
    }];
    [self.phoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50 *ScreenRatio_6, 35 *ScreenRatio_6));
        make.right.mas_equalTo(self.onlinePhoneBtn.mas_left).offset(-5);
        make.bottom.mas_equalTo(self.addressLabel.mas_bottom).offset(-4);
    }];
    [self.onlinePhoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50 *ScreenRatio_6, 35 *ScreenRatio_6));
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 *ScreenRatio_6);
        make.bottom.mas_equalTo(self.addressLabel.mas_bottom).offset(-4);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 5));
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.left.mas_equalTo(self.contentView);
    }];
}

#pragma mark - get
- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [UIImageView new];
        _imgIV.contentMode = UIViewContentModeScaleAspectFill;
        _imgIV.layer.masksToBounds = YES;
    }
    return _imgIV;
}
- (UILabel *)courseTagLabel{
    if (!_courseTagLabel) {
        _courseTagLabel = [UILabel new];
        _courseTagLabel.backgroundColor = [UIColor colorWithRed:244/255.0 green:195/255.0 blue:83/255.0 alpha:1.0];
        _courseTagLabel.font = [UIFont systemFontOfSize:10 *ScreenRatio_6];
        _courseTagLabel.textColor = UIColorHex(ffffff);
        _courseTagLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _courseTagLabel;
}
- (UILabel *)courseNameLabel{
    if (!_courseNameLabel) {
        _courseNameLabel = [UILabel new];
        _courseNameLabel.font = [UIFont systemFontOfSize:13 *ScreenRatio_6 weight:UIFontWeightSemibold];
        _courseNameLabel.textColor = KMainTextColor_3;
    }
    return _courseNameLabel;
}
- (UIImageView *)zekouIV{
    if (!_zekouIV) {
        _zekouIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"分类折扣"]];
    }
    return _zekouIV;
}
- (UIImageView *)manjianIV{
    if (!_manjianIV) {
        _manjianIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"满减"]];
    }
    return _manjianIV;
}
- (UIImageView *)youhuiIV{
    if (!_youhuiIV) {
        _youhuiIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"分类优惠券"]];
    }
    return _youhuiIV;
}
- (UIImageView *)scoreIV{
    if (!_scoreIV) {
        _scoreIV = [UIImageView new];
    }
    return _scoreIV;
}
- (UILabel *)scoreLabel{
    if (!_scoreLabel) {
        _scoreLabel = [UILabel new];
        _scoreLabel.font = [UIFont systemFontOfSize:10 *ScreenRatio_6];
        _scoreLabel.textColor = KMainTextColor_9;
    }
    return _scoreLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _priceLabel.textColor = kMainTextColor_red;
    }
    return _priceLabel;
}
- (UILabel *)rawPriceLabel{
    if (!_rawPriceLabel) {
        _rawPriceLabel = [UILabel new];
    }
    return _rawPriceLabel;
}
- (UIImageView *)seeIV{
    if (!_seeIV) {
        _seeIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"预览"]];
    }
    return _seeIV;
}
- (UILabel *)seeLabel{
    if (!_seeLabel) {
        _seeLabel = [UILabel new];
        _seeLabel.font = [UIFont systemFontOfSize:7];
        _seeLabel.textColor = KMainTextColor_9;
    }
    return _seeLabel;
}
- (UILabel *)schoolNameLabel{
    if (!_schoolNameLabel) {
        _schoolNameLabel = [UILabel new];
    }
    return _schoolNameLabel;
}
- (UILabel *)addressLabel{
    if (!_addressLabel) {
        _addressLabel = [UILabel new];
    }
    return _addressLabel;
}
- (UILabel *)distanceLabel{
    if (!_distanceLabel) {
        _distanceLabel = [UILabel new];
        _distanceLabel.font = [UIFont systemFontOfSize:10 *ScreenRatio_6];
        _distanceLabel.textColor = KMainTextColor_9;
    }
    return _distanceLabel;
}
- (UIImageView *)renzhengIV{
    if (!_renzhengIV) {
        _renzhengIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"机构认证"]];
    }
    return _renzhengIV;
}
- (UILabel *)renzhengLabel{
    if (!_renzhengLabel) {
        _renzhengLabel = [UILabel new];
        _renzhengLabel.font = [UIFont systemFontOfSize:9];
        _renzhengLabel.textColor = KMainTextColor_3;
        _renzhengLabel.text = @"认证机构";
    }
    return _renzhengLabel;
}
- (UIImageView *)schoolTagIV{
    if (!_schoolTagIV) {
        _schoolTagIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"分校"]];
    }
    return _schoolTagIV;
}
- (ZFButton *)phoneBtn{
    if (!_phoneBtn) {
        _phoneBtn = [self createZFButton:@"咨询电话" image:[UIImage imageNamed:@"分类电话"] tag:ClassifyCoursePhoneTypeZiXun];
    }
    return _phoneBtn;
}
- (ZFButton *)onlinePhoneBtn{
    if (!_onlinePhoneBtn) {
        _onlinePhoneBtn = [self createZFButton:@"在线咨询" image:[UIImage imageNamed:@"分类咨询"] tag:ClassifyCoursePhoneTypeOnline];
    }
    return _onlinePhoneBtn;
}
- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}
@end

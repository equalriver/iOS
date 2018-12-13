//
//  WLKTClassifyActivityCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/18.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTClassifyActivityCell.h"
#import "ZFButton.h"
#import "WLKTCourseDetailMapVC.h"

@interface WLKTClassifyActivityCell ()
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) UILabel *activityTagLabel;
@property (strong, nonatomic) UILabel *activityNameLabel;
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
//@property (strong, nonatomic) UIImageView *zhekouIV;
//@property (strong, nonatomic) UILabel *zhekouLabel;
//@property (strong, nonatomic) UIImageView *manjianIV;
//@property (strong, nonatomic) UILabel *manjianLabel;
@property (nonatomic) NSInteger index;
@end

@implementation WLKTClassifyActivityCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.imgIV];
        [self.contentView addSubview:self.activityTagLabel];
        [self.contentView addSubview:self.activityNameLabel];
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
//        [self.contentView addSubview:self.zhekouIV];
//        [self.contentView addSubview:self.zhekouLabel];
//        [self.contentView addSubview:self.manjianIV];
//        [self.contentView addSubview:self.manjianLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellData:(WLKTCourse *)data index:(NSInteger)index{
    _index = index;
//    [WLKTCourseDetailMapVC getCoordinateByAddress:data.address completion:^(CLLocationCoordinate2D coordinate, NSError *error) {
//        if (!error) {
//            double distance = [self getDistanceLat1:coordinate.latitude whitLng1:coordinate.longitude whitLat2:_currentCoordinate.latitude whitLng2:_currentCoordinate.longitude];
//            NSString *dis = distance * 0.001 > 1 ? [NSString stringWithFormat:@"%.1fkm", distance * 0.001] : [NSString stringWithFormat:@"%.0fm", distance];
//            if (distance * 0.001 > 999) {
//                dis = [NSString stringWithFormat:@"%.0fkm", distance * 0.001];
//            }
//            self.distanceLabel.text = dis;
//        }
//    }];
    self.distanceLabel.text = data.distance;
    [self.imgIV setImageURL:[NSURL URLWithString:data.img]];
    if (!data.actstatus.length) {
        self.activityTagLabel.hidden = YES;
    }
    NSString *tagStr = [NSString stringWithFormat:@"%@ %@", data.actstatus, data.asctime];
    if ([data.actstatus containsString:@"开始"]) {
        self.activityTagLabel.backgroundColor = UIColorHex(f6c447);
    }
    if ([data.actstatus containsString:@"进行"]) {
        self.activityTagLabel.backgroundColor = kMainTextColor_red;
    }
    if ([data.actstatus containsString:@"结束"]) {
        self.activityTagLabel.backgroundColor = KMainTextColor_9;
    }
    self.activityTagLabel.text = tagStr;
    [self.activityTagLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo([tagStr getSizeWithHeight:15 Font:12]);
    }];

    self.activityNameLabel.text = data.title;
    CGFloat activityNameWidth = [data.title getSizeWithHeight:15 Font:13.5 *ScreenRatio_6].width > 250 * ScreenRatio_6 ? 250 *ScreenRatio_6 : [data.title getSizeWithHeight:15 Font:13.5 *ScreenRatio_6].width;
    [self.activityNameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(activityNameWidth);
    }];
    self.seeLabel.text = [NSString stringWithFormat:@"%ld人看过", data.hits];

    if (data.xiaoqu.length) {
        [self.contentView addSubview:self.schoolTagIV];
        [self.schoolTagIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.renzhengLabel.mas_right).offset(2);
            make.bottom.mas_equalTo(self.renzhengLabel.mas_bottom);
        }];
        [self.distanceLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.addressLabel.mas_right).offset(30);
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
    if ([data.price isEqualToString:@"免费"]) {
        self.priceLabel.text = data.price;
    }
    else{
        self.priceLabel.text = [NSString stringWithFormat:@"¥%@", data.price];
    }
    
    if (data.oldprice.length > 0) {
        NSString *s;
        NSMutableAttributedString *str;
        s = [NSString stringWithFormat:@"原价 ¥%@", data.oldprice];
        str = [[NSMutableAttributedString alloc]initWithString:s];
        [str setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:9], NSForegroundColorAttributeName: KMainTextColor_3, NSStrikethroughStyleAttributeName: @(NSUnderlinePatternSolid | NSUnderlineStyleSingle)} range:NSMakeRange(0, s.length)];
        self.rawPriceLabel.attributedText = str;
    }

    self.schoolNameLabel.text = [NSString stringWithFormat:@"学校 %@", data.schoolname];
    CGFloat scw = [[NSString stringWithFormat:@"学校 %@", data.schoolname] getSizeWithHeight:15 Font:11.5].width;
    CGFloat schoolNameW = scw > 150 *ScreenRatio_6 ? 150 *ScreenRatio_6 : scw;
    [self.schoolNameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(schoolNameW);
    }];
    self.addressLabel.text = [NSString stringWithFormat:@"地址 %@", data.address];
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.imgIV.image = nil;
    self.activityTagLabel.text = nil;
    self.activityNameLabel.text = nil;
    self.scoreIV.image = nil;
    self.scoreLabel.text = nil;
    self.priceLabel.text = nil;
    self.rawPriceLabel.attributedText = nil;
    self.seeLabel.text = nil;
    self.schoolNameLabel.text = nil;
    self.addressLabel.text = nil;
//
//    [self.youhuiIV removeFromSuperview];
//    [self.schoolTagIV removeFromSuperview];
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
    if ([self.delegate respondsToSelector:@selector(didSelectedClassifyActivityPhone:index:)]) {
        [self.delegate didSelectedClassifyActivityPhone:sender.tag index:self.index];
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
    [self.activityTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(180 *ScreenRatio_6, 15));
        make.left.bottom.mas_equalTo(self.imgIV);
    }];
    [self.activityNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.top.mas_equalTo(self.imgIV.mas_bottom).offset(10);
        make.width.mas_equalTo(ScreenWidth / 2);
    }];
    [self.seeIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.seeLabel.mas_left).offset(-5);
        make.centerY.mas_equalTo(self.activityNameLabel);
    }];
    [self.seeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 *ScreenRatio_6);
        make.centerY.mas_equalTo(self.activityNameLabel);
    }];
    [self.scoreIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.activityNameLabel.mas_bottom).offset(10);
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
    [self.schoolNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.top.mas_equalTo(self.priceLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(200 *ScreenRatio_6);
    }];
    [self.renzhengIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.schoolNameLabel.mas_right);
        make.bottom.mas_equalTo(self.schoolNameLabel.mas_bottom);
    }];
    [self.renzhengLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.renzhengIV.mas_right).offset(2);
        make.bottom.mas_equalTo(self.schoolNameLabel.mas_bottom);
    }];
    [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.renzhengLabel.mas_right).offset(5);
        make.centerY.mas_equalTo(self.renzhengLabel);
    }];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.schoolNameLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(250 *ScreenRatio_6, 15));
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
//    [self.zhekouIV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.contentView);
//        make.top.mas_equalTo(self.separatorView).offset(10);
//    }];
//    [self.zhekouLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.zhekouIV.mas_right).offset(5);
//        make.width.mas_equalTo(330 *ScreenRatio_6);
//        make.centerY.mas_equalTo(self.zhekouIV);
//    }];
//    [self.manjianIV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.contentView);
//        make.top.mas_equalTo(self.zhekouIV.mas_bottom).offset(8);
//    }];
//    [self.manjianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.manjianIV.mas_right).offset(5);
//        make.width.mas_equalTo(330 *ScreenRatio_6);
//        make.centerY.mas_equalTo(self.manjianIV);
//    }];
}

#pragma mark - get
- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [UIImageView new];
        _imgIV.layer.masksToBounds = YES;
        _imgIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imgIV;
}
- (UILabel *)activityTagLabel{
    if (!_activityTagLabel) {
        _activityTagLabel = [UILabel new];
        _activityTagLabel.backgroundColor = kMainTextColor_red;
        _activityTagLabel.font = [UIFont systemFontOfSize:10 *ScreenRatio_6];
        _activityTagLabel.textColor = UIColorHex(ffffff);
        _activityTagLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _activityTagLabel;
}
- (UILabel *)activityNameLabel{
    if (!_activityNameLabel) {
        _activityNameLabel = [UILabel new];
        _activityNameLabel.font = [UIFont systemFontOfSize:13 *ScreenRatio_6 weight:UIFontWeightSemibold];
        _activityNameLabel.textColor = KMainTextColor_3;
    }
    return _activityNameLabel;
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
        _priceLabel.font = [UIFont systemFontOfSize:13 *ScreenRatio_6];
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
        _schoolNameLabel.font = [UIFont systemFontOfSize:11];
        _schoolNameLabel.textColor = KMainTextColor_9;
    }
    return _schoolNameLabel;
}
- (UILabel *)addressLabel{
    if (!_addressLabel) {
        _addressLabel = [UILabel new];
        _addressLabel.font = [UIFont systemFontOfSize:11];
        _addressLabel.textColor = KMainTextColor_9;
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
        _phoneBtn = [self createZFButton:@"咨询电话" image:[UIImage imageNamed:@"分类电话"] tag:ClassifyActivityPhoneTypeZiXun];
    }
    return _phoneBtn;
}
- (ZFButton *)onlinePhoneBtn{
    if (!_onlinePhoneBtn) {
        _onlinePhoneBtn = [self createZFButton:@"在线咨询" image:[UIImage imageNamed:@"分类咨询"] tag:ClassifyActivityPhoneTypeOnline];
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
//- (UIImageView *)zhekouIV{
//    if (!_zhekouIV) {
//        _zhekouIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"活动折扣"]];
//    }
//    return _zhekouIV;
//}
//- (UILabel *)zhekouLabel{
//    if (!_zhekouLabel) {
//        _zhekouLabel = [UILabel new];
//        _zhekouLabel.font = [UIFont systemFontOfSize:11];
//        _zhekouLabel.textColor = UIColorHex(404040);
//    }
//    return _zhekouLabel;
//}
//- (UIImageView *)manjianIV{
//    if (!_manjianIV) {
//        _manjianIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"活动满减"]];
//    }
//    return _manjianIV;
//}
//- (UILabel *)manjianLabel{
//    if (!_manjianLabel) {
//        _manjianLabel = [UILabel new];
//        _manjianLabel.font = [UIFont systemFontOfSize:11];
//        _manjianLabel.textColor = UIColorHex(404040);
//    }
//    return _manjianLabel;
//}
@end


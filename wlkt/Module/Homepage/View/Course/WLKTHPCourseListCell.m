//
//  WLKTHPCourseListCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/2.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTHPCourseListCell.h"

@interface HPCourseListScoreView: UIView
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *scoreLabel;
@end

@implementation HPCourseListScoreView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.imgIV];
        [self addSubview:self.titleLabel];
        [self addSubview:self.scoreLabel];
        [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20 *ScreenRatio_6, 20 *ScreenRatio_6));
            make.top.centerX.mas_equalTo(self);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.centerX.mas_equalTo(self);
            make.top.mas_equalTo(self.imgIV.mas_bottom).offset(7 *ScreenRatio_6);
        }];
        [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.centerX.mas_equalTo(self);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(7 *ScreenRatio_6);
        }];
    }
    return self;
}

- (void)setImage:(NSString *)img title:(NSString *)title score:(NSString *)score{
    self.imgIV.image = [UIImage imageNamed:img];
    self.titleLabel.text = title;
    self.scoreLabel.text = score;
}

- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [UIImageView new];
        _imgIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imgIV;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _titleLabel.textColor = UIColorHex(666666);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
- (UILabel *)scoreLabel{
    if (!_scoreLabel) {
        _scoreLabel = [UILabel new];
        _scoreLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _scoreLabel.textColor = UIColorHex(666666);
        _scoreLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _scoreLabel;
}
@end

@interface WLKTHPCourseListCell ()
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *schoolIV;
@property (strong, nonatomic) UILabel *schoolLabel;
@property (strong, nonatomic) HPCourseListScoreView *effect;
@property (strong, nonatomic) HPCourseListScoreView *teacher;
@property (strong, nonatomic) HPCourseListScoreView *environment;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *hitsLabel;
@property (strong, nonatomic) UIImageView *addressIV;
@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UIView *separatorView;
@property (strong, nonatomic) UIView *promotionBGView;
@property (strong, nonatomic) UILabel *promotionLabel_1;
@property (strong, nonatomic) UILabel *promotionLabel_2;
@property (strong, nonatomic) UILabel *promotionLabel_3;
@property (strong, nonatomic) UILabel *promotionStateLabel;

@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic) NSTimeInterval startTimeInterval;
@property (strong, nonatomic) NSMutableArray *youhuiViewsArr;
@end

@implementation WLKTHPCourseListCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.imgIV];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.schoolIV];
        [self.contentView addSubview:self.schoolLabel];
        [self.contentView addSubview:self.effect];
        [self.contentView addSubview:self.teacher];
        [self.contentView addSubview:self.environment];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.hitsLabel];
        [self.contentView addSubview:self.addressIV];
        [self.contentView addSubview:self.addressLabel];
        [self.contentView addSubview:self.separatorView];
        [self makeConstraints];
    }
    return self;
}

#pragma mark - action
- (NSString *)leftTimeWithString:(NSTimeInterval)timeIntrval{

    NSInteger ms = (NSInteger)timeIntrval % 1000 /100;
    NSInteger s = (NSInteger)timeIntrval /1000 %60;
    NSInteger m = (NSInteger)timeIntrval /1000 /60 %60;
    NSInteger h = (NSInteger)timeIntrval /1000 /3600 %24;
    
    NSString *sec = @"";
    if (s < 10) {
        sec = [NSString stringWithFormat:@"0%ld", s];
    }
    else{
        sec = [NSString stringWithFormat:@"%ld", s];
    }
    
    NSString *mm = @"";
    if (m < 10) {
        mm = [NSString stringWithFormat:@"0%ld", m];
    }
    else{
        mm = [NSString stringWithFormat:@"%ld", m];
    }
    
    NSString *hh = @"";
    if (h < 10) {
        hh = [NSString stringWithFormat:@"0%ld", h];
    }
    else{
        hh = [NSString stringWithFormat:@"%ld", h];
    }
    return [NSString stringWithFormat:@"%@:%@:%@:%ld", hh, mm, sec, ms];
    
}

- (NSString *)leftDayWithString:(NSTimeInterval)timeIntrval{
    NSString *days = timeIntrval/3600/24/1000 ? @"00" : [NSString stringWithFormat:@"%.0f", timeIntrval/3600/24/1000];
    return [NSString stringWithFormat:@"%@天", days];
    
}

#pragma mark -
- (void)setCellData:(WLKTCourse *)data date:(NSTimeInterval)date{
    self.startTimeInterval = date;
    self.addressLabel.text = data.distance;
    self.addressIV.hidden = data.distance ? false : YES;
    [self.imgIV setImageURL:[NSURL URLWithString:data.img]];

    self.titleLabel.text = data.coursename;
    self.schoolLabel.text = data.schoolname;
    self.hitsLabel.text = [NSString stringWithFormat:@"已有%ld人看过", data.hits];
    //////////////////////////
    if (data.effect.intValue >= 4) {
        self.effect.imgIV.image = [UIImage imageNamed:@"CourseList笑脸"];
    }
    if (data.effect.intValue >= 3 && data.effect.intValue < 4) {
        self.effect.imgIV.image = [UIImage imageNamed:@"CourseList脸"];
    }
    if (data.effect.intValue < 3) {
        self.effect.imgIV.image = [UIImage imageNamed:@"CourseList哭脸"];
    }
    /////////////////////////
    if (data.teach_score.intValue >= 4) {
        self.teacher.imgIV.image = [UIImage imageNamed:@"CourseList笑脸"];
    }
    if (data.teach_score.intValue >= 3 && data.teach_score.intValue < 4) {
        self.teacher.imgIV.image = [UIImage imageNamed:@"CourseList脸"];
    }
    if (data.teach_score.intValue < 3) {
        self.teacher.imgIV.image = [UIImage imageNamed:@"CourseList哭脸"];
    }
    /////////////////////////
    if (data.environment.intValue >= 4) {
        self.environment.imgIV.image = [UIImage imageNamed:@"CourseList笑脸"];
    }
    if (data.environment.intValue >= 3 && data.environment.intValue < 4) {
        self.environment.imgIV.image = [UIImage imageNamed:@"CourseList脸"];
    }
    if (data.environment.intValue < 3) {
        self.environment.imgIV.image = [UIImage imageNamed:@"CourseList哭脸"];
    }
    
    self.effect.scoreLabel.text = data.effect;
    self.teacher.scoreLabel.text = data.teach_score;
    self.environment.scoreLabel.text = data.environment;

    //
    if ([data.showprice isEqualToString:@"免费"]) {
        self.priceLabel.text = data.showprice;
    }
    else{
        self.priceLabel.text = [NSString stringWithFormat:@"%@", data.showprice];
    }
    //
    [self createYouhuiViews:data.youhui];
    
    //拼购
    if (data.have_pg.intValue == 1) {
        
        [self.timer invalidate];
        self.timer = nil;
        self.startTimeInterval = data.pg_microtime.integerValue - ([[NSDate date] timeIntervalSinceNow] - date);
        if (data.pg_status.intValue == 0) {//预热
            self.promotionLabel_1.text = [NSString stringWithFormat:@"预热 %@", [self leftDayWithString:self.startTimeInterval]];
            self.promotionLabel_2.text = [NSString stringWithFormat:@"%@", [self leftTimeWithString:self.startTimeInterval]];
            self.promotionLabel_3.text = @"后开启";
        }
        else{
            self.promotionLabel_1.text = [NSString stringWithFormat:@"拼购 %@", [self leftDayWithString:self.startTimeInterval]];
            self.promotionLabel_2.text = [NSString stringWithFormat:@"%@", [self leftTimeWithString:self.startTimeInterval]];
            self.promotionLabel_3.text = @"后结束";
        }

        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {

            NSString *time = [NSString stringWithFormat:@"%@", [self leftTimeWithString:self.startTimeInterval -= 100]];
            if (self.startTimeInterval >= 0) {
                self.promotionLabel_2.text = time;
            }
            
        }];
        
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        
        [self addPromotionViews];
        
        if (data.pg_status.intValue == 0) {
            NSString *s = data.pg_forcus.intValue ? @"已关注" : @"关注";
            self.promotionStateLabel.text = s;
            [self.contentView addSubview:self.promotionStateLabel];
            [self.promotionStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.height.mas_equalTo(self.promotionBGView);
                make.left.mas_equalTo(self.promotionBGView.mas_right);
                make.width.mas_equalTo([s getSizeWithHeight:17 *ScreenRatio_6 Font:13 *ScreenRatio_6].width);
            }];
            
        }
        else{
            self.promotionLabel_1.backgroundColor = kMainTextColor_red;
            self.promotionLabel_2.backgroundColor = kMainTextColor_red;
            self.promotionLabel_3.backgroundColor = kMainTextColor_red;
        }
        
    }
}

- (void)addPromotionViews{
    [self.contentView addSubview:self.promotionBGView];
    [self.promotionBGView addSubview:self.promotionLabel_1];
    [self.promotionBGView addSubview:self.promotionLabel_2];
    [self.promotionBGView addSubview:self.promotionLabel_3];

    [self.promotionBGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(165 *ScreenRatio_6, 18.5 *ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(self.youhuiViewsArr.count *23 *ScreenRatio_6 + 10 *ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
    }];
    [self.promotionLabel_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60 *ScreenRatio_6, 16.5 *ScreenRatio_6));
        make.centerY.mas_equalTo(self.promotionBGView);
        make.left.mas_equalTo(self.promotionBGView).offset(1);
    }];
    [self.promotionLabel_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.promotionLabel_1.mas_right).offset(-0.5);
        make.right.mas_equalTo(self.promotionLabel_3.mas_left).offset(0.5);
        make.height.centerY.mas_equalTo(self.promotionLabel_1);
    }];
    [self.promotionLabel_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(45 *ScreenRatio_6, 16.5 *ScreenRatio_6));
        make.centerY.right.mas_equalTo(self.promotionBGView);
    }];
    
    
    [self.imgIV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(45 *ScreenRatio_6);
    }];
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(35 *ScreenRatio_6);
    }];
    
}

- (void)createYouhuiViews:(NSArray *)array{
    if (!array.count) {
        return;
    }

    for (NSString *s in array) {
        if ([s isEqualToString:@"折"]) {
            UILabel *l = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 18.5 *ScreenRatio_6, 18.5 *ScreenRatio_6)];
            l.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
            l.textColor = UIColorHex(ffffff);
            l.textAlignment = NSTextAlignmentCenter;
            l.backgroundColor = kMainTextColor_red;
            l.text = s;
            [self.contentView addSubview:l];
            [self.youhuiViewsArr addObject:l];
        }
        if ([s isEqualToString:@"减"]) {
            UILabel *l = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 18.5 *ScreenRatio_6, 18.5 *ScreenRatio_6)];
            l.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
            l.textColor = UIColorHex(ffffff);
            l.backgroundColor = kMainTextColor_red;
            l.textAlignment = NSTextAlignmentCenter;
            l.text = s;
            [self.contentView addSubview:l];
            [self.youhuiViewsArr addObject:l];
        }
        if ([s isEqualToString:@"券"]) {
            UILabel *l = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 18.5 *ScreenRatio_6, 18.5 *ScreenRatio_6)];
            l.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
            l.textColor = UIColorHex(ffffff);
            l.backgroundColor = kMainTextColor_red;
            l.textAlignment = NSTextAlignmentCenter;
            l.text = s;
            [self.contentView addSubview:l];
            [self.youhuiViewsArr addObject:l];
        }
        
    }
    if (self.youhuiViewsArr.count > 1) {
        [self.youhuiViewsArr mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
            make.size.mas_equalTo(CGSizeMake(array.count *23 *ScreenRatio_6, 18.5 *ScreenRatio_6));
        }];
        [self.youhuiViewsArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 *ScreenRatio_6 leadSpacing:0 tailSpacing:0];
    }
    else{
        UILabel *l = self.youhuiViewsArr.firstObject;
        [l mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(18.5 *ScreenRatio_6, 18.5 *ScreenRatio_6));
            make.left.top.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        }];
    }
    
    [self.imgIV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(45 *ScreenRatio_6);
    }];
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(35 *ScreenRatio_6);
    }];
    
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.imgIV.image = nil;
    self.titleLabel.text = nil;
    self.schoolLabel.text = nil;
    self.effect.scoreLabel.text = nil;
    self.teacher.scoreLabel.text = nil;
    self.environment.scoreLabel.text = nil;
    self.priceLabel.text = nil;
    self.hitsLabel.text = nil;
    self.addressLabel.text = nil;
    self.promotionBGView = nil;
    self.promotionLabel_1 = nil;
    self.promotionLabel_2 = nil;
    self.promotionLabel_3 = nil;
    self.promotionStateLabel = nil;
    [self.timer invalidate];
    self.timer = nil;
    [self.youhuiViewsArr removeAllObjects];
}

- (void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark -
- (void)makeConstraints{
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140 *ScreenRatio_6, 90 *ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(15 *ScreenRatio_6);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 *ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
    }];
    [self.schoolIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(10 *ScreenRatio_6, 12 *ScreenRatio_6));
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10 *ScreenRatio_6);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 *ScreenRatio_6);
    }];
    [self.schoolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.schoolIV.mas_right).offset(5);
        make.centerY.mas_equalTo(self.schoolIV);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 *ScreenRatio_6);
    }];
    [self.effect mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(55 *ScreenRatio_6, 70 *ScreenRatio_6));
        make.top.mas_equalTo(self.schoolLabel.mas_bottom).offset(10 *ScreenRatio_6);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 *ScreenRatio_6);
    }];
    [self.teacher mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(55 *ScreenRatio_6, 70 *ScreenRatio_6));
        make.top.mas_equalTo(self.schoolLabel.mas_bottom).offset(10 *ScreenRatio_6);
        make.left.mas_equalTo(self.effect.mas_right).offset(10 *ScreenRatio_6);
    }];
    [self.environment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(55 *ScreenRatio_6, 70 *ScreenRatio_6));
        make.top.mas_equalTo(self.schoolLabel.mas_bottom).offset(10 *ScreenRatio_6);
        make.left.mas_equalTo(self.teacher.mas_right).offset(10 *ScreenRatio_6);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.effect.mas_bottom).offset(10 *ScreenRatio_6);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 *ScreenRatio_6);
        make.height.mas_equalTo(15 *ScreenRatio_6);
    }];
    [self.hitsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.priceLabel.mas_right).offset(10 *ScreenRatio_6);
        make.bottom.mas_equalTo(self.priceLabel);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 *ScreenRatio_6);
    }];
    [self.addressIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(7 *ScreenRatio_6, 11 *ScreenRatio_6));
        make.top.mas_equalTo(self.imgIV.mas_bottom).offset(15 *ScreenRatio_6);
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
    }];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.addressIV.mas_right).offset(5);
        make.centerY.mas_equalTo(self.addressIV);
        make.height.mas_equalTo(15 *ScreenRatio_6);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 10 *ScreenRatio_6));
        make.left.bottom.mas_equalTo(self.contentView);
    }];

}

#pragma mark - get
- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [UIImageView new];
        _imgIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imgIV;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        _titleLabel.textColor = KMainTextColor_3;
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}
- (UIImageView *)schoolIV{
    if (!_schoolIV) {
        _schoolIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"机构认证"]];
    }
    return _schoolIV;
}
- (UILabel *)schoolLabel{
    if (!_schoolLabel) {
        _schoolLabel = [UILabel new];
        _schoolLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _schoolLabel.textColor = UIColorHex(666666);
    }
    return _schoolLabel;
}
- (HPCourseListScoreView *)effect{
    if (!_effect) {
        _effect = [[HPCourseListScoreView alloc]init];
        _effect.titleLabel.text = @"效果";
        _effect.imgIV.image = [UIImage imageNamed:@"CourseList笑脸"];
    }
    return _effect;
}
- (HPCourseListScoreView *)teacher{
    if (!_teacher) {
        _teacher = [[HPCourseListScoreView alloc]init];
        _teacher.titleLabel.text = @"师资";
        _teacher.imgIV.image = [UIImage imageNamed:@"CourseList脸"];
    }
    return _teacher;
}
- (HPCourseListScoreView *)environment{
    if (!_environment) {
        _environment = [[HPCourseListScoreView alloc]init];
        _environment.titleLabel.text = @"环境";
        _environment.imgIV.image = [UIImage imageNamed:@"CourseList哭脸"];
    }
    return _environment;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:18 *ScreenRatio_6 weight:UIFontWeightSemibold];
        _priceLabel.textColor = kMainTextColor_red;
    }
    return _priceLabel;
}
- (UILabel *)hitsLabel{
    if (!_hitsLabel) {
        _hitsLabel = [UILabel new];
        _hitsLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _hitsLabel.textColor = KMainTextColor_9;
    }
    return _hitsLabel;
}
- (UIImageView *)addressIV{
    if (!_addressIV) {
        _addressIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"定位"]];
    }
    return _addressIV;
}
- (UILabel *)addressLabel{
    if (!_addressLabel) {
        _addressLabel = [UILabel new];
        _addressLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _addressLabel.textColor = KMainTextColor_9;
    }
    return _addressLabel;
}
- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = UIColorHex(eeeeee);
    }
    return _separatorView;
}
- (NSMutableArray *)youhuiViewsArr{
    if (!_youhuiViewsArr) {
        _youhuiViewsArr = [NSMutableArray arrayWithCapacity:3];
    }
    return _youhuiViewsArr;
}
- (UIView *)promotionBGView{
    if (!_promotionBGView) {
        _promotionBGView = [UIView new];
        _promotionBGView.backgroundColor = kMainTextColor_red;
    }
    return _promotionBGView;
}
- (UILabel *)promotionLabel_1{
    if (!_promotionLabel_1) {
        _promotionLabel_1 = [UILabel new];
        _promotionLabel_1.font = [UIFont fontWithName:@"Helvetica Neue" size:12 *ScreenRatio_6];
        _promotionLabel_1.textColor = UIColorHex(ffffff);
        _promotionLabel_1.backgroundColor = UIColorHex(e79096);
        _promotionLabel_1.textAlignment = NSTextAlignmentRight;
    }
    return _promotionLabel_1;
}
- (UILabel *)promotionLabel_2{
    if (!_promotionLabel_2) {
        _promotionLabel_2 = [UILabel new];
        _promotionLabel_2.font = [UIFont fontWithName:@"Helvetica Neue" size:12 *ScreenRatio_6];
        _promotionLabel_2.textColor = UIColorHex(ffffff);
        _promotionLabel_2.backgroundColor = UIColorHex(e79096);
        _promotionLabel_2.textAlignment = NSTextAlignmentLeft;
    }
    return _promotionLabel_2;
}
- (UILabel *)promotionLabel_3{
    if (!_promotionLabel_3) {
        _promotionLabel_3 = [UILabel new];
        _promotionLabel_3.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _promotionLabel_3.textColor = UIColorHex(ffffff);
        _promotionLabel_3.backgroundColor = UIColorHex(e79096);
        _promotionLabel_3.textAlignment = NSTextAlignmentLeft;
    }
    return _promotionLabel_3;
}
- (UILabel *)promotionStateLabel{
    if (!_promotionStateLabel) {
        _promotionStateLabel = [UILabel new];
        _promotionStateLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _promotionStateLabel.textColor = UIColorHex(ffffff);
        _promotionStateLabel.textAlignment = NSTextAlignmentCenter;
        _promotionStateLabel.backgroundColor = kMainTextColor_red;
    }
    return _promotionStateLabel;
}

@end

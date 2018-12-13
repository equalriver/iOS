//
//  WLKTCDSchoolCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/15.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDSchoolCell.h"

@interface WLKTCDSchoolCell ()
@property (strong, nonatomic) UIView *course;
@property (strong, nonatomic) UIView *activity;
@property (strong, nonatomic) UIView *attention;
@property (strong, nonatomic) UIView *score;
@end


@implementation WLKTCDSchoolCell
- (instancetype)initWithData:(WLKTCDSchinfo *)data
{
    self = [super init];
    if (self) {
        self.course = [self createItemViewWithCount:data.coursenum title:@"课程"];
        self.activity = [self createItemViewWithCount:data.actnum title:@"活动"];
        self.attention = [self createItemViewWithCount:data.shoucangnum title:@"关注"];
        self.score = [self createItemViewWithCount:data.pingfen title:@"评分"];
        [self.contentView addSubview:self.course];
        [self.contentView addSubview:self.activity];
        [self.contentView addSubview:self.attention];
        [self.contentView addSubview:self.score];
        [self makeConstraints];
        
    }
    return self;
}

- (UIView *)createItemViewWithCount:(NSString *)count title:(NSString *)title {
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor whiteColor];
    
    UILabel *num = [UILabel new];
    num.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
    num.textColor = KMainTextColor_3;
    num.text = count;
    num.textAlignment = NSTextAlignmentCenter;
    [v addSubview:num];
    [num mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.top.centerX.mas_equalTo(v);
        make.height.mas_equalTo(20 *ScreenRatio_6);
    }];
    
    UILabel *tt = [UILabel new];
    tt.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
    tt.textColor = KMainTextColor_9;
    tt.textAlignment = NSTextAlignmentCenter;
    tt.text = title;
    [v addSubview:tt];
    [tt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.height.mas_equalTo(num);
        make.top.mas_equalTo(num.mas_bottom).offset(10 *ScreenRatio_6);
    }];
    return v;
}

- (void)makeConstraints{
    [self.course mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80 *ScreenRatio_6, 40 *ScreenRatio_6));
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).offset(15 *ScreenRatio_6);
    }];
    [self.activity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80 *ScreenRatio_6, 40 *ScreenRatio_6));
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.course.mas_right).offset(10 *ScreenRatio_6);
    }];
    [self.attention mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80 *ScreenRatio_6, 40 *ScreenRatio_6));
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.activity.mas_right).offset(10 *ScreenRatio_6);
    }];
    [self.score mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80 *ScreenRatio_6, 40 *ScreenRatio_6));
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.attention.mas_right).offset(10 *ScreenRatio_6);
    }];
}

@end

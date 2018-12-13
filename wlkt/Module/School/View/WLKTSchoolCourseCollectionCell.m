//
//  WLKTSchoolCourseCollectionCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/23.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolCourseCollectionCell.h"

@interface WLKTSchoolCourseCollectionCell ()
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) UIImageView *lookTimeIV;
@property (strong, nonatomic) UILabel *lookTimeLabel;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *comment_saleCountLabel;
@end

@implementation WLKTSchoolCourseCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imgIV];
        [self.imgIV addSubview:self.lookTimeIV];
        [self.imgIV addSubview:self.lookTimeLabel];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.comment_saleCountLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellData:(WLKTCourseDetailNewAbout_list *)data{
    [self.imgIV setImageURL:[NSURL URLWithString:data.img]];
    self.titleLabel.text = data.coursename;
    self.priceLabel.text = [NSString stringWithFormat:@"%@", data.showprice];
    self.comment_saleCountLabel.text = [NSString stringWithFormat:@"收藏%@", data.shoucang];
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.imgIV.image = nil;
    self.lookTimeLabel.text = nil;
    self.titleLabel.text = nil;
    self.priceLabel.text = nil;
    self.comment_saleCountLabel.text = nil;
}

- (void)makeConstraints{
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(170 * ScreenRatio_6, 100 * ScreenRatio_6));
        make.top.mas_equalTo(self.contentView);
    }];
    [self.lookTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.imgIV.mas_right).offset(-5);
        make.bottom.mas_equalTo(self.imgIV.mas_bottom).offset(-5);
    }];
    [self.lookTimeIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.lookTimeLabel.mas_left).offset(-2.5);
        make.centerY.mas_equalTo(self.lookTimeLabel);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.imgIV.mas_bottom).offset(8);
        make.right.mas_equalTo(self.contentView.mas_right);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10 * ScreenRatio_6);
    }];
    [self.comment_saleCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right);
        make.bottom.mas_equalTo(self.priceLabel.mas_bottom);
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
- (UIImageView *)lookTimeIV{
    if (!_lookTimeIV) {
        _lookTimeIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"预览b"]];
    }
    return _lookTimeIV;
}
- (UILabel *)lookTimeLabel{
    if (!_lookTimeLabel) {
        _lookTimeLabel = [UILabel new];
        _lookTimeLabel.textColor = UIColorHex(ffffff);
        _lookTimeLabel.font = [UIFont systemFontOfSize:10 * ScreenRatio_6];
    }
    return _lookTimeLabel;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _titleLabel.textColor = KMainTextColor_3;
        _titleLabel.numberOfLines = 1;
    }
    return _titleLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _priceLabel.textColor = UIColorHex(e43b3b);
    }
    return _priceLabel;
}
- (UILabel *)comment_saleCountLabel{
    if (!_comment_saleCountLabel) {
        _comment_saleCountLabel = [UILabel new];
        _comment_saleCountLabel.font = [UIFont systemFontOfSize:10 * ScreenRatio_6];
        _comment_saleCountLabel.textColor = KMainTextColor_9;
        _comment_saleCountLabel.textAlignment = NSTextAlignmentRight;
    }
    return _comment_saleCountLabel;
}

@end

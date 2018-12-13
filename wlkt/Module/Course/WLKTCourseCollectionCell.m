//
//  WLKTCourseCollectionCell.m
//  wlkt
//
//  Created by slovelys on 17/3/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseCollectionCell.h"
#import <NSAttributedString+YYText.h>


@interface WLKTCourseCollectionCell ()
@property (strong, nonatomic) UIView *imageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *rawPriceLabel;
@property (strong, nonatomic) UILabel *courseTypeLabel;
@property (strong, nonatomic) UIView *tagBgView;
@property (strong, nonatomic) UIView *rawPriceLine;

@property (strong, nonatomic) WLKTCourse *courseData;
@end

@implementation WLKTCourseCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.rawPriceLabel];
        [self.rawPriceLabel addSubview:self.rawPriceLine];
        [self.contentView addSubview:self.courseTypeLabel];
        [self.contentView addSubview:self.tagBgView];
        [self.contentView addSubview:self.titleLabel];
        [self makeContraints];
    }
    return self;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)updateConstraints{
    if (self.courseData.youhui.count > 0) {
        [self.tagBgView removeAllSubviews];
        [self.courseData.youhui enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UILabel *l = [UILabel itemLabelWithText:[NSString stringWithFormat:@"%@", obj]];
            [self.tagBgView addSubview:l];
            [l mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(12, 12));
                make.left.mas_equalTo(self.tagBgView).offset(idx * 13);
                make.centerY.mas_equalTo(self.tagBgView);
            }];
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.contentView).offset((idx + 1) * 13 + 4);
                make.size.mas_equalTo(CGSizeMake(168 * ScreenRatio_6 - (idx + 1) * 12, 15));
                make.top.mas_equalTo(self.imageView.mas_bottom).offset(7);
            }];
        }];
    }

    [super updateConstraints];
}

- (void)setCourse:(WLKTCourse *)course {
    WS(weakSelf);
    _courseData = course;
    [self.imageView.layer setImageWithURL:[NSURL URLWithString:course.img] placeholder:kPlaceholderNormalDefault options:YYWebImageOptionSetImageWithFadeAnimation completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        if (error) {
            weakSelf.imageView.layer.contents = (__bridge id)kPlaceholderNormalFailed.CGImage;
        }
    }];
    self.titleLabel.text = course.coursename;
    self.priceLabel.text = course.showprice;
    self.courseTypeLabel.text = course.target;
    
    if (course.oldprice && ![course.oldprice containsString:@"null"] && course.oldprice.length > 0) {
        self.rawPriceLabel.text = course.oldprice;
        [self.rawPriceLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake([course.oldprice getSizeWithHeight:15 Font:11].width - 5, 1));
            make.centerY.mas_equalTo(self.rawPriceLabel);
            make.left.mas_equalTo(self.rawPriceLabel).offset(2);
        }];
    }
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
}

#pragma mark - make contraints
- (void)makeContraints{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(168 * ScreenRatio_6, 90 * ScreenRatio_6));
        make.top.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(7);
        make.left.mas_equalTo(self.contentView);
    }];
    [self.rawPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.priceLabel.mas_right).offset(2);
        make.centerY.mas_equalTo(self.priceLabel);
    }];
    [self.courseTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(33, 15));
        make.right.mas_equalTo(self.contentView.mas_right);
        make.centerY.mas_equalTo(self.priceLabel);
    }];
    [self.tagBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(168 * ScreenRatio_6, 15));
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(7);
        make.left.mas_equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(168 * ScreenRatio_6, 15));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(7);
    }];
}

#pragma mark - get
- (UIView *)imageView{
    if (!_imageView) {
        _imageView = [[UIView alloc]init];
        _imageView.userInteractionEnabled = YES;
        _imageView.backgroundColor = [UIColor whiteColor];
    }
    return _imageView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#4d4d4d"];
    }
    return _titleLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:12];
        _priceLabel.textColor = UIColorHex(ee402d);
    }
    return _priceLabel;
}
- (UILabel *)rawPriceLabel{
    if (!_rawPriceLabel) {
        _rawPriceLabel = [[UILabel alloc]init];
        _rawPriceLabel.font = [UIFont systemFontOfSize:10];
        _rawPriceLabel.textColor = UIColorHex(c0c0c0);
    }
    return _rawPriceLabel;
}
- (UIView *)rawPriceLine{
    if (!_rawPriceLine) {
        _rawPriceLine = [UIView new];
        _rawPriceLine.backgroundColor = UIColorHex(c0c0c0);
    }
    return _rawPriceLine;
}
- (UILabel *)courseTypeLabel{
    if (!_courseTypeLabel) {
        _courseTypeLabel = [[UILabel alloc]init];
        _courseTypeLabel.font = [UIFont systemFontOfSize:10];
        _courseTypeLabel.textColor = UIColorHex(c0c0c0);
        _courseTypeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _courseTypeLabel;
}
- (UIView *)tagBgView{
    if (!_tagBgView) {
        _tagBgView = [UIView new];
        _tagBgView.backgroundColor = [UIColor whiteColor];
    }
    return _tagBgView;
}

@end

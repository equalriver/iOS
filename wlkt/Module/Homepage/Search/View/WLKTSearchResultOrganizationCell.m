//
//  WLKTSearchResultOrganizationCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSearchResultOrganizationCell.h"

@interface WLKTSearchResultOrganizationCell ()
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *tagLabel;
@property (strong, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) UIView *separatorView;

@end

@implementation WLKTSearchResultOrganizationCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.tagLabel];
        [self.contentView addSubview:self.detailLabel];
        [self.contentView addSubview:self.separatorView];
        [self makeConstraints];
    }
    return self;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.titleLabel.text = nil;
    self.detailLabel.text = nil;
}

- (void)setCellData:(WLKTSearchOrganizationData *)data{
    if (data) {
        self.titleLabel.text = data.schoolname;
        self.detailLabel.text = data.introduce;
        [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([data.introduce getSizeWithWidth:ScreenWidth - 30 * ScreenRatio_6 Font:13]);
        }];
    }

}

- (void)makeConstraints{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(20);
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
    }];
    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 15));
        make.left.mas_equalTo(self.titleLabel.mas_right).offset(5);
        make.centerY.mas_equalTo(self.titleLabel);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth - 30 * ScreenRatio_6, 15));
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.left.mas_equalTo(self.contentView);
    }];
}

#pragma mark - get
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}
- (UILabel *)tagLabel{
    if (!_tagLabel) {
        _tagLabel = [UILabel new];
        _tagLabel.font = [UIFont systemFontOfSize:9];
        _tagLabel.textColor = UIColorHex(33c4da);
        _tagLabel.layer.borderColor = UIColorHex(33c4da).CGColor;
        _tagLabel.layer.borderWidth = 0.5;
        _tagLabel.text = @"认证";
        _tagLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _tagLabel;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.textColor = KMainTextColor_3;
        _detailLabel.numberOfLines = 2;
    }
    return _detailLabel;
}
- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}
@end
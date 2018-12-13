//
//  WLKTLiveVideoCell.m
//  wlkt
//
//  Created by 尹平江 on 2018/4/26.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTLiveVideoCell.h"
@interface WLKTLiveVideoCell ()
@property (strong, nonatomic) UIButton *countBtn;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UIImageView *imgIV;
@end

@implementation WLKTLiveVideoCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.imgIV];
        [self.contentView addSubview:self.countBtn];
        [self.contentView addSubview:self.nameLabel];
        [self makeConstraints];
        
    }
    return self;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    [self.countBtn setTitle:nil forState:UIControlStateNormal];
    self.nameLabel.text = nil;
    self.imgIV.image = nil;
}

- (void)setData:(WLKTLiveVideoListData *)data{
    _data = data;
    [self.imgIV setImageURL:[NSURL URLWithString:data.img]];
//    [self.imgIV setImageWithURL:[NSURL URLWithString:data.img] placeholder:[UIImage imageNamed:@"无课程"]];
    self.nameLabel.text = data.title;
}

- (void)makeConstraints{
    [self.countBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(15 *ScreenRatio_6);
        make.height.mas_equalTo(30 *ScreenRatio_6);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).offset(-10 *ScreenRatio_6);
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
    }];
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerX.centerY.mas_equalTo(self.contentView);
    }];
}

#pragma mark - get
- (UIButton *)countBtn{
    if (!_countBtn) {
        _countBtn = [UIButton new];
        _countBtn.titleLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        [_countBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _countBtn.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.3];
        _countBtn.layer.masksToBounds = YES;
        _countBtn.layer.cornerRadius = 15 *ScreenRatio_6;
    }
    return _countBtn;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:17 *ScreenRatio_6 weight:UIFontWeightSemibold];
        _nameLabel.textColor = [UIColor whiteColor];
    }
    return _nameLabel;
}
- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [UIImageView new];
//        _imgIV.contentMode = UIViewContentModeScaleAspectFill;
//        _imgIV.layer.masksToBounds = YES;
    }
    return _imgIV;
}
@end

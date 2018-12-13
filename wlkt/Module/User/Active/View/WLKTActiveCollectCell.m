//
//  WLKTActiveCollectCell.m
//  wlkt
//
//  Created by 尹平江 on 2017/7/10.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActiveCollectCell.h"


@implementation WLKTActiveCollectCell

#pragma mark - init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.imgIV];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.locationLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.separatorView];
        
    }
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    return self;
}

#pragma mark - updateConstraints

- (void)updateConstraints{
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(115 * ScreenRatio_6, 85 * ScreenRatio_6));
        make.top.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(225 * ScreenRatio_6, 20 * ScreenRatio_6));
        make.top.mas_equalTo(self.imgIV);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 * ScreenRatio_6);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(225 * ScreenRatio_6, 20 * ScreenRatio_6));
        make.top.mas_equalTo(self.titleLabel.mas_bottom);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 * ScreenRatio_6);
    }];
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(225 * ScreenRatio_6, 20 * ScreenRatio_6));
        make.top.mas_equalTo(self.timeLabel.mas_bottom);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 * ScreenRatio_6);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(125 * ScreenRatio_6, 25 * ScreenRatio_6));
        make.top.mas_equalTo(self.locationLabel.mas_bottom).offset(10 * ScreenRatio_6);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10 * ScreenRatio_6);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 1));
        make.left.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
    [super updateConstraints];
}

#pragma mark - set data
- (void)setCellContent:(WLKTActiveCollectData *)data{
    if (data) {
        [self.imgIV setImageURL:[NSURL URLWithString:data.img]];
        self.titleLabel.text = data.title;
        self.timeLabel.text = [NSString stringWithFormat:@"时间：%@", data.asctime];
        self.locationLabel.text = [NSString stringWithFormat:@"地点：%@", data.shortaddress];
        if (data.feesxz.intValue == 0) {
            self.priceLabel.text = @"免费";
        }
        else{
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@元", data.price]];
            [str setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#ff5a4a"], NSFontAttributeName : [UIFont systemFontOfSize:11]} range:NSMakeRange(str.length - 1, 1)];
            [str setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#ff5a4a"], NSFontAttributeName : [UIFont systemFontOfSize:16]} range:NSMakeRange(0, str.length - 1)];
            self.priceLabel.attributedText = str;
        }
    }
}

#pragma mark - reuse
- (void)prepareForReuse{
    [super prepareForReuse];
    self.imgIV.image = nil;
    self.titleLabel.text = nil;
    self.timeLabel.text = nil;
    self.locationLabel.text = nil;
    self.priceLabel.text = nil;
}

#pragma mark - lazy load
- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [[UIImageView alloc] init];
        
    }
    return _imgIV;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        
    }
    return _titleLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        _timeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _timeLabel;
}

- (UILabel *)locationLabel{
    if (!_locationLabel) {
        _locationLabel = [[UILabel alloc] init];
        _locationLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        _locationLabel.font = [UIFont systemFontOfSize:12];
    }
    return _locationLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textColor = [UIColor colorWithHexString:@"#ff5a4a"];
        _priceLabel.font = [UIFont systemFontOfSize:16];
    }
    return _priceLabel;
}

- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}

@end

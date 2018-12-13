//
//  WLKTMyCourseCollectCell.m
//  wlkt
//
//  Created by 尹平江 on 2017/8/10.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTMyCourseCollectCell.h"

@implementation WLKTMyCourseCollectCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:
        reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.imgIV];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.currentPriceLabel];
        [self.contentView addSubview:self.priceTypeLabel];
        [self.contentView addSubview:self.rawPriceLabel];
        [self.contentView addSubview:self.separatorView];
        [self makeConstraints];
    }
    
    return self;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.imgIV.image = nil;
    self.titleLabel.text = nil;
    self.currentPriceLabel.text = nil;
    self.priceTypeLabel.text = nil;
    self.rawPriceLabel.attributedText = nil;
}

- (void)setCellData:(WLKTMyCourseCollectData *)data{
    [self.imgIV setImageURL:[NSURL URLWithString:data.img]];
    self.titleLabel.text = data.coursename;
    self.currentPriceLabel.text = data.showprice;
    self.priceTypeLabel.text = data.target;
    if (data.oldprice && ![data.oldprice containsString:@"null"]) {
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc]initWithString:data.oldprice];
        [attStr setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13], NSStrikethroughStyleAttributeName : @(NSUnderlinePatternSolid | NSUnderlineStyleSingle)} range:NSMakeRange(0, data.oldprice.length)];

        self.rawPriceLabel.attributedText = attStr;
    }
    if (data.youhui.count > 0) {
        [data.youhui enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UILabel *l = [UILabel itemLabelWithText:[NSString stringWithFormat:@"%@", obj]];
            [self.contentView addSubview:l];
            [l mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(12, 12));
                make.left.mas_equalTo(self.imgIV.mas_right).offset(data.youhui.count == 1 ? 10 : 10 + idx *15);
                make.top.mas_equalTo(self.imgIV);
            }];
            [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.imgIV.mas_right).offset(data.youhui.count * 25);
            }];
        }];
    }
}

- (NSMutableArray<UILabel *> *)createTitleItemLabel:(NSArray *)indexs{
    NSMutableArray<UILabel *> *arr = [NSMutableArray arrayWithCapacity:indexs.count];
    for (NSString *item in indexs) {
        UILabel *l = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 13, 13)];
        l.textColor = kMainTextColor_red;
        l.textAlignment = NSTextAlignmentCenter;
        l.layer.borderWidth = 0.5;
        l.layer.borderColor = kMainTextColor_red.CGColor;
        l.layer.cornerRadius = 1;
        l.layer.masksToBounds = YES;
        l.text = item;
        [arr addObject:l];
    }
    
    return arr;
}

#pragma mark - constraint
- (void)makeConstraints{
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 65));
        make.top.mas_equalTo(self.contentView).offset(13);
        make.left.mas_equalTo(self.contentView).offset(15);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10);
        make.top.mas_equalTo(self.imgIV);
    }];
    [self.currentPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(15);
        make.left.mas_equalTo(self.priceTypeLabel.mas_right).offset(10);
    }];
    [self.priceTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35, 15));
        make.centerY.mas_equalTo(self.currentPriceLabel);
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10);
    }];
    [self.rawPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgIV.mas_right).offset(10);
        make.top.mas_equalTo(self.currentPriceLabel.mas_bottom).offset(6);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.left.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
}

#pragma mark - get
- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [[UIImageView alloc]init];
    }
    return _imgIV;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = KMainTextColor_3;
    }
    return _titleLabel;
}
- (UILabel *)currentPriceLabel{
    if (!_currentPriceLabel) {
        _currentPriceLabel = [[UILabel alloc]init];
        _currentPriceLabel.font = [UIFont systemFontOfSize:15];
        _currentPriceLabel.textColor = [UIColor colorWithHexString:@"#ee402d"];
    }
    return _currentPriceLabel;
}
- (UILabel *)priceTypeLabel{
    if (!_priceTypeLabel) {
        _priceTypeLabel = [[UILabel alloc]init];
        _priceTypeLabel.font = [UIFont systemFontOfSize:9];
        _priceTypeLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        _priceTypeLabel.backgroundColor = separatorView_color;
        _priceTypeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _priceTypeLabel;
}
- (UILabel *)rawPriceLabel{
    if (!_rawPriceLabel) {
        _rawPriceLabel = [[UILabel alloc]init];

    }
    return _rawPriceLabel;
}
- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [[UIView alloc]init];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}

@end

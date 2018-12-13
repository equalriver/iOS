//
//  WLKTPasswordChangeCell.m
//  wlkt
//
//  Created by 尹平江 on 17/3/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTPasswordChangeCell.h"

@implementation WLKTPasswordChangeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.headLabel];
        [self.contentView addSubview:self.psdTextField];
        
    }
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    return self;
}

#pragma mark - updateConstraints
- (void)updateConstraints{
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth / 3, self.contentView.height));
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
    }];
    [self.psdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth * 0.6, self.contentView.height));
        make.left.mas_equalTo(self.headLabel.mas_right).offset(5 * ScreenRatio_6);
    }];

    [super updateConstraints];
}

#pragma mark - get
- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.textColor = userLabelColor;
        _headLabel.font = [UIFont systemFontOfSize:16 * ScreenRatio_6];
    }
    return _headLabel;
}
- (UITextField *)psdTextField{
    if (!_psdTextField) {
        _psdTextField = [[UITextField alloc]init];
        _psdTextField.font = [UIFont systemFontOfSize:16 * ScreenRatio_6];
    }
    return _psdTextField;
}

@end

//
//  WLKTPsdCheckView.m
//  wlkt
//
//  Created by 尹平江 on 17/3/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTPsdCheckView.h"

@implementation WLKTPsdCheckView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.iconIV];
        [self addSubview:self.warningLabel];
        [self addSubview:self.separatorView_one];
        [self addSubview:self.commitButton];
        self.backgroundColor = [UIColor clearColor];
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30 , 30 ));
            make.left.mas_equalTo(self).offset(self.width / 2 - 27 );
            make.top.mas_equalTo(self.top).offset(10 );
        }];
        [self.warningLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.width - 30 , 25 ));
            make.centerX.mas_equalTo(self.iconIV);
            make.top.mas_equalTo(self.iconIV.mas_bottom).offset(10 );
        }];
        [self.separatorView_one mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.width, 1));
            make.top.mas_equalTo(self.warningLabel.mas_bottom).offset(5 );
        }];
        [self.commitButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(80 , 25 ));
            make.top.mas_equalTo(self.separatorView_one.mas_bottom).offset(8 );
            make.centerX.mas_equalTo(self.iconIV);
        }];
    }
    return self;
}
#pragma mark - get

- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc]init];
    }
    return _iconIV;
}

- (UILabel *)warningLabel{
    if (!_warningLabel) {
        _warningLabel = [[UILabel alloc]init];
        _warningLabel.textColor = [UIColor whiteColor];
        _warningLabel.font = [UIFont systemFontOfSize:15 * ScreenRatio_6];
        _warningLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _warningLabel;
}

- (UIButton *)commitButton{
    if (!_commitButton) {
        _commitButton = [[UIButton alloc]init];
        [_commitButton setTitle:@"我知道了" forState:UIControlStateNormal];
        [_commitButton setTitleColor:[UIColor colorWithRed:0 green:153/255.0 blue:241/255.0 alpha:1.0] forState:UIControlStateNormal];
    }
    return _commitButton;
}

- (UIView *)separatorView_one{
    if (!_separatorView_one) {
        _separatorView_one = [[UIView alloc]init];
        _separatorView_one.backgroundColor = separatorView_color;
    }
    return _separatorView_one;
}

@end

//
//  WLKTDiscardChangeView.m
//  wlkt
//
//  Created by 尹平江 on 17/3/28.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTDiscardChangeView.h"

@implementation WLKTDiscardChangeView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.iconIV];
        [self addSubview:self.warningLabel];
        [self addSubview:self.separatorView_one];
        [self addSubview:self.separatorView_two];
        [self addSubview:self.commitChangeBtn];
        [self addSubview:self.discardBtn];
        
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
        [self.separatorView_two mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(1, 40 ));
            make.centerX.mas_equalTo(self.iconIV);
            make.bottom.mas_equalTo(self.mas_bottom).offset(10 );
        }];
        [self.commitChangeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.width /2 - 40 , 25 ));
            make.top.mas_equalTo(self.separatorView_one.mas_bottom).offset(5 );
            make.right.mas_equalTo(self.separatorView_two).offset(-20 );
        }];
        [self.discardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.width /2 - 40 , 25 ));
            make.top.mas_equalTo(self.separatorView_one.mas_bottom).offset(5 );
            make.left.mas_equalTo(self.separatorView_two.mas_right).offset(20 );
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
        _warningLabel.textColor = [UIColor blackColor];
        _warningLabel.font = [UIFont systemFontOfSize:16 * ScreenRatio_6];
        _warningLabel.textAlignment = NSTextAlignmentCenter;
        _warningLabel.text = @"您是否要放弃修改密码?";
    }
    return _warningLabel;
}

- (UIView *)separatorView_one{
    if (!_separatorView_one) {
        _separatorView_one = [[UIView alloc]init];
        _separatorView_one.backgroundColor = separatorView_color;
    }
    return _separatorView_one;
}
- (UIView *)separatorView_two{
    if (!_separatorView_two) {
        _separatorView_two = [[UIView alloc]init];
        _separatorView_two.backgroundColor = separatorView_color;
    }
    return _separatorView_two;
}
- (UIButton *)commitChangeBtn{
    if (!_commitChangeBtn) {
        _commitChangeBtn = [[UIButton alloc]init];
        [_commitChangeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_commitChangeBtn setTitle:@"是" forState:UIControlStateNormal];
        _commitChangeBtn.titleLabel.font = [UIFont systemFontOfSize:16 * ScreenRatio_6];
    }
    return _commitChangeBtn;
}
- (UIButton *)discardBtn{
    if (!_discardBtn) {
        _discardBtn = [[UIButton alloc]init];
        [_discardBtn setTitle:@"否" forState:UIControlStateNormal];
        [_discardBtn setTitleColor:[UIColor colorWithRed:0 green:200/255.0 blue:224/255.0 alpha:1.0] forState:UIControlStateNormal];
        _discardBtn.titleLabel.font = [UIFont systemFontOfSize:16 * ScreenRatio_6];
    }
    return _discardBtn;
}

@end

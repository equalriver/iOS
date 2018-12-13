//
//  WLKTMyCouponBottomView.m
//  wlkt
//
//  Created by 尹平江 on 2017/8/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTMyCouponBottomView.h"

@implementation WLKTMyCouponBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.selectedAllBtn];
        [self addSubview:self.cancelBtn];
        [self addSubview:self.deleteButton];
        [self makeConstraints];
    }
    return self;
}

- (void)makeConstraints{
    [self.selectedAllBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.centerY.mas_equalTo(self);
    }];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140 * ScreenRatio_6, 45));
        make.right.mas_equalTo(self.mas_right);
        make.centerY.mas_equalTo(self);
    }];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(self.deleteButton.mas_left).offset(-24);
    }];
}

#pragma mark - get
- (UIButton *)selectedAllBtn{
    if (!_selectedAllBtn) {
        _selectedAllBtn = [[UIButton alloc]init];
        [_selectedAllBtn setImage:[UIImage imageNamed:@"7 勾选"] forState:UIControlStateSelected];
        [_selectedAllBtn setImage:[UIImage imageNamed:@"6 选择"] forState:UIControlStateNormal];
        [_selectedAllBtn setTitle:@"  全选" forState:UIControlStateNormal];
        [_selectedAllBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        _selectedAllBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _selectedAllBtn;
}
- (UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc]init];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _cancelBtn;
}
- (UIButton *)deleteButton{
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc]init];
        [_deleteButton setTitle:@"批量删除" forState:UIControlStateNormal];
        [_deleteButton setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _deleteButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _deleteButton.backgroundColor = [UIColor colorWithHexString:@"#33c4da"];
    }
    return _deleteButton;
}

@end

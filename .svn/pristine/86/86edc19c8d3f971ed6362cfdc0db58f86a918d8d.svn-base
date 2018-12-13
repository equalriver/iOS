//
//  WLKTJoinPickerView.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTJoinPickerView.h"

@interface WLKTJoinPickerView()
@property (strong, nonatomic) UIButton *cancelBtn;
@property (strong, nonatomic) UIButton *confirmBtn;
@property (strong, nonatomic) UIView *contentView;
@end

@implementation WLKTJoinPickerView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.7];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            [self removeFromSuperview];
        }];
        [self addGestureRecognizer:tap];
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.pickView];
        [self.contentView addSubview:self.cancelBtn];
        [self.contentView addSubview:self.confirmBtn];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.width.left.mas_equalTo(self);
            make.height.mas_equalTo(250);
        }];
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(self.contentView).offset(10);
            make.height.mas_equalTo(25);
        }];
        [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
            make.top.mas_equalTo(self.contentView).offset(10);
            make.height.mas_equalTo(25);
        }];
        [self.pickView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cancelBtn.mas_bottom);
            make.width.left.mas_equalTo(self.contentView);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
        }];
        [UIView animateWithDuration:0.5 animations:^{
            [self.contentView setCenterY:self.contentView.centerY - CGRectGetHeight(frame)];
        }];
    }
    return self;
}
- (void)pickerViewAct:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(didSelectedActionButtonWithType:)]) {
        [self.delegate didSelectedActionButtonWithType:sender.tag];
    }
}

- (void)removeFromSuperview{
    [UIView animateWithDuration:0.5 animations:^{
        [self.contentView setCenterY:self.centerY + CGRectGetHeight(self.frame)];
    } completion:^(BOOL finished) {
        [super removeFromSuperview];
    }];
}

#pragma mark - get
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}
-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [UIButton new];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor colorWithRed:30/255.0 green:160/255.0 blue:230/255.0 alpha:1.0] forState:UIControlStateNormal];
        _cancelBtn.tag = PickerViewActionTypeCancel;
        [_cancelBtn addTarget:self action:@selector(pickerViewAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}
-(UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton new];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor colorWithRed:30/255.0 green:160/255.0 blue:230/255.0 alpha:1.0] forState:UIControlStateNormal];
        _confirmBtn.tag = PickerViewActionTypeDefault;
        [_confirmBtn addTarget:self action:@selector(pickerViewAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}
- (UIPickerView *)pickView{
    if (!_pickView) {
        _pickView = [[UIPickerView alloc]init];
        _pickView.backgroundColor = [UIColor whiteColor];
    }
    return _pickView;
}
@end

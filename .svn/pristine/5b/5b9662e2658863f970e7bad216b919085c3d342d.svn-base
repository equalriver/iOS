//
//  WLKTHomepageNavigationButton.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/24.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTHomepageNavigationButton.h"

@implementation WLKTHomepageNavigationButton
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        self.detailLabel.text = title;
        [self addSubview:self.detailLabel];
//        [self addSubview:self.selectedView];
        
//        [self.selectedView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(30 *ScreenRatio_6, 3));
//            make.bottom.centerX.mas_equalTo(self);
//        }];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.width.mas_equalTo(self);
            make.height.mas_equalTo(25);
            make.bottom.mas_equalTo(self.mas_bottom).offset(-5);
        }];
        
    }
    return self;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.font = [UIFont systemFontOfSize:18 *ScreenRatio_6 weight:UIFontWeightSemibold];
        _detailLabel.textColor = KMainTextColor_3;
        _detailLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailLabel;
}
- (UIView *)selectedView{
    if (!_selectedView) {
        _selectedView = [UIView new];
        _selectedView.backgroundColor = KMainTextColor_3;
        _selectedView.hidden = YES;
    }
    return _selectedView;
}

@end

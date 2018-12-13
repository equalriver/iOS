//
//  WLKTSectionHeaderView.m
//  wlkt
//
//  Created by slovelys on 17/3/30.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSectionHeaderView.h"
#import "WLKTExchangeButton.h"

@implementation WLKTSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title isNeedMoreButton:(BOOL)isNeedMoreButton {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColorHex(fafafa);
        
        UILabel *blue = [[UILabel alloc] init];
        blue.backgroundColor = kNavBarBackgroundColor;
        [self addSubview:blue];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = title;
        titleLabel.textColor = UIColorHex(666666);
        titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:titleLabel];
        
        if (isNeedMoreButton) {
            WLKTExchangeButton *more = [WLKTExchangeButton buttonWithType:UIButtonTypeCustom];
            [more setTitle:@"更多 " forState:UIControlStateNormal];
            [more setImage:[UIImage imageNamed:@"箭头右"] forState:UIControlStateNormal];
            more.titleLabel.font = [UIFont systemFontOfSize:14];
            [more setTitleColor:UIColorHex(666666) forState:UIControlStateNormal];
            [more addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
                if (self.tap) {
                    self.tap(title);
                }
            }];
            [self addSubview:more];
            
            [more mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.right).offset(-CGFloatFromPixel(30));
                make.centerY.mas_equalTo(self);
            }];
        }
        
        
        [blue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(self);
            make.width.mas_equalTo(CGFloatFromPixel(8));
        }];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(blue).offset(10);
            make.centerY.mas_equalTo(self);
        }];
        
        
    }
    return self;
}

@end

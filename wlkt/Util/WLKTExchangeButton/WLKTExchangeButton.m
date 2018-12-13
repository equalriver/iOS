//
//  WLKTExchangeButton.m
//  wlkt
//
//  Created by slovelys on 17/4/19.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTExchangeButton.h"

@implementation WLKTExchangeButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0, self.titleLabel.frame.size.width, 0, -self.titleLabel.frame.size.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.frame.size.width, 0, self.imageView.frame.size.width);
    
    [self layoutIfNeeded];
}

@end

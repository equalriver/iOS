//
//  WLKTSelectButton.m
//  wlkt
//
//  Created by slovelys on 17/4/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSelectButton.h"

@implementation WLKTSelectButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageEdgeInsets = UIEdgeInsetsMake(-self.titleLabel.frame.size.height / 2, self.titleLabel.frame.size.width / 2, self.titleLabel.frame.size.height / 2, -self.titleLabel.frame.size.width / 2);
    self.titleEdgeInsets = UIEdgeInsetsMake(self.titleLabel.frame.size.height / 2 + 8, -self.imageView.frame.size.width / 2, -self.titleLabel.frame.size.height / 2 - 8, self.imageView.frame.size.width / 2);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:10];
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 0.5;
    
    [self layoutIfNeeded];
}

@end

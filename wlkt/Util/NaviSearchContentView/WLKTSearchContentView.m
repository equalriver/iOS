//
//  WLKTSearchContentView.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSearchContentView.h"
@interface WLKTSearchContentView ()
@property (strong, nonatomic) UISearchBar *searchBar;

@end

@implementation WLKTSearchContentView
- (instancetype)initWithFrame:(CGRect)frame searchBar:(UISearchBar *)searchBar
{
    self = [super initWithFrame:frame];
    if (self) {
        _searchBar = searchBar;
    }
    return self;
}

- (void)resetSearchBar
{
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.searchBar];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(self.frame.size);
        make.left.mas_equalTo(self);
    }];
}

- (CGSize)intrinsicContentSize{
    [super intrinsicContentSize];
    return UILayoutFittingExpandedSize;
}

@end

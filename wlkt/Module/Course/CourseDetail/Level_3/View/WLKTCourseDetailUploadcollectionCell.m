//
//  WLKTCourseDetailUploadcollectionCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/3.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailUploadcollectionCell.h"

@implementation WLKTCourseDetailUploadcollectionCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imagev];
        [self addSubview:self.deleteButton];
    }
    return self;
}

- (UIImageView *)imagev{
    if (!_imagev) {
        self.imagev = [[UIImageView alloc] initWithFrame:self.bounds];
    }
    return _imagev;
}
- (UIButton *)deleteButton{
    if (!_deleteButton) {
        self.deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteButton.frame = CGRectMake(CGRectGetWidth(self.bounds)-20, 0, 20, 20);
        [_deleteButton setBackgroundImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    }
    return _deleteButton;
}

@end

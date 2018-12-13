//
//  WLKTCDMapSchoolListCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/12.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDMapSchoolListCell.h"

@interface WLKTCDMapSchoolListCell()
@property (strong, nonatomic) UILabel *nameLabel;
@end

@implementation WLKTCDMapSchoolListCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.contentView);
            make.center.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setName:(NSString *)name{
    _name = name;
    self.nameLabel.text = name;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _nameLabel.textColor = KMainTextColor_9;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

@end

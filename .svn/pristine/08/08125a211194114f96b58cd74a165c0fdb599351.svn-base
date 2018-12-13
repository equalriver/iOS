//
//  WLKTLiveVideoCourseCell.m
//  wlkt
//
//  Created by 尹平江 on 2018/5/15.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTLiveVideoCourseCell.h"

@interface WLKTLiveVideoCourseCell ()
@property (strong, nonatomic) UIView *cycleView;
@property (strong, nonatomic) UIView *lineView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UIImageView *lockIV;
@property (strong, nonatomic) UILabel *stateLabel;
@end

@implementation WLKTLiveVideoCourseCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cycleView];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.lockIV];
        [self.contentView addSubview:self.stateLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)setLineViewState:(BOOL)isLooked index:(NSInteger)index count:(NSInteger)count{
    
    self.cycleView.backgroundColor = isLooked ? UIColorHex(33c4da) : kMainBackgroundColor;
    self.lineView.backgroundColor = isLooked ? UIColorHex(33c4da) : kMainBackgroundColor;
    
    if (isLooked) {
        self.stateLabel.layer.cornerRadius = 12 *ScreenRatio_6;
        self.stateLabel.layer.masksToBounds = YES;
        self.stateLabel.layer.borderColor = UIColorHex(33c4da).CGColor;
        self.stateLabel.layer.borderWidth = 0.5;
        self.stateLabel.textColor = UIColorHex(33c4da);
        self.stateLabel.text = @"回看";
    }
    
    if (count == 1) {
        self.lineView.hidden = YES;
        return;
    }
    
    if (index == 0) {
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cycleView.mas_bottom);
            make.centerX.mas_equalTo(self.cycleView);
            make.width.mas_equalTo(0.5);
            make.bottom.mas_equalTo(self.contentView);
        }];
    }
    else{
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.cycleView.mas_top);
            make.centerX.mas_equalTo(self.cycleView);
            make.width.mas_equalTo(0.5);
            make.top.mas_equalTo(self.contentView);
        }];
    }
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.cycleView.backgroundColor = kMainBackgroundColor;
    self.lineView.backgroundColor = kMainBackgroundColor;
    self.nameLabel.text = nil;
    self.timeLabel.text = nil;
    self.lockIV.image = nil;
    self.stateLabel.text = nil;
}

- (void)makeConstraints{
    [self.cycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(10, 10));
        make.left.mas_equalTo(self.contentView).offset(30 *ScreenRatio_6);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.left.mas_equalTo(self.cycleView.mas_right).offset(15 *ScreenRatio_6);
        make.right.mas_equalTo(self.stateLabel.mas_left).offset(-40 *ScreenRatio_6);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.nameLabel);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(10 *ScreenRatio_6);
    }];
    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(60 *ScreenRatio_6, 30 *ScreenRatio_6));
        make.right.mas_equalTo(self.contentView).offset(-15 *ScreenRatio_6);
    }];
    [self.lockIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.stateLabel.mas_left).offset(-20 *ScreenRatio_6);
        make.centerY.mas_equalTo(self.contentView);
    }];
}


#pragma mark - get
- (UIView *)cycleView{
    if (!_cycleView) {
        _cycleView = [UIView new];
        _cycleView.backgroundColor = kMainBackgroundColor;
        _cycleView.layer.masksToBounds = YES;
        _cycleView.layer.cornerRadius = 5;
    }
    return _cycleView;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = kMainBackgroundColor;
    }
    return _lineView;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6 weight:UIFontWeightSemibold];
        _nameLabel.textColor = KMainTextColor_3;
    }
    return _nameLabel;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _timeLabel.textColor = KMainTextColor_9;
    }
    return _timeLabel;
}
- (UIImageView *)lockIV{
    if (!_lockIV) {
        _lockIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        _lockIV.hidden = YES;
    }
    return _lockIV;
}
- (UILabel *)stateLabel{
    if (!_stateLabel) {
        _stateLabel = [UILabel new];
        _stateLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _stateLabel.textColor = KMainTextColor_6;
        _stateLabel.text = @"未开始";
        _stateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _stateLabel;
}
@end

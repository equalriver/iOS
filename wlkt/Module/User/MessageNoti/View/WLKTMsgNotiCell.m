//
//  WLKTMsgNotiCell.m
//  wlkt
//
//  Created by 尹平江 on 17/3/23.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTMsgNotiCell.h"

@implementation WLKTMsgNotiCell

#pragma mark - init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.headView];
        [self.contentView addSubview:self.separatorView_one];
        [self.contentView addSubview:self.separatorView_two];
        [self.contentView addSubview:self.stateImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.detailMsgLabel];
        
    }
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    return self;
}


#pragma mark - updateConstraints

- (void)updateConstraints{
    //头部填充view
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 15 * ScreenRatio_6));
        make.top.mas_equalTo(self.contentView);
    }];
    //分割线1
    [self.separatorView_one mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 1));
        make.top.mas_equalTo(self.headView.mas_bottom);
    }];
    //消息状态图
    [self.stateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(10 * ScreenRatio_6, 10 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView_one.mas_bottom).offset(17.5 * ScreenRatio_6);
    }];
    //消息title
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth * 0.85, 25 * ScreenRatio_6));
        make.left.mas_equalTo(self.stateImageView.mas_right).offset(5 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView_one.mas_bottom).offset(10 * ScreenRatio_6);
    }];
    //消息时间
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100 * ScreenRatio_6, 20 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5 * ScreenRatio_6);
    }];
    //消息详情
    [self.detailMsgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth - 40, 40 * ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.top.mas_equalTo(self.timeLabel.mas_bottom).offset(5 * ScreenRatio_6);
    }];
    //分割线2
    [self.separatorView_two mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 1));
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    [super updateConstraints];
}

#pragma mark - get

- (UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc]init];
        _headView.backgroundColor = fillViewColor;
    }
    return _headView;
}

- (UIView *)separatorView_one{
    if (!_separatorView_one) {
        _separatorView_one = [[UIView alloc]init];
        _separatorView_one.backgroundColor = separatorView_color;
    }
    return _separatorView_one;
}

- (UIView *)separatorView_two{
    if (!_separatorView_two) {
        _separatorView_two = [[UIView alloc]init];
        _separatorView_two.backgroundColor = separatorView_color;
    }
    return _separatorView_two;
}

- (UIImageView *)stateImageView{
    if (!_stateImageView) {
        _stateImageView = [[UIImageView alloc]init];
        _stateImageView.layer.cornerRadius = 5 * ScreenRatio_6;
        _stateImageView.layer.masksToBounds = YES;
        //_stateImageView.backgroundColor = [UIColor lightGrayColor];
    }
    return _stateImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        //_titleLabel.text = @"交易消息";
        _titleLabel.textColor = userLabelColor;
        _titleLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
    }
    return _titleLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        //_timeLabel.text = @"111111";
        _timeLabel.textColor = userLabelColor;
        _timeLabel.font = [UIFont systemFontOfSize:13 * ScreenRatio_6];
    }
    return _timeLabel;
}

- (UILabel *)detailMsgLabel{
    if (!_detailMsgLabel) {
        _detailMsgLabel = [[UILabel alloc]init];
        _detailMsgLabel.numberOfLines = 2;
        _detailMsgLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _detailMsgLabel.textColor = userLabelColor;
        _detailMsgLabel.font = [UIFont systemFontOfSize:13 * ScreenRatio_6];
        //_detailMsgLabel.text = @"详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情详情";
    }
    return _detailMsgLabel;
}

#pragma mark - reuse

- (void)prepareForReuse{
    [super prepareForReuse];
    self.stateImageView.image = nil;
    self.titleLabel.text = nil;
    self.timeLabel.text = nil;
    self.detailMsgLabel.text = nil;
}

#pragma mark -

- (void)setCellContent:(WLKTMsgNotiDitalData *)data{
    self.detailMsgLabel.text = data.content;
    self.titleLabel.text = data.title;
    self.timeLabel.text = data.createtime;
    if (data.status == 1) {//已读
        self.stateImageView.backgroundColor = [UIColor lightGrayColor];
    }
    if (data.status == 0) {//未读
        self.stateImageView.backgroundColor = [UIColor colorWithRed:255/255.0 green:148/255.0 blue:0 alpha:1.0];
    }
}

@end

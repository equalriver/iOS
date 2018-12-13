//
//  WLKTNewsCommentReplyHeadView.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/4.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTNewsCommentReplyHeadView.h"

@interface WLKTNewsCommentReplyHeadView ()
@property (strong, nonatomic) UILabel *usernameLabel;
@property (strong, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) UIButton *likeButton;
@property (strong, nonatomic) UIButton *reportButton;

@property (strong, nonatomic) UIView *separatorView;
@property (strong, nonatomic) UIView *bgView;
@property (strong, nonatomic) NSIndexPath *indexPath;
@end

@implementation WLKTNewsCommentReplyHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.usernameLabel];
        [self addSubview:self.detailLabel];
        [self addSubview:self.likeButton];
        [self addSubview:self.reportButton];
        [self addSubview:self.replyButton];
        [self addSubview:self.separatorView];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellData:(WLKTNewsDetailReplyList *)data indexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    self.usernameLabel.text = data.username;
    self.detailLabel.text = data.content;
    [_likeButton setTitle:[NSString stringWithFormat:@" 赞 %@", data.love_num] forState:UIControlStateNormal];
    //    self.timeLabel.text = data.displaytime;
}

- (void)NewsDetailCommentInfoAct:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(didSelectedNewsDetailCommentInfoButtonByType:button:indexPath:)]) {
        [self.delegate didSelectedNewsDetailCommentInfoButtonByType:sender.tag button:sender indexPath:self.indexPath];
    }
}

- (void)makeConstraints{
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self).offset(15 * ScreenRatio_6);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.usernameLabel.mas_bottom).offset(15 * ScreenRatio_6);
        make.left.mas_equalTo(self).offset(10 * ScreenRatio_6);
    }];
    [self.reportButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-10 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.replyButton);
    }];
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.reportButton.mas_left).offset(-25 * ScreenRatio_6);
        make.centerY.mas_equalTo(self.replyButton);
    }];
    [self.replyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 25));
        make.left.mas_equalTo(self).offset(10);
        make.top.mas_equalTo(self.detailLabel.mas_bottom).offset(15 * ScreenRatio_6);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.top.left.mas_equalTo(self);
    }];
}

- (void)makeSingleConstraints{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(ScreenWidth - 20 * ScreenRatio_6);
        make.center.top.bottom.mas_equalTo(self);
    }];
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.bgView).offset(10 * ScreenRatio_6);
        make.right.mas_equalTo(self.bgView).offset(-5);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.usernameLabel.mas_bottom).offset(10 * ScreenRatio_6);
        make.left.right.mas_equalTo(self.usernameLabel);
    }];
    [self.replyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 25));
        make.left.mas_equalTo(self.bgView).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.detailLabel.mas_bottom).offset(10 * ScreenRatio_6);
    }];
}

#pragma mark - get
- (UILabel *)usernameLabel{
    if (!_usernameLabel) {
        _usernameLabel = [UILabel new];
        _usernameLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
        _usernameLabel.textColor = KMainTextColor_3;
    }
    return _usernameLabel;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.font = [UIFont systemFontOfSize:13 * ScreenRatio_6];
        _detailLabel.textColor = KMainTextColor_3;
        _detailLabel.numberOfLines = 0;
    }
    return _detailLabel;
}
//- (UILabel *)timeLabel{
//    if (!_timeLabel) {
//        _timeLabel = [UILabel new];
//        _timeLabel.font = [UIFont systemFontOfSize:12];
//        _timeLabel.textColor = KMainTextColor_9;
//    }
//    return _timeLabel;
//}
- (UIButton *)likeButton{
    if (!_likeButton) {
        _likeButton = [UIButton new];
        _likeButton.titleLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        [_likeButton setImage:[UIImage imageNamed:@"点赞hui"] forState:UIControlStateNormal];
        [_likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateSelected];
        [_likeButton setTitle:@" 赞" forState:UIControlStateNormal];
        [_likeButton setTitleColor:KMainTextColor_9 forState:UIControlStateNormal];
        [_likeButton setTitleColor:UIColorHex(33c4da) forState:UIControlStateSelected];
        _likeButton.tag = NewsDetailCommentInfoLike;
        [_likeButton addTarget:self action:@selector(NewsDetailCommentInfoAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _likeButton;
}
- (UIButton *)reportButton{
    if (!_reportButton) {
        _reportButton = [UIButton new];
        _reportButton.titleLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        [_reportButton setImage:[UIImage imageNamed:@"举报"] forState:UIControlStateNormal];
        [_reportButton setTitle:@" 举报" forState:UIControlStateNormal];
        [_reportButton setTitleColor:KMainTextColor_9 forState:UIControlStateNormal];
        _reportButton.tag = NewsDetailCommentInfoReport;
        [_reportButton addTarget:self action:@selector(NewsDetailCommentInfoAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reportButton;
}
- (UIButton *)replyButton{
    if (!_replyButton) {
        _replyButton = [UIButton new];
        [_replyButton setTitle:@"回复" forState:UIControlStateNormal];
        [_replyButton setTitleColor:KMainTextColor_9 forState:UIControlStateNormal];
        _replyButton.tag = NewsDetailCommentInfoReply;
        _replyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _replyButton.titleLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        [_replyButton addTarget:self action:@selector(NewsDetailCommentInfoAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _replyButton;
}
- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}
- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = fillViewColor;
    }
    return _bgView;
}
@end



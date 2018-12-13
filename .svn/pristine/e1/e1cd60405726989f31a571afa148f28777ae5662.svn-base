//
//  WLKTCDMore_QA_cell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/20.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDMore_QA_cell.h"

@interface WLKTCDMore_QA_cell ()
@property (strong, nonatomic) UIView *bgView;
@property (strong, nonatomic) UILabel *answerCountLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@end

@implementation WLKTCDMore_QA_cell
- (instancetype)init
{
    self = [super init];
    if (self) {

        [self.contentView addSubview:self.bgView];
        [self.bgView addSubview:self.answerCountLabel];
        [self.bgView addSubview:self.timeLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)setData:(CDQuesListData *)data{
    _data = data;
    if (data.count.intValue > 0) {
        self.answerCountLabel.text = [NSString stringWithFormat:@"共%@个回答", data.count];
    }
    self.timeLabel.text = data.createtime;
    [data.answerlist enumerateObjectsUsingBlock:^(CDQuesListAnswerlist * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx >= 1) {
            *stop = YES;
        }
        
        UIView *v = [self createAnswerItem:obj.answer];
        [self.bgView addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.bgView).offset(6 *ScreenRatio_6);
            make.top.mas_equalTo(self.bgView).offset(6 + idx *30 *ScreenRatio_6);
            make.right.mas_equalTo(self.bgView).offset(-10 *ScreenRatio_6);
            make.height.mas_equalTo(30 *ScreenRatio_6);
        }];
        
    }];
}

- (UIView *)createAnswerItem:(NSString *)answer {
    UIView *v = [UIView new];
    v.backgroundColor = kMainBackgroundColor;
    
    UILabel *tagLabel = [UILabel new];
    tagLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
    tagLabel.textColor = [UIColor whiteColor];
    tagLabel.textAlignment = NSTextAlignmentCenter;
    tagLabel.backgroundColor = UIColorHex(19be6b);
    tagLabel.text = @"答";
    [v addSubview:tagLabel];
    [tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20 *ScreenRatio_6, 20 *ScreenRatio_6));
        make.top.left.mas_equalTo(v).offset(5);
    }];
    
    UILabel *detail = [UILabel new];
    detail.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
    detail.textColor = KMainTextColor_6;
    detail.text = answer;
    [v addSubview:detail];
    [detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(tagLabel.mas_right).offset(10 *ScreenRatio_6);
        make.right.mas_equalTo(v);
        make.height.mas_equalTo(20 *ScreenRatio_6);
        make.top.mas_equalTo(tagLabel);
    }];
    
    return v;
}

- (void)makeConstraints{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(-10 *ScreenRatio_6);
        make.left.mas_equalTo(self.contentView).offset(40 *ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(5);
        make.bottom.mas_equalTo(self.contentView).offset(-10 *ScreenRatio_6);
    }];
    [self.answerCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgView).offset(10 *ScreenRatio_6);
        make.bottom.mas_equalTo(self.bgView).offset(-5);
        make.width.mas_equalTo(100 *ScreenRatio_6);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bgView).offset(-10 *ScreenRatio_6);
        make.bottom.mas_equalTo(self.bgView).offset(-5);
    }];
    
}

#pragma mark - get
- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = kMainBackgroundColor;
    }
    return _bgView;
}
- (UILabel *)answerCountLabel{
    if (!_answerCountLabel) {
        _answerCountLabel = [UILabel new];
        _answerCountLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _answerCountLabel.textColor = KMainTextColor_9;
    }
    return _answerCountLabel;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _timeLabel.textColor = KMainTextColor_9;
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}
@end

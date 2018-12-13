//
//  WLKTActivityDetail_Q_A_cell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityDetail_Q_A_cell.h"

@interface WLKTActivityDetail_Q_A_cell ()
@property (strong, nonatomic) UIImageView *iconIV;
@property (strong, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) UILabel *username_timeLabel;
@property (strong, nonatomic) UIImageView *answerIV;
@end

@implementation WLKTActivityDetail_Q_A_cell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.answerIV];
        [self.contentView addSubview:self.detailLabel];
        [self.contentView addSubview:self.username_timeLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellData:(WLKTActivityDetail_ques *)data index:(NSInteger)index{
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:5];
    for (int i = 0; i < data.ques.count; i++) {
        [arr addObject:data.ques[i].question];
        if (data.ques[i].answer.answer.length > 0) {//有答
            [arr addObject:data.ques[i].answer];
        }
    }
    if (arr.count > index) {
        if ([arr[index] isKindOfClass:[WLKTActivityDetail_QA_question class]]) {//问
            WLKTActivityDetail_QA_question *ques = arr[index];
            self.answerIV.hidden = YES;
            self.iconIV.image = [UIImage imageNamed:@"问"];
            self.detailLabel.text = ques.question;
            self.username_timeLabel.text = [NSString stringWithFormat:@"提问人：%@  提问时间：%@", ques.username, ques.create_time];
        }
        else if ([arr[index] isKindOfClass:[WLKTActivityDetail_QA_answer class]]){
            WLKTActivityDetail_QA_answer *answer = arr[index];
            self.answerIV.hidden = NO;
            self.iconIV.image = [UIImage imageNamed:@"答"];
            self.detailLabel.text = answer.answer;
            self.username_timeLabel.text = [NSString stringWithFormat:@"回答人：%@  回答时间：%@", answer.username, answer.create_time];
            [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.iconIV.mas_right).offset(20 * ScreenRatio_6);
                make.top.mas_equalTo(self.iconIV).offset(10 * ScreenRatio_6);
            }];
        }
    }
    
}

- (void)makeConstraints{
    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(6 * ScreenRatio_6);
    }];
    [self.answerIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.iconIV.mas_right).offset(10 * ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 * ScreenRatio_6);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-5);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconIV.mas_right).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.iconIV);
        make.size.mas_equalTo(CGSizeMake(310 * ScreenRatio_6, 15));
    }];
    [self.username_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.detailLabel);
        make.top.mas_equalTo(self.detailLabel.mas_bottom).offset(10 * ScreenRatio_6);
    }];
}

#pragma mark - get
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [UIImageView new];
    }
    return _iconIV;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _detailLabel.textColor = KMainTextColor_3;
        _detailLabel.numberOfLines = 2;
    }
    return _detailLabel;
}
- (UILabel *)username_timeLabel{
    if (!_username_timeLabel) {
        _username_timeLabel = [UILabel new];
        _username_timeLabel.font = [UIFont systemFontOfSize:11 * ScreenRatio_6];
        _username_timeLabel.textColor = KMainTextColor_9;
    }
    return _username_timeLabel;
}
- (UIImageView *)answerIV{
    if (!_answerIV) {
        _answerIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"气泡框"]];
    }
    return _answerIV;
}

@end


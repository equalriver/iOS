//
//  WLKTCD_Q_A_cell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/15.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCD_Q_A_cell.h"

@interface WLKTCD_Q_A_cell ()
@property (strong, nonatomic) UILabel *tagLabel;
@property (strong, nonatomic) UILabel *questionLabel;
@property (strong, nonatomic) UILabel *answerNumLabel;

@end

@implementation WLKTCD_Q_A_cell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.tagLabel];
        [self.contentView addSubview:self.questionLabel];
        [self.contentView addSubview:self.answerNumLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)setData:(CDQueslist_detailList *)data{
    _data = data;
    self.questionLabel.text = data.question;
    self.answerNumLabel.text = [NSString stringWithFormat:@"%@个回答", data.num];
}

- (void)makeConstraints{
    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20 *ScreenRatio_6, 20 *ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(15 *ScreenRatio_6);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.questionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.tagLabel.mas_right).offset(10 *ScreenRatio_6);
        make.right.mas_equalTo(self.answerNumLabel.mas_left).offset(-5);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.answerNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(-30 *ScreenRatio_6);
        make.centerY.mas_equalTo(self.contentView);
        make.width.mas_equalTo(70 *ScreenRatio_6);
    }];
}

#pragma mark -
- (UILabel *)tagLabel{
    if (!_tagLabel) {
        _tagLabel = [UILabel new];
        _tagLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _tagLabel.textColor = kMainTextColor_red;
        _tagLabel.textAlignment = NSTextAlignmentCenter;
        _tagLabel.layer.masksToBounds = YES;
        _tagLabel.layer.cornerRadius = 1;
        _tagLabel.layer.borderColor = kMainTextColor_red.CGColor;
        _tagLabel.layer.borderWidth = 0.5;
        _tagLabel.text = @"问";
    }
    return _tagLabel;
}
- (UILabel *)questionLabel{
    if (!_questionLabel) {
        _questionLabel = [UILabel new];
        _questionLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _questionLabel.textColor = KMainTextColor_6;
    }
    return _questionLabel;
}
- (UILabel *)answerNumLabel{
    if (!_answerNumLabel) {
        _answerNumLabel = [UILabel new];
        _answerNumLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _answerNumLabel.textColor = KMainTextColor_6;
        _answerNumLabel.textAlignment = NSTextAlignmentRight;
    }
    return _answerNumLabel;
}

@end

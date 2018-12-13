//
//  WLKTSchoolNewsDetailBottomBtns.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/23.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolNewsDetailBottomBtns.h"

@interface WLKTSchoolNewsDetailBottomBtns ()
@property (strong, nonatomic) ZFButton *reportBtn;
@property (strong, nonatomic) UIButton *commentBtn;

@end

@implementation WLKTSchoolNewsDetailBottomBtns
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.reportBtn];
        [self addSubview:self.collectBtn];
        [self addSubview:self.commentBtn];
        
    }
    return self;
}

- (void)btnDidClick:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(schoolNewsDetailBottomButtonDidSelected:)]) {
        [self.delegate schoolNewsDetailBottomButtonDidSelected:sender];
    }
}

//图片在上  文字在下
- (ZFButton *)createZFButton:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag {
    ZFButton *btn = [ZFButton new];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:KMainTextColor_9 forState:UIControlStateNormal];
    btn.tag = tag;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    btn.frame = CGRectMake(tag * 78 * ScreenRatio_6, 0, 75 * ScreenRatio_6, 50);
    btn.imageRect = CGRectMake(27 * ScreenRatio_6, 4 * ScreenRatio_6, 20, 20);
    btn.titleRect = CGRectMake(0, 30 * ScreenRatio_6, 75 * ScreenRatio_6, 15);
    [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

#pragma mark - get
- (ZFButton *)reportBtn{
    if (!_reportBtn) {
        _reportBtn = [self createZFButton:@"举 报" image:[UIImage imageNamed:@"举报底部标签"] tag:0];
    }
    return _reportBtn;
}
- (ZFButton *)collectBtn{
    if (!_collectBtn) {
        _collectBtn = [self createZFButton:@"收 藏" image:[UIImage imageNamed:@"课程详情未收藏"] tag:1];
    }
    return _collectBtn;
}
- (UIButton *)commentBtn{
    if (!_commentBtn) {
        _commentBtn = [[UIButton alloc]initWithFrame:CGRectMake(156 * ScreenRatio_6, 0, 219 * ScreenRatio_6, 50)];
        _commentBtn.tag = 2;
        [_commentBtn setTitle:@"我要评论" forState:UIControlStateNormal];
        [_commentBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        _commentBtn.titleLabel.font = [UIFont systemFontOfSize:16 * ScreenRatio_6];
        _commentBtn.backgroundColor = UIColorHex(f6c447);
        [_commentBtn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentBtn;
}
@end

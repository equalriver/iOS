//
//  WLKTSchoolNewsDetailCommentAlertView.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/23.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolNewsDetailCommentAlertView.h"
#import "PlaceholderTextView.h"

@interface WLKTSchoolNewsDetailCommentAlertView ()<UITextViewDelegate>
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) PlaceholderTextView *commentTV;
@property (strong, nonatomic) UIButton *confirmBtn;

@property (copy, nonatomic) NSString *comment;
@property (nonatomic) BOOL isPush;
@end

@implementation WLKTSchoolNewsDetailCommentAlertView
- (instancetype)initWithFrame:(CGRect)frame isPushViewController:(BOOL)isPush
{
    self = [super initWithFrame:frame];
    if (self) {
        _isPush = isPush;
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.7];
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.commentTV];
        [self.contentView addSubview:self.confirmBtn];
        [self makeConstraints];
        //keyboard
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
        
        [UIView viewAnimateComeOutWithDuration:0.7 delay:0 target:self.contentView completion:^(BOOL finished) {
            
        }];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            [self endEditing:YES];
            [UIView viewAnimateDismissWithDuration:0.7 delay:0 target:self.contentView completion:^(BOOL finished) {
                if (finished) {
                    [self removeFromSuperview];
                }
            }];
        }];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)confirmBtnAct:(UIButton *)sender{
    if (self.comment.length < 5) {
        [SVProgressHUD showInfoWithStatus:@"评论字数不够"];
        return;
    }
    if (self.comment.length > 200) {
        [SVProgressHUD showInfoWithStatus:@"超过字数限制"];
        return;
    }
    [self endEditing:YES];
    dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.25);
    dispatch_after(t, dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(didFinishWithComment:completion:)]) {
            [self.delegate didFinishWithComment:self.comment completion:^(BOOL finished) {
                [UIView viewAnimateDismissWithDuration:0.7 delay:0 target:self.contentView completion:^(BOOL finished) {
                    if (finished) {
                        [self removeFromSuperview];
                    }
                }];
            }];
        }
    });
}

#pragma mark - keyboard
- (void)keyboardFrameChange:(NSNotification *)noti{
    CGRect keyboardFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.transform = CGAffineTransformMakeTranslation(0, keyboardFrame.origin.y - self.frame.size.height);
}

#pragma mark - text view delegate
- (void)textViewDidChange:(UITextView *)textView{
    self.comment = textView.text;
}


#pragma mark -
- (void)makeConstraints{
    [self.commentTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth - 20, 130));
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
    }];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 35));
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 * ScreenRatio_6);
        make.top.mas_equalTo(self.commentTV.mas_bottom).offset(10 * ScreenRatio_6);
    }];
}

#pragma mark - get
- (UIView *)contentView{
    if (!_contentView) {
        
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, self.isPush ? ScreenHeight - NavigationBarAndStatusHeight : ScreenHeight, ScreenWidth, 240)];
        _contentView.backgroundColor = UIColorHex(ffffff);
    }
    return _contentView;
}
- (PlaceholderTextView *)commentTV{
    if (!_commentTV) {
        _commentTV = [[PlaceholderTextView alloc]initWithPlaceholderColor:KMainTextColor_9 font:11 * ScreenRatio_6];
        _commentTV.myPlaceholder = @"请输入评论(5~200个字)";
        _commentTV.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _commentTV.textColor = KMainTextColor_3;
        _commentTV.layer.borderColor = KMainTextColor_9.CGColor;
        _commentTV.layer.borderWidth = 0.5;
        _commentTV.delegate = self;
    }
    return _commentTV;
}
- (UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton new];
        [_confirmBtn setTitle:@"发送" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        _confirmBtn.backgroundColor = UIColorHex(33c4da);
        _confirmBtn.layer.cornerRadius = 3;
        _confirmBtn.layer.masksToBounds = YES;
        [_confirmBtn addTarget:self action:@selector(confirmBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}
@end

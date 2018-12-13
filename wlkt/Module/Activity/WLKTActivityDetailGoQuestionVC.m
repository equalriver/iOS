//
//  WLKTActivityDetailGoQuestionVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityDetailGoQuestionVC.h"
#import "WLKTCourseDetailQuestionApi.h"
#import "PlaceholderTextView.h"

@interface WLKTActivityDetailGoQuestionVC ()<UITextViewDelegate>
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UILabel *schoolNameLabel;
@property (strong, nonatomic) UIView *separatorView;
@property (strong, nonatomic) UILabel *fixLabel;
@property (strong, nonatomic) PlaceholderTextView *detailTV;
//@property (strong, nonatomic) UIButton *confirmBtn;

@property (copy, nonatomic) NSString *question;
@property (strong, nonatomic) WLKTActivity *activity;
@end

@implementation WLKTActivityDetailGoQuestionVC
- (instancetype)initWithActivity:(WLKTActivity *)activity
{
    self = [super init];
    if (self) {
        _activity = activity;
        self.title = @"我来问问";
        self.view.backgroundColor = separatorView_color;
        [self.view addSubview:self.contentView];
        [self.contentView addSubview:self.schoolNameLabel];
        [self.contentView addSubview:self.separatorView];
        [self.contentView addSubview:self.fixLabel];
        [self.contentView addSubview:self.detailTV];
//        [self.view addSubview:self.confirmBtn];
        [self makeConstraints];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(confirmBtnAct)];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - network
- (void)request{
    WLKTCourseDetailQuestionApi *api = [[WLKTCourseDetailQuestionApi alloc]initWithSuid:self.activity.suid point_id:@"" course_id:@"0" act_id:self.activity.aid question:self.question];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        [SVProgressHUD showSuccessWithStatus:@"提交成功!"];
        !self.successBlock ? : self.successBlock();
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    } failure:^(__kindof YTKBaseRequest *request) {
        ShowApiError
    }];
}

#pragma mark - action
- (void)textViewDidChange:(UITextView *)textView{
    self.question = textView.text;
}

- (void)confirmBtnAct{
    if (self.question.length < 5) {
        [SVProgressHUD showInfoWithStatus:@"问题未输入或太短"];
        return;
    }
    [self request];
}


#pragma mark - make constraints
- (void)makeConstraints{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 175));
        make.top.mas_equalTo(self.view);
    }];
    [self.schoolNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.top.mas_equalTo(self.schoolNameLabel.mas_bottom).offset(15 * ScreenRatio_6);
    }];
    [self.fixLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.separatorView).offset(30 * ScreenRatio_6);
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
    }];
    [self.detailTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(290 * ScreenRatio_6, 100));
        make.top.mas_equalTo(self.separatorView).offset(15 * ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 * ScreenRatio_6);
    }];
//    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(355 * ScreenRatio_6, 40));
//        make.centerX.mas_equalTo(self.view);
//        make.top.mas_equalTo(self.contentView.mas_bottom).offset(10);
//    }];
}

#pragma mark - get
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}
- (UILabel *)schoolNameLabel{
    if (!_schoolNameLabel) {
        _schoolNameLabel = [UILabel new];
        _schoolNameLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
        _schoolNameLabel.textColor = UIColorHex(37becc);
        _schoolNameLabel.text = _activity.schoolname;
    }
    return _schoolNameLabel;
}
- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}
- (UILabel *)fixLabel{
    if (!_fixLabel) {
        _fixLabel = [UILabel new];
        _fixLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _fixLabel.textColor = KMainTextColor_3;
        _fixLabel.text = @"我的问题:";
    }
    return _fixLabel;
}
- (PlaceholderTextView *)detailTV{
    if (!_detailTV) {
        _detailTV = [[PlaceholderTextView alloc]initWithPlaceholderColor:KMainTextColor_9 font:11 * ScreenRatio_6];
        _detailTV.myPlaceholder = @"活动怎么样？环境如何？效果还满意吗？(5~200个字)";
        _detailTV.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _detailTV.textColor = KMainTextColor_3;
        _detailTV.layer.borderColor = KMainTextColor_9.CGColor;
        _detailTV.layer.borderWidth = 0.5;
        _detailTV.delegate = self;
    }
    return _detailTV;
}
//- (UIButton *)confirmBtn{
//    if (!_confirmBtn) {
//        _confirmBtn = [UIButton new];
//        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//        [_confirmBtn setTitle:@"提交" forState:UIControlStateNormal];
//        [_confirmBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
//        _confirmBtn.layer.cornerRadius = 3;
//        _confirmBtn.layer.masksToBounds = YES;
//        _confirmBtn.backgroundColor = UIColorHex(33c4da);
//        [_confirmBtn addTarget:self action:@selector(confirmBtnAct) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _confirmBtn;
//}

@end


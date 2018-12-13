
//
//  WLKTCDMoreQuestionVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/21.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDMoreQuestionVC.h"
#import "PlaceholderTextView.h"
#import "WLKTCDPageController.h"
#import "WLKTCourseDetailQuestionApi.h"
#import "WLKTCDMoreQuestionSucessAlert.h"

@interface WLKTCDMoreQuestionVC ()<UITextViewDelegate>
@property (strong, nonatomic) PlaceholderTextView *textView;
@property (strong, nonatomic) UILabel *wordCountLabel;
@property (strong, nonatomic) WLKTCDCourseinfo *courseinfo;

@property (copy, nonatomic) NSString *question;
@end

@implementation WLKTCDMoreQuestionVC
- (instancetype)initWithData:(WLKTCDCourseinfo *)data
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = kMainBackgroundColor;
        _courseinfo = data;
        UIView *v = [self makeHeaderViewWithData:data];
        [self.view addSubview:v];
        [self.view addSubview:self.textView];
        [self.view addSubview:self.wordCountLabel];
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(v.mas_bottom);
            make.width.centerX.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.wordCountLabel.mas_top);
        }];
        [self.wordCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(ScreenWidth - 15 *ScreenRatio_6, 40 *ScreenRatio_6));
            make.bottom.mas_equalTo(self.view);
            make.right.mas_equalTo(self.view).offset(-15 *ScreenRatio_6);
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提问";
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    b.titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
    [b setTitle:@"发布" forState:UIControlStateNormal];
    [b setTitleColor:kMainTextColor_red forState:UIControlStateNormal];
    [b addTarget:self action:@selector(rightBarButtonAct) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:b];
    self.navigationItem.rightBarButtonItem = right;
    
    //keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - keyboard
- (void)keyboardFrameChange:(NSNotification *)noti{
    CGRect keyboardFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.wordCountLabel.transform = CGAffineTransformMakeTranslation(0, keyboardFrame.origin.y -ScreenHeight);

}

#pragma mark - action
- (void)rightBarButtonAct{
    [self.view.window endEditing:YES];
    if (!self.question) {
        return;
    }
    WLKTCourseDetailQuestionApi *api = [[WLKTCourseDetailQuestionApi alloc]initWithSuid:self.courseinfo.suid point_id:@"" course_id:self.courseinfo.cid act_id:@"" question:self.question];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
       
        NSString *code = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"errorCode"]];
        if ([code isEqualToString:@"0"]) {
            WLKTCDMoreQuestionSucessAlert *alert = [[WLKTCDMoreQuestionSucessAlert alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight -IphoneXBottomInsetHeight) callback:^(UIView *v) {
                [v removeFromSuperview];
                [self.navigationController popViewControllerAnimated:YES];
            }];
            [self.view.window addSubview:alert];
            
        }
        else{
            [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"%@", request.responseJSONObject[@"message"]]];
        }
        
    } failure:^(__kindof YTKBaseRequest *request) {
        
    }];
}


- (void)buyButtonAct{

    for (UIViewController *v in self.navigationController.viewControllers) {
        if ([v isKindOfClass:[WLKTCDPageController class]]) {
            WLKTCDPageController *vc = (WLKTCDPageController *)v;
            vc.selectIndex = 0;
            [self.navigationController popToViewController:vc animated:YES];
            break;
        }
    }
}

#pragma mark - text view
- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length > 100) {
        NSString *t = self.textView.text;
        self.textView.text = [t substringToIndex:100];
        return;
    }
    self.wordCountLabel.text = [NSString stringWithFormat:@"(%ld/100)", textView.text.length];
    self.question = textView.text;
}

#pragma mark -
- (void)makeConstraints{
    [self.wordCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 20));
        make.bottom.right.mas_equalTo(self.view).offset(-15 *ScreenRatio_6);
    }];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(300 *ScreenRatio_6);
        
    }];
    
}

#pragma mark - get
- (UIView *)makeHeaderViewWithData:(WLKTCDCourseinfo *)data {
//    CGFloat h = [UILabel getSizeWithStr:data.coursename Width:200 *ScreenRatio_6 Font:16 *ScreenRatio_6].height;
    
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 90 *ScreenRatio_6)];
    v.backgroundColor = [UIColor whiteColor];
    
    UIImageView *iv = [UIImageView new];
    [iv setImageURL:[NSURL URLWithString:data.img]];
    [v addSubview:iv];
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90 *ScreenRatio_6, 68 *ScreenRatio_6));
        make.left.top.mas_equalTo(v).offset(10 *ScreenRatio_6);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6 weight:UIFontWeightSemibold];
    titleLabel.textColor = KMainTextColor_3;
    titleLabel.text = data.coursename;
    titleLabel.numberOfLines = 2;
    
    [v addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(iv.mas_right).offset(10 *ScreenRatio_6);
        make.top.mas_equalTo(iv);
        make.width.mas_equalTo(200 *ScreenRatio_6);
    }];
    
    UILabel *price = [UILabel new];
    price.font = [UIFont systemFontOfSize:22 *ScreenRatio_6];
    price.textColor = kMainTextColor_red;
    price.text = data.showprice.length > 0 ? [NSString stringWithFormat:@"¥%@", data.showprice] : @"";
    [v addSubview:price];
    [price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(titleLabel);
        make.bottom.mas_equalTo(v).offset(-10 *ScreenRatio_6);
    }];
    
    UIButton *buyBtn = [UIButton new];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
    buyBtn.backgroundColor = UIColorHex(ffbfbf);
    [buyBtn setTitle:@"购买" forState:UIControlStateNormal];
    [buyBtn setTitleColor:kMainTextColor_red forState:UIControlStateNormal];
    buyBtn.layer.masksToBounds = YES;
    buyBtn.layer.cornerRadius = 20 *ScreenRatio_6;
    [buyBtn addTarget:self action:@selector(buyButtonAct) forControlEvents:UIControlEventTouchUpInside];
    [v addSubview:buyBtn];
    [buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40 *ScreenRatio_6, 40 *ScreenRatio_6));
        make.right.mas_equalTo(v).offset(-15 *ScreenRatio_6);
        make.top.mas_equalTo(v).offset(15 *ScreenRatio_6);
    }];
    
    UILabel *buyTag = [UILabel new];
    buyTag.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
    buyTag.textColor = kMainTextColor_red;
    buyTag.textAlignment = NSTextAlignmentCenter;
    buyTag.text = @"立即购买";
    [v addSubview:buyTag];
    [buyTag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60 *ScreenRatio_6, 20 *ScreenRatio_6));
        make.top.mas_equalTo(buyBtn.mas_bottom).offset(5);
        make.centerX.mas_equalTo(buyBtn);
    }];
    
    return v;
}

- (PlaceholderTextView *)textView{
    if (!_textView) {
        _textView = [[PlaceholderTextView alloc]initWithPlaceholderColor:KMainTextColor_9 font:12 *ScreenRatio_6];
        _textView.backgroundColor = kMainBackgroundColor;
        _textView.delegate = self;
        _textView.myPlaceholder = @"描述一下你的问题，同学和机构都可以为你解答...";
    }
    return _textView;
}
- (UILabel *)wordCountLabel{
    if (!_wordCountLabel) {
        _wordCountLabel = [UILabel new];
        _wordCountLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _wordCountLabel.textColor = KMainTextColor_9;
        _wordCountLabel.backgroundColor = kMainBackgroundColor;
        _wordCountLabel.textAlignment = NSTextAlignmentRight;
        _wordCountLabel.text = @"(0/100)";
    }
    return _wordCountLabel;
}
@end

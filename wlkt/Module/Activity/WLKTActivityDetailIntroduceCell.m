//
//  WLKTActivityDetailIntroduceCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityDetailIntroduceCell.h"
#import "WLKTHTMLString.h"

@interface WLKTActivityDetailIntroduceCell ()<UIWebViewDelegate>
@property (strong, nonatomic) UIWebView *webView;

@end

@implementation WLKTActivityDetailIntroduceCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.webView];

        [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setIntro:(NSString *)intro{
    _intro = intro;
    NSString *htmlString = [NSString stringWithFormat:@"<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'><meta name='apple-mobile-web-app-capable' content='yes'><meta name='apple-mobile-web-app-status-bar-style' content='black'><meta name='format-detection' content='telephone=no'><style type='text/css'>img{width:%fpx}</style>%@", ScreenWidth - 20, intro];
    [self.webView loadHTMLString:htmlString baseURL:nil];
}

#pragma mark - web view
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [SVProgressHUD show];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [SVProgressHUD dismiss];
    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    [self.webView setHeight:height];
    if ([self.delegate respondsToSelector:@selector(didLoadHtmlStringWithHeight:)]) {
        [self.delegate didLoadHtmlStringWithHeight:height];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [SVProgressHUD dismiss];
}

#pragma mark - make constraints
- (void)makeConstraints{
//    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.contentView).offset(10);
//        make.top.mas_equalTo(self.contentView).offset(15);
//    }];
//    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.iconIV.mas_right).offset(10);
//        make.top.mas_equalTo(self.contentView).offset(15);
//    }];
//    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(315 * ScreenRatio_6);
//        //        make.size.mas_equalTo(CGSizeMake(315 * ScreenRatio_6, COURSE_DETAIL_INTRO_HEIGHT));
//        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
//        make.left.mas_equalTo(self.titleLabel);
//        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-15);
//    }];
//    [self.moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self.contentView);
//        make.bottom.mas_equalTo(self.contentView.mas_bottom);
//    }];
}

#pragma mark - set
//- (void)setWebViewHeight:(NSInteger)webViewHeight{
//    _webViewHeight = webViewHeight;
//    if (self.isMore) {
//        [self.webView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(315 * ScreenRatio_6, webViewHeight));
//        }];
//    }
//}

#pragma mark - get
//- (UIImageView *)iconIV{
//    if (!_iconIV) {
//        _iconIV = [UIImageView new];
//    }
//    return _iconIV;
//}
//- (UILabel *)titleLabel{
//    if (!_titleLabel) {
//        _titleLabel = [UILabel new];
//        _titleLabel.font = [UIFont systemFontOfSize:12];
//    }
//    return _titleLabel;
//}
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
        _webView.scrollView.scrollEnabled = NO;
        _webView.scrollView.showsHorizontalScrollIndicator = NO;
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        _webView.scrollView.bounces = false;
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.opaque = NO;
        if (IsIOS_11_Later) {
            _webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _webView.delegate = self;
    }
    return _webView;
}
//- (UILabel *)moreLabel{
//    if (!_moreLabel) {
//        _moreLabel = [UILabel new];
//        _moreLabel.textColor = UIColorHex(999999);
//        _moreLabel.font = [UIFont systemFontOfSize:12];
//        _moreLabel.text = @"点击显示更多";
//    }
//    return _moreLabel;
//}
@end


//
//  WLKTSchoolNewsDetailMsgCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolNewsDetailMsgCell.h"

@interface WLKTSchoolNewsDetailMsgCell ()<UIWebViewDelegate>
@property (strong, nonatomic) UIImageView *likeBgIV;
@property (strong, nonatomic) UIImageView *likeIV;
@property (strong, nonatomic) UILabel *likeLabel;

@property (nonatomic) BOOL isSchoolNews;
@end

@implementation WLKTSchoolNewsDetailMsgCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.likeBgIV];
        [self.contentView addSubview:self.likeIV];
        [self.contentView addSubview:self.likeLabel];
        [self makeConstraints];
    }
    return self;
}

- (instancetype)initWithSchoolNews
{
    self = [super init];
    if (self) {
        _isSchoolNews = YES;
        [self.contentView addSubview:self.likeBgIV];
        [self.contentView addSubview:self.likeIV];
        [self.contentView addSubview:self.likeLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellData:(WLKTSchoolNewsDetailData *)data isLoadWeb:(BOOL)isLoadWeb {
    if (!isLoadWeb) {
        [self.contentView addSubview:self.webView];
        [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.width.mas_equalTo(self.contentView);
            make.bottom.mas_equalTo(self.likeBgIV.mas_top).offset(-15 * ScreenRatio_6);
        }];
        NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:data.info]];
        [self.webView loadRequest:req];
    }
    else{
        [self.webView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.width.mas_equalTo(self.contentView);
            make.bottom.mas_equalTo(self.likeBgIV.mas_top).offset(-15 * ScreenRatio_6);
        }];
    }
    self.likeLabel.text = [NSString stringWithFormat:@"(%@)", data.zan_num];
    [self.likeBgIV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-15 * ScreenRatio_6);
        make.centerX.mas_equalTo(self.contentView);
    }];
}

- (void)setNewsCellData:(WLKTNewsDetailData *)data isLoadWeb:(BOOL)isLoadWeb {
    if (!isLoadWeb) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
        _webView.scrollView.scrollEnabled = NO;
        _webView.scrollView.showsHorizontalScrollIndicator = NO;
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        _webView.scrollView.bounces = false;
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.opaque = NO;
        _webView.delegate = self;
        if (IsIOS_11_Later) {
            _webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [self.contentView addSubview:_webView];
        NSString *htmlString = [NSString stringWithFormat:@"<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'><meta name='apple-mobile-web-app-capable' content='yes'><meta name='apple-mobile-web-app-status-bar-style' content='black'><meta name='format-detection' content='telephone=no'><style type='text/css'>img{width:%fpx}</style>%@", ScreenWidth - 20, data.content];
        [_webView loadHTMLString:htmlString baseURL:nil];
    }
    self.likeLabel.text = [NSString stringWithFormat:@"(%@)", data.love_num];
    [self.likeBgIV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-15 * ScreenRatio_6);
        make.centerX.mas_equalTo(self.contentView);
    }];
}

- (void)likeAct{
    if ([self.delegate respondsToSelector:@selector(didTapLikeIcon:)]) {
        [self.delegate didTapLikeIcon:^(BOOL finish, NSString *likeCount) {
            if (finish) {
                self.likeLabel.text = [NSString stringWithFormat:@"(%@)", likeCount];
            }
        }];
    }
}

#pragma mark - web view
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [SVProgressHUD show];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [SVProgressHUD dismiss];
    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    [self.webView setHeight:height + 50];
    if ([self.delegate respondsToSelector:@selector(didLoadHtmlStringWithHeight:)]) {
        [self.delegate didLoadHtmlStringWithHeight:height +50];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [SVProgressHUD dismiss];
}

#pragma mark -
- (void)makeConstraints{
    [self.likeBgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-15 * ScreenRatio_6);
        make.centerX.mas_equalTo(self.contentView);
    }];
    [self.likeIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.likeBgIV).offset(5);
    }];
    [self.likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.likeIV.mas_bottom);
    }];

}

#pragma mark - get
- (UIWebView *)webView{
    if (!_webView && self.isSchoolNews) {
        _webView = [UIWebView new];
        _webView.scrollView.showsHorizontalScrollIndicator = false;
        _webView.scrollView.scrollEnabled = false;
    }
    return _webView;
}
- (UIImageView *)likeBgIV{
    if (!_likeBgIV) {
        _likeBgIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"赞的圆"]];
        _likeBgIV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(likeAct)];
        [_likeBgIV addGestureRecognizer:tap];
    }
    return _likeBgIV;
}
- (UIImageView *)likeIV{
    if (!_likeIV) {
        _likeIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"点赞白"]];
        _likeIV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(likeAct)];
        [_likeIV addGestureRecognizer:tap];
    }
    return _likeIV;
}
- (UILabel *)likeLabel{
    if (!_likeLabel) {
        _likeLabel = [UILabel new];
        _likeLabel.font = [UIFont systemFontOfSize:10 * ScreenRatio_6];
        _likeLabel.textColor = UIColorHex(ffffff);
        _likeLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(likeAct)];
        [_likeLabel addGestureRecognizer:tap];
    }
    return _likeLabel;
}
@end

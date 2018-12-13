//
//  WLKTTianfuPayVC.m
//  wlkt
//
//  Created by 尹平江 on 2017/4/26.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTTianfuPayVC.h"
#import <WebKit/WebKit.h>
#import "WLKTUserMyCourseVC.h"

@interface WLKTTianfuPayVC ()<WKNavigationDelegate, WKUIDelegate>
@property (strong, nonatomic)  WKWebView *webView;
@property (strong, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) UIBarButtonItem *popBarItem;
@property (strong, nonatomic) UIBarButtonItem *backBarItem;

@end

@implementation WLKTTianfuPayVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"天府银行";
    
    self.backBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"箭头左"] style:UIBarButtonItemStylePlain target:self action:@selector(h5BackAct:)];
    self.popBarItem = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonAct)];
    
    self.navigationItem.leftBarButtonItems = @[self.backBarItem, self.popBarItem];

    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    if (self.url) {
        NSURL *url = [NSURL URLWithString:self.url];
        NSURLRequest *bankRequest = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:bankRequest];
        
    }
    else if (self.url == nil){
        //[SVProgressHUD showErrorWithStatus:@"网页打开失败"];
    }
    
}

#pragma mark - action

- (void)h5BackAct:(UIBarButtonItem *)sender{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
        //self.navigationItem.leftBarButtonItems = @[self.backBarItem, self.popBarItem];
    }
    else{
        [self backButtonAct];
    }
    
}

- (void)backButtonAct{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - webview

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
        
    }
}
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    //[SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",error]];
    //[SVProgressHUD setMaximumDismissTimeInterval:2];
    //[SVProgressHUD showErrorWithStatus:@"网络连接失败"];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:
(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSString *hostname = [NSString stringWithFormat:@"%@", navigationAction.request.URL];
    if ([hostname containsString:@"close.html"]) {
        // 不允许web内跳转
        decisionHandler(WKNavigationActionPolicyCancel);
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    if ([hostname containsString:@"user/gomyorder"]) {
        // 支付成功
        decisionHandler(WKNavigationActionPolicyCancel);
        WLKTUserMyCourseVC *vc = [[WLKTUserMyCourseVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    else {
        //self.progressView.alpha = 1.0;
        decisionHandler(WKNavigationActionPolicyAllow);
    }
    
}


#pragma mark - kvo

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    
    if ([keyPath isEqualToString:@"estimatedProgress"])
    {
        self.progressView.alpha = 1.0;
        self.progressView.progress = self.webView.estimatedProgress;
    }
    // 加载完成
    if (self.progressView.progress == 1.0)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.progressView.alpha = 0.0;
        }];
    }
    
}

#pragma mark - get

- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - NavigationBarAndStatusHeight)];
    }
    return _webView;
}
- (UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 2)];
        _progressView.progressTintColor = [UIColor colorWithRed:0 green:210/255.0 blue:0 alpha:1.0];
        _progressView.trackTintColor = [UIColor clearColor];
    }
    return _progressView;
}

#pragma mark -

- (void)dealloc{
    
    [_webView removeObserver:self forKeyPath:@"estimatedProgress" context:nil];
}

@end

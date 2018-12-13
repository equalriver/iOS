//
//  WLKTBankCardTVC.m
//  wlkt
//
//  Created by 尹平江 on 17/3/28.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTBankCardTVC.h"
#import "WLKTLogin.h"
#import <WebKit/WebKit.h>
#import "WLKTBankCardApi.h"

@interface WLKTBankCardTVC ()<WKNavigationDelegate, WKUIDelegate>

//@property (strong, nonatomic) UITableView *cardInfoTableView;
@property (strong, nonatomic)  WKWebView *webView;
@property (strong, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) UIBarButtonItem *popBarItem;
@property (strong, nonatomic) UIBarButtonItem *backBarItem;
@end

@implementation WLKTBankCardTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的钱包";

    self.backBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"箭头左"] style:UIBarButtonItemStylePlain target:self action:@selector(h5BackAct:)];
    self.popBarItem = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonAct)];
    
    self.navigationItem.leftBarButtonItems = @[self.backBarItem, self.popBarItem];
    
    WLKTBankCardApi *api = [[WLKTBankCardApi alloc]init];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        //NSLog(@"天府银行卡-----%@", request.responseJSONObject[@"result"]);
        NSString *urlStr = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"result"]];
        NSString *errorCode = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"errorCode"]];
        if ([errorCode isEqualToString:@"0"]) {
            if (urlStr.length > 10) {
                NSURL *url = [NSURL URLWithString:request.responseJSONObject[@"result"]];
                NSURLRequest *bankRequest = [NSURLRequest requestWithURL:url];
                [self.webView loadRequest:bankRequest];
            }
        }
        else{
            [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"%@", request.responseJSONObject[@"message"]]];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
        }

        
    } failure:^(__kindof YTKBaseRequest *request) {
        //ShowApiError;
    }];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
   
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
}

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
//    if ([SVProgressHUD isVisible]) {
//        [SVProgressHUD dismiss];
//        
//    }
}
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    //[SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",error]];
    //[SVProgressHUD setMaximumDismissTimeInterval:3];
    //[SVProgressHUD showErrorWithStatus:@"网络连接失败"];
    NSLog(@"=========webView error: %@=========", error);
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:
(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSString *hostname = [NSString stringWithFormat:@"%@", navigationAction.request.URL];
    if ([hostname containsString:@"close.html"]) {
        // 不允许web内跳转
        decisionHandler(WKNavigationActionPolicyCancel);
        [self.navigationController popViewControllerAnimated:YES];
    }
//    else if ([hostname containsString:@"/tab/self"] || [hostname containsString:@"tfcf/index.jsp"]) {//tfcf/index.jsp?
//        decisionHandler(WKNavigationActionPolicyAllow);
//        self.navigationItem.leftBarButtonItems = @[self.backBarItem];
//        
//    }
    else {
        decisionHandler(WKNavigationActionPolicyAllow);
        //self.navigationItem.leftBarButtonItems = @[self.backBarItem, self.popBarItem];
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



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - get

- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64)];
    }
    return _webView;
}
- (UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.width, 2)];
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

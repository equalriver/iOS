//
//  WLKTOtherURLVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/13.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTOtherURLVC.h"
#import "WLKTLogin.h"
#import <WebKit/WebKit.h>

@interface WLKTOtherURLVC ()

@property (strong, nonatomic)  WKWebView *webView;
@property (strong, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) UIBarButtonItem *popBarItem;
@property (strong, nonatomic) UIBarButtonItem *backBarItem;

@property (copy, nonatomic) NSString *url;
@end

@implementation WLKTOtherURLVC
- (instancetype)initWithURL:(NSString *)url
{
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"网页链接";
    
    self.backBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"箭头左"] style:UIBarButtonItemStylePlain target:self action:@selector(h5BackAct:)];
    self.popBarItem = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonAct)];
    
    self.navigationItem.leftBarButtonItems = @[self.backBarItem, self.popBarItem];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [self.webView loadRequest:req];

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
        _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 2)];
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


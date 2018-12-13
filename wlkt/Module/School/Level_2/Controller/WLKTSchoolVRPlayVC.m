//
//  WLKTSchoolVRPlayVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/18.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTSchoolVRPlayVC.h"
#import <WebKit/WebKit.h>

@interface WLKTSchoolVRPlayVC ()
@property (strong, nonatomic) WKWebView *webView;
@property (strong, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) UIView *overView;

@property (strong, nonatomic) WLKTSchoolVRList *data;
@end

@implementation WLKTSchoolVRPlayVC
- (instancetype)initWithVRListData:(WLKTSchoolVRList *)data
{
    self = [super init];
    if (self) {
        _data = data;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.data.name;

    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - NavigationBarAndStatusHeight)];
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    [self.view addSubview:self.overView];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:@"WLKTSchoolVRPlayVC"];
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:self.data.vrurl]];
    [self.webView loadRequest:req];
}

- (void)dealloc{
    [_webView removeObserver:self forKeyPath:@"estimatedProgress" context:@"WLKTSchoolVRPlayVC"];
}

#pragma mark - kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
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
- (UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 3)];
        _progressView.progressTintColor = [UIColor colorWithRed:0 green:210/255.0 blue:0 alpha:1.0];
        _progressView.trackTintColor = [UIColor clearColor];
    }
    return _progressView;
}
- (UIView *)overView{
    if (!_overView) {
        _overView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth/2, 100 *ScreenRatio_6)];
        _overView.backgroundColor = [UIColor clearColor];
    }
    return _overView;
}



@end

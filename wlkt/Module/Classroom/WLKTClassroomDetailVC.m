//
//  WLKTClassroomDetailVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/31.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTClassroomDetailVC.h"
#import <AliyunVodPlayerViewSDK/AliyunVodPlayerViewSDK.h>
#import "WLKTCustomShare.h"
#import <sys/utsname.h>
#import "WLKTClassroomDetailData.h"
#import "WLKTClassroomDetailApi.h"
#import "WLKTGetVideoTokenApi.h"
#import "WLKTGetVideoTokenData.h"

@interface WLKTClassroomDetailVC ()<UITableViewDelegate, UITableViewDataSource, UIWebViewDelegate, AliyunVodPlayerViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) AliyunVodPlayerView *playerView;
@property (strong, nonatomic) UIView *headerView;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) BOOL isLock;
@property (nonatomic, assign) BOOL isStatusHidden;
@property (nonatomic) BOOL isLoadWeb;
@property (nonatomic) CGFloat webHeight;
@property (copy, nonatomic) NSString *cid;
@property (strong, nonatomic) WLKTClassroomDetailData *data;
@property (nonatomic) CGFloat titleHeight;
@end

#define kWebHeight 50
#define VIEWSAFEAREAINSETS(view) ({UIEdgeInsets i; if(@available(iOS 11.0, *)) {i = view.safeAreaInsets;} else {i = UIEdgeInsetsZero;} i;})

@implementation WLKTClassroomDetailVC
- (instancetype)initWithId:(NSString *)cid
{
    self = [super init];
    if (self) {
        _cid = cid;
        [self.view addSubview:self.tableView];
        [self.view addSubview:self.headerView];
        [self makeConstraints];
    }
    return self;
}

- (void)makeConstraints{
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.left.mas_equalTo(self.view);
        make.height.mas_equalTo(ScreenWidth * 9/16.0);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.width.mas_equalTo(self.view);
        make.top.mas_equalTo(self.headerView.mas_bottom);
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (IsIOS_11_Later) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.webHeight = kWebHeight;
    self.isStatusHidden = YES;
    UIBarButtonItem *share = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"分享b"] style:UIBarButtonItemStylePlain target:self action:@selector(shareAct)];
    self.navigationItem.rightBarButtonItem = share;
    
    [self.webView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:@"WLKTClassroomDetailVC"];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(becomeActiveAct) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(resignActiveAct) name:UIApplicationWillResignActiveNotification object:nil];
    
    [self loadData];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self setHeaderViewWithTitle:self.data.title hits:self.data.hits];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.isStatusHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    if (self.playerView != nil) {
        [self.playerView pause];

    }
}

- (void)dealloc{

    [self.webView.scrollView removeObserver:self forKeyPath:@"contentSize" context:@"WLKTClassroomDetailVC"];
    
    if (self.playerView != nil) {
        [self.playerView stop];
        [self.playerView releasePlayer];
        [self.playerView removeFromSuperview];
        self.playerView = nil;
    }
}

- (BOOL)prefersStatusBarHidden{
    return self.isStatusHidden;
}

- (void)setHeaderViewWithTitle:(NSString *)title hits:(NSString *)hits{
    self.playerView = [[AliyunVodPlayerView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, ScreenWidth * 9/16.0) andSkin:AliyunVodPlayerViewSkinRed];
    
    CGFloat titleH = [title getSizeWithWidth:ScreenWidth - 20*ScreenRatio_6 Font:16 *ScreenRatio_6].height;
    self.titleHeight = titleH;
    [self.headerView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.width.left.mas_equalTo(self.view);
        make.height.mas_equalTo(ScreenWidth * 9/16.0 + 50 +titleH);
    }];
    self.headerView.backgroundColor = [UIColor whiteColor];
    [self.headerView addSubview:self.playerView];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.font = [UIFont systemFontOfSize:15 *ScreenRatio_6 weight:UIFontWeightSemibold];
    titleLabel.textColor = KMainTextColor_3;
    titleLabel.numberOfLines = 0;
    titleLabel.text = title;
    [self.headerView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(ScreenWidth -20 *ScreenRatio_6);
        make.left.mas_equalTo(self.headerView).offset(10 *ScreenRatio_6);
        make.top.mas_equalTo(self.playerView.mas_bottom).offset(15);
    }];
    
    UILabel *hitLabel = [UILabel new];
    hitLabel.font = [UIFont systemFontOfSize:10 *ScreenRatio_6];
    hitLabel.textColor = KMainTextColor_9;
    hitLabel.text = hits ? [NSString stringWithFormat:@"最近%@人在学习", hits] : @"";
    [self.headerView addSubview:hitLabel];
    [hitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.mas_equalTo(titleLabel);
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(10 *ScreenRatio_6);
    }];
    
}

#pragma mark -
- (void)setPlayerViewData:(WLKTClassroomDetailData *)data token:(WLKTGetVideoTokenData *)token{
    //测试封面地址，请使用https 地址。
    //    self.playerView.coverUrl = [NSURL URLWithString:@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4046104436,1338839104&fm=27&gp=0.jpg"];
//    [self.playerView setTitle:data.title];
    self.playerView.isScreenLocked = NO;
    self.playerView.fixedPortrait = NO;
    self.isLock = self.playerView.isScreenLocked || self.playerView.fixedPortrait ? YES : NO;
    //    self.playerView.circlePlay = YES;
    [self.playerView setDelegate:self];
    [self.playerView setAutoPlay:YES];
    //边下边播缓存沙箱位置
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [pathArray objectAtIndex:0];
    //maxsize:单位 mb    maxDuration:单位秒 ,在prepare之前调用。
    [self.playerView setPlayingCache:YES saveDir:docDir maxSize:100 maxDuration:5000];
    
    //    //隐藏全屏显示按钮
    //    if (self.playerView.subviews.count > 2) {
    //        NSArray *arr = self.playerView.subviews[2].subviews;
    //        for (UIView *v in arr) {
    //            if (v.tag == 2) {
    //                v.hidden = YES;
    //            }
    //        }
    //    }
    
    //查看缓存文件时打开。
    //    self.timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(timerun) userInfo:nil repeats:YES];
    
    //播放器播放方式
    [self.playerView playViewPrepareWithVid:data.video accessKeyId:token.AccessKeyId accessKeySecret:token.AccessKeySecret securityToken:token.SecurityToken];
    
}


- (void)loadData{
    self.tableView.state = WLKTViewStateLoading;
    WLKTClassroomDetailApi *api = [[WLKTClassroomDetailApi alloc]initWithId:self.cid];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        self.tableView.state = WLKTViewStateNormal;
        self.data = [WLKTClassroomDetailData modelWithJSON:request.responseJSONObject[@"result"][@"info"]];
        
        [self setHeaderViewWithTitle:self.data.title hits:self.data.hits];
        [self.webView loadHTMLString:self.data.content baseURL:nil];
        
        WLKTGetVideoTokenApi *api = [[WLKTGetVideoTokenApi alloc]init];
        [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            WLKTGetVideoTokenData *data = [WLKTGetVideoTokenData modelWithJSON:request.responseJSONObject[@"Credentials"]];
            
            [self setPlayerViewData:self.data token:data];
            
        } failure:^(__kindof YTKBaseRequest *request) {

        }];

        [self.tableView reloadData];
            
        
    } failure:^(__kindof YTKBaseRequest *request) {
        self.tableView.state = WLKTViewStateError;
        WS(weakSelf);
        self.tableView.emptyButtonClickBlock = ^{
            [weakSelf loadData];
        };
    }];
}

#pragma mark - table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.webHeight +50;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];
    [cell.contentView addSubview:self.webView];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (!self.data) {
        return [UIView new];
    }
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 55)];
    v.backgroundColor = [UIColor whiteColor];
    
    UIView *sepHead = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 5)];
    sepHead.backgroundColor = separatorView_color;
    [v addSubview:sepHead];
    
    UIView *separatorView = [UIView new];
    separatorView.backgroundColor = UIColorHex(33c4da);
    [v addSubview:separatorView];
    [separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(2, 20));
        make.top.mas_equalTo(sepHead.mas_bottom).offset(10);
        make.left.mas_equalTo(v).offset(10);
    }];
    
    UILabel *title = [UILabel new];
    title.font = [UIFont systemFontOfSize:15 *ScreenRatio_6];
    title.textColor = [UIColor blackColor];
    [v addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(separatorView.mas_right).offset(10);
        make.centerY.mas_equalTo(separatorView);
    }];
    title.text = @"介绍";
    
    UIView *sep = [UIView new];
    sep.backgroundColor = separatorView_color;
    [v addSubview:sep];
    [sep mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.left.bottom.mas_equalTo(v);
    }];
    return v;
    
}

#pragma mark - action
- (void)shareAct{
//    if (self.data.shareappurl) {
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSNSPush"];
//        WLKTCustomShare *v = [[WLKTCustomShare alloc]initWithTitle:self.data.title detail:nil urlImage:self.data.image url:self.data.shareappurl taget:self height:ScreenHeight - NavigationBarAndStatusHeight];
//        [self.view addSubview:v];
//    }
}

- (void)becomeActiveAct{
    if (self.playerView.isPlaying) {
        [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"isSNSPush"];
        [self.playerView resume];
    }
}


- (void)resignActiveAct{
    if (self.playerView.isPlaying) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSNSPush"];
        [self.playerView pause];
    }
}

- (void)monitoringNetworkForVideo:(void(^)(void))handle{
    if (![YYReachability reachability].reachable) {
        return;
    }
    if ([YYReachability reachability].status == YYReachabilityStatusWWAN) {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:@"当前为移动网络，播放将产生流量费用！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *def = [UIAlertAction actionWithTitle:@"继续播放" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            !handle ?: handle();
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消播放" style:UIAlertActionStyleCancel handler:nil];
        [ac addAction:def];
        [ac addAction:cancel];
        [self presentViewController:ac animated:YES completion:nil];
    }
    else{
        !handle ?: handle();
    }
}

#pragma mark - web view
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    if(webView.scrollView.contentSize.height > 0){
        self.isLoadWeb = YES;
    }
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [SVProgressHUD showErrorWithStatus:error.localizedDescription];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"contentSize"]) {
        UIScrollView *s = (UIScrollView *)object;
        NSLog(@"s.contentSize.height:  %f", s.contentSize.height);
        self.webView.frame = CGRectMake(0, 0, ScreenWidth, s.contentSize.height);
        self.webHeight = s.contentSize.height;
//        self.webHeadView.frame = CGRectMake(0, 0, ScreenWidth, s.contentSize.height +100);
        [self.tableView reloadData];
    }
}

#pragma mark - AliyunVodPlayerViewDelegate
- (void)onBackViewClickWithAliyunVodPlayerView:(AliyunVodPlayerView *)playerView{
    if (self.playerView != nil) {
        [self.playerView stop];
        [self.playerView releasePlayer];
        [self.playerView removeFromSuperview];
        self.playerView = nil;
    }
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)aliyunVodPlayerView:(AliyunVodPlayerView*)playerView onPause:(NSTimeInterval)currentPlayTime{
    
}
- (void)aliyunVodPlayerView:(AliyunVodPlayerView*)playerView onResume:(NSTimeInterval)currentPlayTime{
    
}
- (void)aliyunVodPlayerView:(AliyunVodPlayerView*)playerView onStop:(NSTimeInterval)currentPlayTime{
    
}
- (void)aliyunVodPlayerView:(AliyunVodPlayerView*)playerView onSeekDone:(NSTimeInterval)seekDoneTime{
    
}

- (void)aliyunVodPlayerView:(AliyunVodPlayerView *)playerView lockScreen:(BOOL)isLockScreen{
    self.isLock = isLockScreen;
}


- (void)aliyunVodPlayerView:(AliyunVodPlayerView*)playerView onVideoQualityChanged:(AliyunVodPlayerVideoQuality)quality{
    
}

- (void)aliyunVodPlayerView:(AliyunVodPlayerView *)playerView fullScreen:(BOOL)isFullScreen{
    NSLog(@"isfullScreen --%d",isFullScreen);

    [self setNeedsStatusBarAppearanceUpdate];
    
    if (isFullScreen) {
        self.tableView.scrollEnabled = false;
        [self.headerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(ScreenWidth * 9/16.0 + 50 +self.titleHeight);
        }];
        [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.width.mas_equalTo(self.view);
            make.top.mas_equalTo(self.headerView.mas_bottom);
        }];
        
    }
    else{
        self.tableView.scrollEnabled = YES;
        [self.headerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(ScreenWidth * 9/16.0 + 50 +self.titleHeight);
        }];
        [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.width.mas_equalTo(self.view);
            make.top.mas_equalTo(self.headerView.mas_bottom);
        }];
        
    }
    [self.tableView reloadData];
    
}

- (void)onCircleStartWithVodPlayerView:(AliyunVodPlayerView *)playerView {
    
}


- (void)onFinishWithAliyunVodPlayerView:(AliyunVodPlayerView *)playerView {
    
}

#pragma mark - 锁屏功能
/**
 * 说明：播放器父类是UIView。
 屏幕锁屏方案需要用户根据实际情况，进行开发工作；
 如果viewcontroller在navigationcontroller中，需要添加子类重写navigationgController中的 以下方法，根据实际情况做判定 。
 */

- (BOOL)shouldAutorotate{
    return !self.isLock;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    if (self.isLock) {
        return UIInterfaceOrientationMaskPortrait;
    }else{
        return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft |UIInterfaceOrientationMaskLandscapeRight;
        
    }
}

- (NSString *)iphoneType {
    struct utsname platformInfo;
    uname(&platformInfo);
    NSString *platform = [NSString stringWithCString: platformInfo.machine encoding:NSASCIIStringEncoding];
    return platform;
}

/*
//适配iphone x 界面问题，没有在 viewSafeAreaInsetsDidChange 这里做处理 ，主要 旋转监听在 它之后获取。
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSString *platform =  [self iphoneType];
    
    //iphone x
    if (![platform isEqualToString:@"iPhone10,3"] && ![platform isEqualToString:@"iPhone10,6"]) {
        return;
    }
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000
    UIDevice *device = [UIDevice currentDevice] ;
    switch (device.orientation) {//device.orientation
        case UIDeviceOrientationFaceUp:
        case UIDeviceOrientationFaceDown:
        case UIDeviceOrientationUnknown:
        case UIDeviceOrientationPortraitUpsideDown:{
            if (self.isStatusHidden) {
                CGRect frame = self.playerView.frame;
                frame.origin.x = VIEWSAFEAREAINSETS(self.view).left;
                frame.origin.y = VIEWSAFEAREAINSETS(self.view).top;
                frame.size.width = ScreenWidth - VIEWSAFEAREAINSETS(self.view).left *2;
                frame.size.height = ScreenHeight - VIEWSAFEAREAINSETS(self.view).bottom - VIEWSAFEAREAINSETS(self.view).top;
                self.playerView.frame = frame;
            }else{
                CGRect frame = self.playerView.frame;
                frame.origin.y = VIEWSAFEAREAINSETS(self.view).top;
                //竖屏全屏时 isStatusHidden 来自是否 旋转回调。
                if (self.playerView.fixedPortrait && self.isStatusHidden) {
                    frame.size.height = ScreenHeight - VIEWSAFEAREAINSETS(self.view).top - VIEWSAFEAREAINSETS(self.view).bottom;
                }
                self.playerView.frame = frame;
            }
        }
            break;
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight:
        {
            //
            CGRect frame = self.playerView.frame;
            frame.origin.x = VIEWSAFEAREAINSETS(self.view).left;
            frame.origin.y = VIEWSAFEAREAINSETS(self.view).top;
            frame.size.width = ScreenWidth - VIEWSAFEAREAINSETS(self.view).left*2;
            frame.size.height = ScreenHeight - VIEWSAFEAREAINSETS(self.view).bottom;
            self.playerView.frame = frame;
        }
            
            break;
        case UIDeviceOrientationPortrait:
        {
            //
            CGRect frame = self.playerView.frame;
            frame.origin.y = VIEWSAFEAREAINSETS(self.view).top;
            //竖屏全屏时 isStatusHidden 来自是否 旋转回调。
            if (self.playerView.fixedPortrait && self.isStatusHidden) {
                frame.size.height = ScreenHeight - VIEWSAFEAREAINSETS(self.view).top - VIEWSAFEAREAINSETS(self.view).bottom;
            }
            self.playerView.frame = frame;
            
        }
            break;
        default:
            
            break;
    }
    
#else
#endif
    NSLog(@"top----%f",self.playerView.frame.origin.y);
    
}
 */

#pragma mark - get
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [UIView new];
    }
    return _headerView;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectNull style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = separatorView_color;
    }
    return _tableView;
}
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(10 *ScreenRatio_6, 0, ScreenWidth -20*ScreenRatio_6, 100)];
        _webView.scrollView.showsHorizontalScrollIndicator = false;
        _webView.scrollView.scrollEnabled = false;
        _webView.delegate = self;
        _webView.scrollView.delegate = self;
    }
    return _webView;
}

@end

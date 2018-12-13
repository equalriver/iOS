//
//  WLKTSchoolNewsDetailVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/23.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolNewsDetailVC.h"
#import "WLKTSchoolNewsDetailBottomBtns.h"
#import <WebKit/WebKit.h>
#import "WLKTSchoolNewsDetailCommentAlertView.h"
#import "WLKTSchoolNewsDetailApi.h"
#import "WLKTSchoolNewsDetailData.h"
#import "WLKTSchoolNewsCell.h"
#import "WLKTCustomShare.h"
#import "WLKTSchoolCommentReportApi.h"
#import "WLKTSchoolCommentGoReportVC.h"
#import "WLKTSchoolCommentListApi.h"
#import "WLKTSchoolNewsCollectApi.h"
#import "WLKTSchoolNewsCollectCancelApi.h"
#import "WLKTLogin.h"
#import "WLKTSchoolNewsGoReportVC.h"
#import "WLKTSchoolNewsDetailLikeApi.h"
#import "WLKTSchoolCommentLikeApi.h"
#import "WLKTSchoolGoCommentApi.h"
#import "WLKTNewsDetailCommentCell.h"
#import "WLKTNewsDetailCommentReply.h"
#import "WLKTNewsCommentReplyVC.h"
#import "WLKTCommentReplyApi.h"

@interface WLKTSchoolNewsDetailVC ()<UITableViewDelegate, UITableViewDataSource, SchoolNewsDetailBottomDelegate, SchoolNewsDetailCommentAlertDelegate, WKNavigationDelegate, NewsDetailCommentCellDelegate, NewsDetailCommentReplyDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView *webHeadView;
@property (strong, nonatomic) WLKTSchoolNewsDetailBottomBtns *bottombtns;
@property (strong, nonatomic) WLKTSchoolNewsDetailCommentAlertView *commentAlert;
@property (strong, nonatomic) UIImageView *likeBgIV;
@property (strong, nonatomic) UIImageView *likeIV;
@property (strong, nonatomic) UILabel *likeLabel;
@property (strong, nonatomic) WKWebView *webView;
@property (strong, nonatomic) UIProgressView *progressView;

@property (assign) BOOL isLoadWeb;
@property (assign) CGFloat webHeight;
@property (copy, nonatomic) NSString *nid;
@property (strong, nonatomic) WLKTSchoolNewsDetailData *data;
@property (strong, nonatomic) NSMutableArray<WLKTNewsDetailReplyList *> *commentArr;
@property (assign) NSInteger page;
@end

#define kWebHeight ScreenHeight - 50

@implementation WLKTSchoolNewsDetailVC
- (instancetype)initWithNewsId:(NSString *)nid
{
    self = [super init];
    if (self) {
        _nid = nid;
        [self.view addSubview:self.tableView];
        [self.view addSubview:self.bottombtns];
        [self.view addSubview:self.progressView];
        [self makeConstraints];
    }
    return self;
}

- (void)makeConstraints{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(ScreenWidth);
        make.top.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.bottombtns.mas_top);
    }];
    [self.bottombtns mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 50));
        make.top.mas_equalTo(self.tableView.mas_bottom);
        make.left.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻正文";
    self.webHeight = kWebHeight;
    self.page = 1;
    [self.webView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:@"WLKTSchoolNewsDetailVC"];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    

    UIBarButtonItem *share = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"分享b"] style:UIBarButtonItemStylePlain target:self action:@selector(shareAct)];
    self.navigationItem.rightBarButtonItem = share;
    [self loadData];
}

- (void)dealloc{
    [self.webView.scrollView removeObserver:self forKeyPath:@"contentSize" context:@"WLKTSchoolNewsDetailVC"];
    [_webView removeObserver:self forKeyPath:@"estimatedProgress" context:nil];
}

- (void)loadData{
    self.tableView.state = WLKTViewStateLoading;
    WLKTSchoolNewsDetailApi *api = [[WLKTSchoolNewsDetailApi alloc]initWithNewsId:self.nid];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        self.tableView.state = WLKTViewStateNormal;
        self.data = [WLKTSchoolNewsDetailData modelWithJSON:request.responseJSONObject[@"result"]];
        [self.commentArr removeAllObjects];
        [self.commentArr addObjectsFromArray:self.data.commentlist];
        if (self.data) {
            dispatch_async(dispatch_get_main_queue(), ^{
//                [self setTableViewHeadView];
                NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:self.data.info]];
                self.likeLabel.text = [NSString stringWithFormat:@"(%@)", self.data.zan_num];
                [self.webView loadRequest:req];
                [self.tableView reloadData];
            });
        }
    } failure:^(__kindof YTKBaseRequest *request) {
        self.tableView.state = WLKTViewStateError;
        WS(weakSelf);
        self.tableView.emptyButtonClickBlock = ^{
            [weakSelf loadData];
        };
    }];
}

#pragma mark -
- (void)setTableViewHeadView{
    self.tableView.tableHeaderView = self.webHeadView;
    [self.webHeadView addSubview:self.webView];
    [self.webHeadView addSubview:self.likeBgIV];
    [self.webHeadView addSubview:self.likeIV];
    [self.webHeadView addSubview:self.likeLabel];
    
}

- (void)makeHeadViewConstraints{
    [self.likeBgIV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.webHeadView.mas_bottom).offset(-15);
        make.centerX.mas_equalTo(self.webHeadView);
    }];
    [self.likeIV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.likeBgIV);
        make.top.mas_equalTo(self.likeBgIV).offset(5);
    }];
    [self.likeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.webHeadView);
        make.top.mas_equalTo(self.likeIV.mas_bottom);
    }];
//    [self.webView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.width.mas_equalTo(self.webHeadView);
//        make.bottom.mas_equalTo(self.likeBgIV.mas_top).offset(-15);
//    }];
}

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.isLoadWeb) {
        return 2;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.data.list.count;
    }
    if (section == 1) {
        return self.commentArr.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        NSInteger count = self.data.list[indexPath.row].imglist.count;
        if (count == 0) {//无图片
            return 145;
        }
        if (count == 1) {//有视频
            return 130;
        }
        if (count > 1) {//有图片
            return 190;
        }
    }
    if (indexPath.section == 1) {
        CGFloat h = 85;
        h += [self.commentArr[indexPath.row].content getSizeWithWidth:ScreenWidth - 20 Font:14.5].height;
        if (self.commentArr[indexPath.row].reply.content.length) {
            h += [self.commentArr[indexPath.row].reply.content getSizeWithWidth:ScreenWidth - 20 Font:14.5].height;
            if (self.commentArr[indexPath.row].replycount.integerValue > 1) {
                h += 20;
            }
            h += 60;
        }
        return h;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return 30;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];
    if (indexPath.section == 0 && self.data.list.count) {//新闻
        WLKTSchoolNewsCell *nc = [tableView dequeueReusableCellWithIdentifier:@"WLKTSchoolNewsCell"];
        if (nc == nil) {
            nc = [[WLKTSchoolNewsCell alloc]init];
        }
        [nc setCellData:self.data.list[indexPath.row]];
        cell = nc;
    }
    if (indexPath.section == 1) {//评论
        BOOL state = YES;
        if (self.commentArr[indexPath.row].reply.content.length) {
            state = false;
        }
        WLKTNewsDetailCommentCell *cc = [tableView dequeueReusableCellWithIdentifier:@"WLKTNewsDetailCommentCell"];
        if (cc == nil) {
            cc = [[WLKTNewsDetailCommentCell alloc]initWithSingleState:state];
        }
        cc.delegate = self;
        [cc setCellData:self.commentArr[indexPath.row] indexPath:indexPath];
        cell = cc;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (!self.isLoadWeb) {
        return [UIView new];
    }
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    UIView *separatorView = [UIView new];
    separatorView.backgroundColor = UIColorHex(33c4da);
    [v addSubview:separatorView];
    [separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(2, 20));
        make.centerY.mas_equalTo(v);
        make.left.mas_equalTo(v).offset(10);
    }];
    
    UILabel *title = [UILabel new];
    title.font = [UIFont systemFontOfSize:15 * ScreenRatio_6];
    title.textColor = [UIColor blackColor];
    [v addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(separatorView.mas_right).offset(10);
        make.centerY.mas_equalTo(v);
    }];
    
    if (section == 0 && self.isLoadWeb) {
        title.text = @"热门新闻";
    }
    if (section == 1 && self.isLoadWeb) {
        title.text = [NSString stringWithFormat:@"全部评论(%ld)", self.data.commentlist.count ? self.data.commentlist.count : 0];
    }
    
    return v;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 1 && self.data.commentlist.count) {
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
        v.backgroundColor = UIColorHex(ffffff);
        
        UIButton *allBtn = [UIButton new];
        [allBtn setTitle:@"加载更多" forState:UIControlStateNormal];
        [allBtn setTitleColor:UIColorHex(33c4da) forState:UIControlStateNormal];
        allBtn.layer.cornerRadius = 10;
        allBtn.titleLabel.font = [UIFont systemFontOfSize:11 * ScreenRatio_6];
        allBtn.layer.masksToBounds = YES;
        allBtn.layer.borderColor = UIColorHex(33c4da).CGColor;
        allBtn.layer.borderWidth = 0.5;
        [allBtn addTarget:self action:@selector(commentMoreAct) forControlEvents:UIControlEventTouchUpInside];
        [v addSubview:allBtn];
        [allBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 20));
            make.center.mas_equalTo(v);
        }];
        return v;
    }
    
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 5)];
    v.backgroundColor = separatorView_color;
    return v;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        WLKTSchoolNewsDetailVC *vc = [[WLKTSchoolNewsDetailVC alloc]initWithNewsId:self.data.list[indexPath.row].nid];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - action
- (void)shareAct{
    if (self.data.shareappurl) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSNSPush"];
        for (UIView *v in self.view.subviews) {
            if ([v isKindOfClass:[WLKTCustomShare class]]) {
                [v removeFromSuperview];
            }
        }
        WLKTCustomShare *v = [[WLKTCustomShare alloc]initWithTitle:self.data.title detail:nil urlImage:self.data.image url:self.data.shareappurl taget:self height:ScreenHeight - NavigationBarAndStatusHeight];
        [self.view addSubview:v];
    }
}


- (void)commentMoreAct{
    [SVProgressHUD show];
    WLKTSchoolCommentListApi *api = [[WLKTSchoolCommentListApi alloc]initWithNewsId:self.nid page:self.page + 1];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        [SVProgressHUD dismiss];
        NSArray *arr = [NSArray modelArrayWithClass:[WLKTSchoolNewsDetailComment class] json:request.responseJSONObject[@"result"]];
        [self.commentArr addObjectsFromArray:arr];
        if (arr.count == 0) {
            [SVProgressHUD showInfoWithStatus:@"没有更多了"];
            self.page--;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadSection:1 withRowAnimation:UITableViewRowAnimationNone];
            self.page++;
        });
    } failure:^(__kindof YTKBaseRequest *request) {
        ShowApiError
    }];
}

- (void)likeAct{
    WLKTSchoolNewsDetailLikeApi *api = [[WLKTSchoolNewsDetailLikeApi alloc]initWithNewsId:self.nid];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"%@", request.responseJSONObject[@"message"]]];
        NSString *zan_num = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"zan_num"]];
        if (zan_num.integerValue) {
            self.likeLabel.text = [NSString stringWithFormat:@"(%@)", zan_num];
        }
        
    } failure:^(__kindof YTKBaseRequest *request) {
        ShowApiError
    }];
}

#pragma mark - webView delegate
//- (void)webViewDidStartLoad:(UIWebView *)webView{
//    [SVProgressHUD show];
//}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    if(webView.scrollView.contentSize.height > 0){
//        [SVProgressHUD dismiss];
        [self setTableViewHeadView];
        self.isLoadWeb = YES;
    }
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [SVProgressHUD showErrorWithStatus:error.localizedDescription];
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    if(webView.scrollView.contentSize.height > 0){
        [self setTableViewHeadView];
        [self makeHeadViewConstraints];
        self.isLoadWeb = YES;
    }
}

#pragma mark - kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"contentSize"]) {
        UIScrollView *s = (UIScrollView *)object;
        NSLog(@"s.contentSize.height:  %f", s.contentSize.height);
        self.webView.frame = CGRectMake(0, 0, ScreenWidth, s.contentSize.height);
        self.webHeadView.frame = CGRectMake(0, 0, ScreenWidth, s.contentSize.height +100);
//        [self makeHeadViewConstraints];
        [self.tableView reloadData];

    }
    
    if ([keyPath isEqualToString:@"estimatedProgress"])
    {
        self.progressView.alpha = 1.0;
        self.progressView.progress = self.webView.estimatedProgress;
    }
        // 加载完成
    if (self.progressView.progress == 1.0){
        
        [UIView animateWithDuration:0.5 animations:^{
            self.progressView.alpha = 0.0;
        }];
    }
}

#pragma mark - bottom buttons delegate
- (void)schoolNewsDetailBottomButtonDidSelected:(UIButton *)button{
    if (button.tag == 0) {//举报
        WLKTSchoolNewsGoReportVC *vc = [[WLKTSchoolNewsGoReportVC alloc]initWithNewsId:self.nid];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (button.tag == 1) {//收藏
        if (!TheCurUser) {
            [SVProgressHUD showInfoWithStatus:@"请先登录"];
            return;
        }
        [SVProgressHUD show];
        if ([button.titleLabel.text isEqualToString:@"收 藏"]) {
            WLKTSchoolNewsCollectApi *api = [[WLKTSchoolNewsCollectApi alloc]initWithNewsId:self.nid];
            [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SVProgressHUD dismiss];
                    [button setTitle:@"已收藏" forState:UIControlStateNormal];
                    [button setImage:[UIImage imageNamed:@"课程详情已收藏"] forState:UIControlStateNormal];
                });
            } failure:^(__kindof YTKBaseRequest *request) {
                ShowApiError
            }];
        }
        else{//取消收藏
            WLKTSchoolNewsCollectCancelApi *api = [[WLKTSchoolNewsCollectCancelApi alloc]initWithNewsId:self.nid];
            [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SVProgressHUD dismiss];
                    [button setTitle:@"收 藏" forState:UIControlStateNormal];
                    [button setImage:[UIImage imageNamed:@"课程详情未收藏"] forState:UIControlStateNormal];
                });
            } failure:^(__kindof YTKBaseRequest *request) {
                ShowApiError
            }];
        }
    }
    if (button.tag == 2) {//我要评论
        [self.view addSubview:self.commentAlert];
    }
}

#pragma mark - comment cell delegate
- (void)didClickViewAllReplyButtonWithIndexPath:(NSIndexPath *)indexPath{//查看全部回复
    WLKTNewsCommentReplyVC *vc = [[WLKTNewsCommentReplyVC alloc]initWithCommentId:self.commentArr[indexPath.row].cid];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didSelectedNewsDetailCommentButtonByType:(NewsDetailCommentType)type button:(UIButton *)button indexPath:(NSIndexPath *)indexPath{
    if (type == NewsDetailCommentLike) {//点赞
        [SVProgressHUD show];
        WLKTSchoolCommentLikeApi *api = [[WLKTSchoolCommentLikeApi alloc]initWithCommentId:self.commentArr[indexPath.row].cid];
        [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            [SVProgressHUD dismiss];
            NSString *message = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"message"]];
            if ([message containsString:@"已经赞"]) {
                [SVProgressHUD showInfoWithStatus:message];
            }
            else{
                [button setSelected:YES];
                NSString *zan_num = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"zan_num"]];
                [button setTitle:[NSString stringWithFormat:@" 赞 %@", zan_num] forState:UIControlStateNormal];
            }
            
        } failure:^(__kindof YTKBaseRequest *request) {
            ShowApiError
        }];
    }
    if (type == NewsDetailCommentReport) {//举报
        WLKTSchoolCommentGoReportVC *vc = [[WLKTSchoolCommentGoReportVC alloc]initWithNewsComment:self.commentArr[indexPath.row] success:^{
            [button setTitle:@" 已举报" forState:UIControlStateNormal];
        }];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (type == NewsDetailCommentReply) {//回复
        if ([button.titleLabel.text isEqualToString:@"回复"]) {
            WLKTNewsDetailCommentReply *r = [[WLKTNewsDetailCommentReply alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight -IphoneXBottomInsetHeight) placeholder:[NSString stringWithFormat:@"回复@%@", self.commentArr[indexPath.row].username] index:indexPath.row isPushVC:YES];
            r.delegate = self;
            [self.view addSubview:r];
        }
        else{
            WLKTNewsCommentReplyVC *vc = [[WLKTNewsCommentReplyVC alloc]initWithCommentId:self.commentArr[indexPath.row].cid];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

#pragma mark - NewsDetailCommentReplyDelegate
- (void)didFinishWithReply:(NSString *)reply index:(NSInteger)index completion:(void (^)(BOOL))completion{
    WLKTCommentReplyApi *api = [[WLKTCommentReplyApi alloc]initWithCommentId:self.commentArr[index].cid content:reply];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        [SVProgressHUD showInfoWithStatus:request.responseJSONObject[@"message"]];
        [self loadData];
        completion(YES);
    } failure:^(__kindof YTKBaseRequest *request) {
        
    }];
}

#pragma mark - comment alert delegate
- (void)didFinishWithComment:(NSString *)comment completion:(void (^)(BOOL))completion{
    WLKTSchoolGoCommentApi *api = [[WLKTSchoolGoCommentApi alloc]initWithNewsId:self.nid content:comment];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        completion(YES);
        [self loadData];
        [SVProgressHUD showSuccessWithStatus:@"评论成功!"];
    } failure:^(__kindof YTKBaseRequest *request) {
        ShowApiError
    }];
}

#pragma mark - get
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectNull style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    }
    return _tableView;
}
- (UIView *)webHeadView{
    if (!_webHeadView) {
        _webHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
        _webHeadView.backgroundColor = UIColorHex(ffffff);
    }
    return _webHeadView;
}
- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - NavigationBarAndStatusHeight -50)];
        _webView.scrollView.showsHorizontalScrollIndicator = false;
        _webView.scrollView.scrollEnabled = false;
        _webView.navigationDelegate = self;
        _webView.scrollView.delegate = self;
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
- (WLKTSchoolNewsDetailBottomBtns *)bottombtns{
    if (!_bottombtns) {
        _bottombtns = [[WLKTSchoolNewsDetailBottomBtns alloc]initWithFrame:CGRectNull];
        _bottombtns.delegate = self;
    }
    return _bottombtns;
}
- (WLKTSchoolNewsDetailCommentAlertView *)commentAlert{
//    if (!_commentAlert) {
        _commentAlert = [[WLKTSchoolNewsDetailCommentAlertView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight -IphoneXBottomInsetHeight) isPushViewController:YES];
        _commentAlert.delegate = self;
//    }
    return _commentAlert;
}
- (NSMutableArray<WLKTNewsDetailReplyList *> *)commentArr{
    if (!_commentArr) {
        _commentArr = [NSMutableArray arrayWithCapacity:10];
    }
    return _commentArr;
}

@end

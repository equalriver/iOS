//
//  WLKTLVOpenClassVC.m
//  wlkt
//
//  Created by 尹平江 on 2018/4/26.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTLVOpenClassVC.h"
#import "WLKTLiveVideoCell.h"
#import "WLKTTableviewRefresh.h"
#import "WLKTLiveVideoListApi.h"
#import "WLKTLiveVideoListData.h"

@interface WLKTLVOpenClassVC ()
@property (assign, nonatomic) NSInteger page;
@property (strong, nonatomic) NSMutableArray<WLKTLiveVideoListData *> *dataArr;
@end

@implementation WLKTLVOpenClassVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = kMainBackgroundColor;
    self.page = 1;
    [self setRefresh];
    [self loadData];
}

- (void)setRefresh{
    WS(weakSelf);
    [WLKTTableviewRefresh tableviewRefreshHeaderWithTaget:self.tableView request:^{
        weakSelf.page = 1;
        [weakSelf loadData];
    }];
    
    [WLKTTableviewRefresh tableviewRefreshFooterWithTaget:self.tableView block:^{
        weakSelf.page++;
        [weakSelf loadData];
        
    }];
    self.tableView.mj_footer.backgroundColor = kMainBackgroundColor;
}

- (void)loadData{
    self.tableView.state = WLKTViewStateLoading;
    WLKTLiveVideoListApi *api = [[WLKTLiveVideoListApi alloc]initWithPage:self.page];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        
        self.tableView.state = WLKTViewStateNormal;
        [self.tableView.mj_header endRefreshing];
        NSArray *list = [NSArray modelArrayWithClass:[WLKTLiveVideoListData class] json:request.responseJSONObject[@"result"][@"list"]];
        if (self.page == 1) {
            [self.dataArr removeAllObjects];
        }
        else{
            if (list.count == 0) { [self.tableView.mj_footer endRefreshingWithNoMoreData];}
            
            else{ [self.tableView.mj_footer endRefreshing];}
        }
        [self.dataArr addObjectsFromArray:list];
        [self.tableView reloadData];
        
    } failure:^(__kindof YTKBaseRequest *request) {
        self.tableView.state = WLKTViewStateError;
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        WS(weakSelf);
        self.tableView.emptyButtonClickBlock = ^{
            [weakSelf loadData];
        };
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160 *ScreenRatio_6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WLKTLiveVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLKTLiveVideoCell"];
    
    if (cell == nil) { cell = [[WLKTLiveVideoCell alloc]init];}
    
    cell.data = self.dataArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - get
- (NSMutableArray<WLKTLiveVideoListData *> *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArr;
}
@end

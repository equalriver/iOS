//
//  WLKTSearchResultActiveVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/30.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSearchResultActiveVC.h"
#import "WLKTActivityCell.h"
#import "WLKTActivity.h"
#import "WLKTActivityDetailVC.h"
#import "WLKTTableviewRefresh.h"
#import "WLKTSearchActiveApi.h"

@interface WLKTSearchResultActiveVC ()
@property (strong, nonatomic) NSMutableArray<WLKTActivity *> *dataArr;
@property (assign, nonatomic) int page;

@end

@implementation WLKTSearchResultActiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"WLKTActivityCell" bundle:nil] forCellReuseIdentifier:@"activityCell"];
    [self setRefresh];
}

#pragma mark - network
- (void)requestWithSearchText:(NSString *)searchText page:(int)page{
    [SVProgressHUD show];
    WLKTSearchActiveApi *api = [[WLKTSearchActiveApi alloc]initWithSearchText:searchText page:page];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        [SVProgressHUD dismiss];
        if (self.page == 1) {
            [self.dataArr removeAllObjects];
            [self.tableView.mj_footer resetNoMoreData];
        }
        NSArray *arr = [NSArray modelArrayWithClass:[WLKTActivity class] json:request.responseJSONObject[@"result"][@"list"]];
        if (self.page == 1) {

            if (!arr.count) {
                self.tableView.state = WLKTViewStateEmpty;
                self.tableView.imageForStateEmpty = [UIImage imageNamed:@"message_bg"];
            }
        }
        else{
            if (arr.count) {
                [self.tableView.mj_footer endRefreshing];
            }
            else{
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
        }
        [self.dataArr addObjectsFromArray:arr];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        
    } failure:^(__kindof YTKBaseRequest *request) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        ShowApiError
    }];
}

- (void)setRefresh{
    WS(weakSelf);
    [WLKTTableviewRefresh tableviewRefreshHeaderWithTaget:self.tableView request:^{
        weakSelf.page = 1;
 
        [weakSelf requestWithSearchText:weakSelf.searchText page:weakSelf.page];
    }];
    [WLKTTableviewRefresh tableviewRefreshFooterWithTaget:self.tableView block:^{
        if (weakSelf.dataArr.count) {
            weakSelf.page++;
            [weakSelf requestWithSearchText:weakSelf.searchText page:weakSelf.page];
        }
        else{
            weakSelf.tableView.mj_footer = nil;
        }
    }];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WLKTActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activityCell" forIndexPath:indexPath];
    cell.needLine = YES;
    cell.model = self.dataArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    WLKTActivity *model = self.dataArr[indexPath.row];
    if (!model.subtitle.length) {
        return kActivityCellWithNoContentLabelHeight;
    }
    return kActivityCellWithContentLabelHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WLKTActivity *act = self.dataArr[indexPath.row];
    WLKTActivityDetailVC *vc = [[WLKTActivityDetailVC alloc] initWithActivityId:act.aid];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

#pragma mark - get
- (NSMutableArray<WLKTActivity *> *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end

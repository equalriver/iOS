//
//  WLKTLoginLogTVC.m
//  wlkt
//
//  Created by 尹平江 on 17/3/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTLoginLogTVC.h"
#import "WLKTLoginLogCell.h"
#import "WLKTLogsApi.h"
#import "WLKTLoginLogData.h"
#import "WLKTLogsData.h"
#import "WLKTTableviewRefresh.h"

@interface WLKTLoginLogTVC ()
@property (strong, nonatomic) NSArray *dataArr;
@property (strong, nonatomic) NSMutableArray *backArr;
@property (assign, nonatomic) NSInteger page;
@property (assign, nonatomic) NSInteger currentCount;
@property (assign, nonatomic) BOOL isFirstRefresh;
@end

static NSString * const loginLogCell = @"loginLogCell";

@implementation WLKTLoginLogTVC



- (void)viewDidLoad {
    [super viewDidLoad];

    self.isFirstRefresh = YES;
    [self setHeaderRefreshing];
    [self setFooterRefreshing];
    [self.tableView.mj_header beginRefreshing];
    
    self.navigationItem.title = @"登录日志";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"箭头左"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonAct)];
   

}

- (void)setHeaderRefreshing{
    WS(weakSelf);
    [WLKTTableviewRefresh tableviewRefreshHeaderWithTaget:self.tableView request:^() {
        WLKTLogsApi *api = [[WLKTLogsApi alloc]init];
        [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            
            if (request.responseJSONObject[@"result"]) {
            
                WLKTLogsData *data = [WLKTLogsData modelWithDictionary:request.responseJSONObject[@"result"]];
                weakSelf.dataArr = [data.list copy];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (!weakSelf.dataArr.count) {
                        weakSelf.tableView.state = WLKTViewStateEmpty;
                        //weakSelf.tableView.imageForStateEmpty = @"";
                        weakSelf.tableView.titleForStateEmpty = @"暂无登录信息";
                        //[weakSelf.tableView.mj_header endRefreshing];
                        [weakSelf.tableView reloadData];
                    }
                    if (weakSelf.dataArr.count && weakSelf.isFirstRefresh) {//执行一次
                        weakSelf.currentCount = weakSelf.dataArr.count /10 > weakSelf.page ? (weakSelf.page + 1) * 10 : weakSelf.dataArr.count;
                        if (weakSelf.currentCount >= 10) {
                            for (int i = 0; i < 10; i++) {
                                [weakSelf.backArr addObject:weakSelf.dataArr[i]];
                            }
                            weakSelf.currentCount = 10;
                        }
                        else{
                            for (int i = 0; i < weakSelf.dataArr.count; i++) {
                                [weakSelf.backArr addObject:weakSelf.dataArr[i]];
                            }
                            weakSelf.currentCount = weakSelf.dataArr.count;
                        }
                        weakSelf.page++;
                    }
                    [weakSelf.tableView reloadData];
                    sleep(1);
                    [weakSelf.tableView.mj_header endRefreshing];
                    
                });

            }
            
        } failure:^(__kindof YTKBaseRequest *request) {
            [weakSelf.tableView.mj_header endRefreshing];
//            weakSelf.tableView.state = WLKTViewStateError;
            
        }];
        
    }];

}

- (void)setFooterRefreshing{
    WS(weakSelf);
    [WLKTTableviewRefresh tableviewRefreshFooterWithTaget:self.tableView block:^() {
        if (weakSelf.dataArr.count > 10) {
            //page此时初始为1
            NSInteger count = weakSelf.dataArr.count /10 >weakSelf.page ? (weakSelf.page + 1) * 10 : weakSelf.dataArr.count;
            
            for (NSInteger i = weakSelf.currentCount; i < count; i++) {//10 < count   0 ~ count - 10
                [weakSelf.backArr addObject:weakSelf.dataArr[i]];
            }
            if (weakSelf.backArr.count == weakSelf.dataArr.count) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf.tableView reloadData];
                    sleep(1);
                    [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
                });
            }
            else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf.tableView reloadData];
                    sleep(1);
                    weakSelf.page++;
                    weakSelf.currentCount = count;
                    [weakSelf.tableView.mj_footer endRefreshing];
                });
            }
            
        }
        else{
            [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
        }

    }];

}

- (void)backButtonAct{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.backArr.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WLKTLoginLogCell *cell = [tableView dequeueReusableCellWithIdentifier:loginLogCell];
    if (!cell) {
        cell = [[WLKTLoginLogCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:loginLogCell];
    }
    if (self.dataArr.count > 0) {
        [cell setCellContent:self.dataArr[indexPath.row]];
        self.isFirstRefresh = NO;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 175 * ScreenRatio_6;
}

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

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSArray array];
    }
    return _dataArr;
}

- (NSMutableArray *)backArr{
    if (!_backArr) {
        _backArr = [NSMutableArray arrayWithCapacity:10];
    }
    return _backArr;
}

@end

//
//  WLKTCouponOverdueTVC.m
//  wlkt
//
//  Created by 尹平江 on 2017/8/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCouponOverdueTVC.h"
#import "WLKTCouponOverdueCell.h"
#import "WLKTMyCouponTools.h"
#import "WLKTTableviewRefresh.h"


@interface WLKTCouponOverdueTVC ()

@end

@implementation WLKTCouponOverdueTVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.editing = YES;
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(myCouponSelectedAct:) name:@"myCouponSelected" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(myCouponDeleteAct:) name:@"myCouponDelete" object:nil];
    [self setRefresh];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - noti
- (void)myCouponSelectedAct:(NSNotification *)sender{
    if (sender.userInfo[@"index"] && [sender.userInfo[@"index"]  isEqual: @(2)]) {
        if ([sender.userInfo[@"isSelected"] isEqual:@(YES)]) {//全选
            [self.tableView clearSelectedRowsAnimated:YES];
            for (int i = 0; i < self.dataArr.count; i++) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:i];
                [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
            }
        }
        else{//反选
            [self.tableView clearSelectedRowsAnimated:YES];
        }
    }
}

- (void)myCouponDeleteAct:(NSNotification *)sender{
    [self deleteAlertConfirm:^{
        if (sender.userInfo[@"index"] && [sender.userInfo[@"index"]  isEqual: @(2)]) {
            NSMutableArray *selectedRowsArr = [NSMutableArray array];
            for (NSIndexPath *indexPath in [self.tableView indexPathsForSelectedRows]) {
                WLKTMycouponListData *data = self.dataArr[indexPath.section];
                [selectedRowsArr addObject:data.mcid];
                [self.dataArr removeObject:data];
            }
            [WLKTMyCouponTools requestWithDeleteID:selectedRowsArr success:^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"deleteCouponSuccess" object:nil];
                    [self.tableView reloadData];
                });
            } fail:^(NSString *error) {
                [SVProgressHUD showErrorWithStatus:error];
            }];
        }
    }];
}

- (void)deleteAlertConfirm:(void(^)(void))block{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"确定删除选中的优惠券吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *def = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block();
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:def];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - network
- (void)request{
    WS(weakSelf);
    [WLKTMyCouponTools requestWithStatus:3 success:^(WLKTMyCouponData *data) {
        [weakSelf.dataArr removeAllObjects];
        weakSelf.dataArr = data.couponlist.mutableCopy;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.tableView reloadData];
        });
    } fail:^(NSString *error) {
        [weakSelf.tableView.mj_header endRefreshing];
        [SVProgressHUD showErrorWithStatus:error];
        weakSelf.tableView.state = WLKTViewStateError;
        weakSelf.tableView.emptyButtonClickBlock = ^{
            [weakSelf request];
        };
    }];
    
}

- (void)setRefresh{
    WS(weakSelf);
    [WLKTTableviewRefresh tableviewRefreshHeaderWithTaget:self.tableView request:^() {
        [weakSelf request];
    }];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 147;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WLKTCouponOverdueCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLKTCouponOverdueCell"];
    if (cell == nil) {
        cell = [[WLKTCouponOverdueCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WLKTCouponOverdueCell"];
    }
    cell.selectedBackgroundView = [UIView new];
    [cell setCellData:self.dataArr[indexPath.section]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    v.backgroundColor = fillViewColor;
    return v;
}

#pragma mark - get 
- (NSMutableArray<WLKTMycouponListData *> *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}


@end

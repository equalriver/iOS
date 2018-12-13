//
//  WLKTCourseDetailNearTVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailNearTVC.h"
#import "WLKTClassifyCourseCell.h"
#import "WLKTTableviewRefresh.h"
#import "WLKTClassifyData.h"
#import "WLKTCDPageController.h"
#import "WLKTPolicyPhone.h"

@interface WLKTCourseDetailNearTVC ()<ClassifyCoursePhoneDelegate, UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIButton *topButton;
@property (strong, nonatomic) WLKTClassifyData *data;
@property (nonatomic, assign) NSInteger page;
@property (strong, nonatomic) NSMutableArray<WLKTCourse *> *dataArr;
@end

@implementation WLKTCourseDetailNearTVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    [self setRefresh];
    self.title = @"附近课程";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.topButton = [UIButton new];
    [self.topButton setImage:[UIImage imageNamed:@"顶部"] forState:UIControlStateNormal];
    [self.topButton addTarget:self action:@selector(goTopAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.topButton];
    [self.topButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right).offset(-15);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-25);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    self.topButton.hidden = YES;
}



- (void)setFooterView{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 35)];
    v.backgroundColor = separatorView_color;
    
    UILabel *l = [UILabel new];
    l.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
    l.textColor = KMainTextColor_9;
    l.text = @"已经到底啦～";
    [v addSubview:l];
    [l mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(v);
    }];
    
    //    UIButton *b = [UIButton new];
    //    [b setImage:[UIImage imageNamed:@"顶部"] forState:UIControlStateNormal];
    //    [b addTarget:self action:@selector(goTopAction:) forControlEvents:UIControlEventTouchUpInside];
    //    [v addSubview:b];
    //    [b mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.right.mas_equalTo(v.mas_right).offset(-10);
    //        make.centerY.mas_equalTo(v);
    //    }];
    self.tableView.tableFooterView = v;
}

#pragma mark - network
- (void)loadData{
    //    self.tableView.state = WLKTViewStateLoading;
    WLKTClassifyCourseListApi *api = [[WLKTClassifyCourseListApi alloc]initWithLatitude:[NSString stringWithFormat:@"%lf", self.currentCoordinate.latitude] longitude:[NSString stringWithFormat:@"%lf", self.currentCoordinate.longitude] page:self.page ClassifySearchType:ClassifySearchTypeDistance keyword:@"全部附近" value:@"1"];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        self.data = [WLKTClassifyData modelWithJSON:request.responseJSONObject[@"result"]];
        if (self.page == 1) {
            [self.dataArr removeAllObjects];
            [self.tableView.mj_footer resetNoMoreData];
        }
        if (self.page == 1) {
            if (!self.data.list.count) {                
                self.tableView.state = WLKTViewStateEmpty;
                self.tableView.imageForStateEmpty = [UIImage imageNamed:@"message_bg"];
            }
        }
        else{
            if (self.data.list.count) {
                [self.tableView.mj_footer endRefreshing];
            }
            else{
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
        }
        [self.dataArr addObjectsFromArray:self.data.list];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    } failure:^(__kindof YTKBaseRequest *request) {
        [self.tableView.mj_footer endRefreshing];
        [self.tableView.mj_header endRefreshing];
//        self.tableView.state = WLKTViewStateError;
    }];
}

- (void)setRefresh{
    WS(weakSelf);
    [WLKTTableviewRefresh tableviewRefreshHeaderWithTaget:self.tableView request:^{
        weakSelf.page = 1;

        [weakSelf loadData];
    }];
    [WLKTTableviewRefresh tableviewRefreshFooterWithTaget:self.tableView block:^{
        if (weakSelf.dataArr.count) {
            weakSelf.page++;
            [weakSelf loadData];
        }
        else{
            weakSelf.tableView.mj_footer = nil;
        }
    }];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - action
- (void)goTopAction:(UIButton *)sender{
    [self.tableView scrollToTopAnimated:YES];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 315;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WLKTClassifyCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLKTClassifyCourseCell"];
    if (cell == nil) {
        cell = [[WLKTClassifyCourseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WLKTClassifyCourseCell"];
    }
    cell.delegate = self;
    cell.currentCoordinate = self.currentCoordinate;
    [cell setCellData:self.dataArr[indexPath.row] index:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WLKTCDPageController *vc = [[WLKTCDPageController alloc]initWithCourseId:self.dataArr[indexPath.row].uid];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    if (y > 10 * 315) {
        self.topButton.hidden = false;
    }
    else{
        self.topButton.hidden = YES;
    }
}

#pragma mark - ClassifyCoursePhoneDelegate
- (void)didSelectedClassifyCoursePhone:(ClassifyCoursePhoneType)type index:(NSInteger)index{
    if (type == ClassifyCoursePhoneTypeOnline) {
        [SVProgressHUD showInfoWithStatus:@"暂未开放"];
        return;
    }
    //    if (type == ClassifyCoursePhoneTypeOnline && self.dataArr[index].schoolphone.length) {
    //        NSString* str = [NSString stringWithFormat:@"telprompt://%@", self.dataArr[index].schoolphone];
    //        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    //    }
    if (type == ClassifyCoursePhoneTypeZiXun && self.dataArr[index].uid.length) {
        [WLKTPolicyPhone policyPhoneWithType:WLKTPolicyPhoneTypeCourse typeId:self.dataArr[index].uid];
    }

}

#pragma mark - set
- (void)setCurrentCoordinate:(CLLocationCoordinate2D)currentCoordinate{
    _currentCoordinate = currentCoordinate;
    [self loadData];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - NavigationBarAndStatusHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
#pragma mark - get
- (NSMutableArray<WLKTCourse *> *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArr;
}

@end


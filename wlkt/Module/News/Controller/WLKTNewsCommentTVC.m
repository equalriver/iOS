//
//  WLKTNewsCommentTVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTNewsCommentTVC.h"
#import "WLKTNewsCommentCell.h"
#import "WLKTNewsCommentSectionView.h"
#import "WLKTCDPageController.h"
#import "WLKTActivityDetailVC.h"
#import "WLKTNewsApi.h"
#import "WLKTTableviewRefresh.h"
#import "WLKTNewsCommentList.h"

#import "WLKTNewsComplaintCell.h"
#import "WLKTNewsCommentSectionView.h"

#import "WLKTNews_Q_A_cell.h"
#import "WLKTNewsQuestionAnswerTVC.h"

@interface WLKTNewsCommentTVC ()
@property (nonatomic) NSInteger page;
@property (strong, nonatomic) NSMutableArray<WLKTNewsCommentList *> *dataArr;

@end

@implementation WLKTNewsCommentTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = kMainBackgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.page = 1;
    [self setRefresh];
    [self loadCommentDataWithPage:self.page];
//    [self loadComplaintDataWithPage:self.page];
//    [self load_Q_A_DataWithPage:self.page];
}

#pragma mark - network
- (void)loadCommentDataWithPage:(NSInteger)page{
    self.tableView.state = WLKTViewStateLoading;
    WLKTNewsApi *api = [[WLKTNewsApi alloc]initWithType:WLKTNewsTypeComment page:page];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        self.tableView.state = WLKTViewStateNormal;
        if (self.page == 1) {
            [self.dataArr removeAllObjects];
            [self.tableView.mj_footer resetNoMoreData];
        }
        NSArray *arr = [NSArray modelArrayWithClass:[WLKTNewsCommentList class] json:request.responseJSONObject[@"result"]];
        if (arr.count == 0) {
            if (page > 1) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            else{
                [self.tableView.mj_footer endRefreshing];
                self.tableView.state = WLKTViewStateEmpty;
                self.tableView.imageForStateEmpty = [UIImage imageNamed:@"无内容"];
                self.tableView.titleForStateEmpty = @"无内容";
            }
        }
        else{
            [self.dataArr addObjectsFromArray:arr];
            [self.tableView.mj_footer endRefreshing];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        
    } failure:^(__kindof YTKBaseRequest *request) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        self.tableView.state = WLKTViewStateError;
        WS(weakSelf);
        self.tableView.emptyButtonClickBlock = ^{
            [weakSelf loadCommentDataWithPage:weakSelf.page];
        };
    }];
}

- (void)loadComplaintDataWithPage:(NSInteger)page{
    self.tableView.state = WLKTViewStateLoading;
    WLKTNewsApi *api = [[WLKTNewsApi alloc]initWithType:WLKTNewsTypeComplaint page:page];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        self.tableView.state = WLKTViewStateNormal;
        NSArray *arr = [NSArray modelArrayWithClass:[WLKTNewsCommentList class] json:request.responseJSONObject[@"result"]];
        if (arr.count == 0) {
            if (page > 1) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            else{
                [self.tableView.mj_footer endRefreshing];
                self.tableView.state = WLKTViewStateEmpty;
                self.tableView.imageForStateEmpty = [UIImage imageNamed:@"无内容"];
                self.tableView.titleForStateEmpty = @"无内容";
            }
        }
        else{
            [self.dataArr addObjectsFromArray:arr];
            [self.tableView.mj_footer endRefreshing];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        
    } failure:^(__kindof YTKBaseRequest *request) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        self.tableView.state = WLKTViewStateError;
        WS(weakSelf);
        self.tableView.emptyButtonClickBlock = ^{
            [weakSelf loadComplaintDataWithPage:weakSelf.page];
        };
    }];
}

- (void)load_Q_A_DataWithPage:(NSInteger)page{
    self.tableView.state = WLKTViewStateLoading;
    WLKTNewsApi *api = [[WLKTNewsApi alloc]initWithType:WLKTNewsType_Q_A page:page];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        self.tableView.state = WLKTViewStateNormal;
        NSArray *arr = [NSArray modelArrayWithClass:[WLKTNewsCommentList class] json:request.responseJSONObject[@"result"]];
        if (arr.count == 0) {
            if (page > 1) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            else{
                [self.tableView.mj_footer endRefreshing];
                self.tableView.state = WLKTViewStateEmpty;
                self.tableView.imageForStateEmpty = [UIImage imageNamed:@"无内容"];
                self.tableView.titleForStateEmpty = @"无内容";
            }
        }
        else{
            [self.dataArr addObjectsFromArray:arr];
            [self.tableView.mj_footer endRefreshing];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        
    } failure:^(__kindof YTKBaseRequest *request) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        self.tableView.state = WLKTViewStateError;
        WS(weakSelf);
        self.tableView.emptyButtonClickBlock = ^{
            [weakSelf load_Q_A_DataWithPage:weakSelf.page];
        };
    }];
}

- (void)setRefresh{
    WS(weakSelf);
    [WLKTTableviewRefresh tableviewRefreshHeaderWithTaget:self.tableView request:^{
        weakSelf.page = 1;

        [weakSelf loadCommentDataWithPage:1];
//        [weakSelf loadComplaintDataWithPage:1];
//        [weakSelf load_Q_A_DataWithPage:1];
    }];
    [WLKTTableviewRefresh tableviewRefreshFooterWithTaget:self.tableView block:^{
        weakSelf.page++;
        [weakSelf loadCommentDataWithPage:weakSelf.page];
//        [weakSelf loadComplaintDataWithPage:weakSelf.page];
//        [weakSelf load_Q_A_DataWithPage:weakSelf.page];
    }];
}

#pragma mark - action
- (void)pushViewControllerWithIndex:(NSInteger)index isGoDetail:(BOOL)isGoDetail{
    if ([self.dataArr[index].linktype isEqualToString:@"1"]) {//course
        WLKTCDPageController *vc = [[WLKTCDPageController alloc]initWithCourseId:self.dataArr[index].linkid];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.dataArr[index].linktype isEqualToString:@"2"]){//activity
        WLKTActivityDetailVC *vc = [[WLKTActivityDetailVC alloc]initWithActivityId:self.dataArr[index].linkid];
        @weakify(vc);
        vc.completion = ^{
            @strongify(vc);
            if (isGoDetail) {
                [vc.tableView scrollToRow:0 inSection:9 atScrollPosition:UITableViewScrollPositionTop animated:YES];//评价
            }
        };
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.dataArr[index].linktype isEqualToString:@"3"]){//other
        WLKTNewsQuestionAnswerTVC *vc = [[WLKTNewsQuestionAnswerTVC alloc]initWithQuestionId:self.dataArr[index].linkid];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat h = 90 *ScreenRatio_6;
    if (self.dataArr[indexPath.section].content) {//评价
        CGFloat h1 = [self.dataArr[indexPath.section].content getSizeWithWidth:ScreenWidth -20 Font:13].height;
        h += h1 > 35 *ScreenRatio_6 ? 30 *ScreenRatio_6 : h1;
    }
//    else{//投诉
//        h -= 20;
//        CGFloat h1 = [UILabel getSizeWithStr:self.dataArr[indexPath.section].describe Width:ScreenWidth -20 Font:13].height;
//        h += h1 > 35 ? 30 : h1;
//    }

//    if (self.dataArr[indexPath.section].handlelist) {
//        CGFloat hh = [UILabel getSizeWithStr:self.dataArr[indexPath.section].handlelist.result Width:ScreenWidth -40 Font:13].height;
//        h += hh > 35 ? 30 : hh;
//        h += 35;
//    }
    
    //问答
//    if (self.dataArr[indexPath.section].question) {
//        if (self.dataArr[indexPath.section].answerlist) {
//            return 135;
//        }
//        else{
//            return 65;
//        }
//    }
    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat h = 75 *ScreenRatio_6;
    if (self.dataArr[section].imglist.count) {
        h += 90 *ScreenRatio_6;
    }
    
//    if (self.dataArr[section].question){
//        CGFloat hh = [UILabel getSizeWithStr:self.dataArr[section].title Width:ScreenWidth -20 Font:17.5].height;
//        h += hh > 45 ? 40 : hh;
//    }
    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArr[indexPath.section].describe) {
        WLKTNewsComplaintCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLKTNewsComplaintCell"];
        if (cell == nil) {
            cell = [[WLKTNewsComplaintCell alloc]init];
        }
        [cell setCellData:self.dataArr[indexPath.section]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (self.dataArr[indexPath.section].question){
        WLKTNews_Q_A_cell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLKTNews_Q_A_cell"];
        if (cell == nil) {
            cell = [[WLKTNews_Q_A_cell alloc]init];
        }
        [cell setCellData:self.dataArr[indexPath.section]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        WLKTNewsCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLKTNewsCommentCell"];
        if (cell == nil) {
            cell = [[WLKTNewsCommentCell alloc]init];
        }
        [cell setCellData:self.dataArr[indexPath.section]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGFloat h = 75 *ScreenRatio_6;
    if (self.dataArr[section].imglist.count) {
        h += 90 *ScreenRatio_6;
    }
    WS(weakSelf);
    NewsSectionViewType type;
    if (self.dataArr[section].describe) {
        type = NewsSectionViewTypeComplaint;
    }
    else if (self.dataArr[section].question){
        type = NewsSectionViewType_Q_A;
        CGFloat hh = [self.dataArr[section].title getSizeWithWidth:ScreenWidth -20 Font:17.5].height;
        h += hh > 45 *ScreenRatio_6 ? 40 *ScreenRatio_6 : hh;
    }
    else{
        type = NewsSectionViewTypeComment;
    }
    WLKTNewsCommentSectionView *v = [[WLKTNewsCommentSectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, h) type:type data:self.dataArr[section] clickHandle:^{
        [weakSelf pushViewControllerWithIndex:section isGoDetail:false];
    }];
    return v;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 5)];
    v.backgroundColor = separatorView_color;
    return v;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self pushViewControllerWithIndex:indexPath.section isGoDetail:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    if (scrollView.contentOffset.y > ScreenHeight) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"NewsGoTopShowNoti" object:nil];
    }
    else{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"NewsGoTopDismissNoti" object:nil];
    }
}

#pragma mark -
- (NSMutableArray<WLKTNewsCommentList *> *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArr;
}
@end

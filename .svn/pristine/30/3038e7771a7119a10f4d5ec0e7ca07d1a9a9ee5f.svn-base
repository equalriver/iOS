
//
//  WLKTNewsVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTNewsVC.h"
#import "WLKTFrontPageTVC.h"
#import "WLKTNewsVideoTVC.h"
#import "WLKTNewsNormalNewsTVC.h"
#import "WLKTNewsCommentTVC.h"
//#import "WLKTNewsComplaintTVC.h"
#import "WLKTNews_Q_A_TVC.h"
//#import "WLKTPYSearch.h"
#import "WLKTNewsAskVC.h"
#import "WLKTNewsZhengCeTVC.h"
#import "WLKTNewsJieDuTVC.h"

@interface WLKTNewsVC ()
@property (copy, nonatomic) NSArray *titleArr;
@end

@implementation WLKTNewsVC
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titleColorNormal = KMainTextColor_9;
        self.titleColorSelected = UIColorHex(33c4da);
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titleSizeSelected = 15;
        self.titleSizeNormal = 14;
        self.menuItemWidth = 375/6;
        self.progressWidth = 30;

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.navigationItem.titleView = self.pysearch.searchBar;
    self.title = @"发现";
//    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"新闻提问"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAct)];
//    self.navigationItem.rightBarButtonItem = right;
    
}


#pragma mark - action
- (void)rightBarButtonAct{
    WLKTNewsAskVC *vc = [[WLKTNewsAskVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)goTopAction:(UIButton *)sender{
    if ([self.currentViewController isKindOfClass:[UITableViewController class]]) {
        [((UITableViewController *)self.currentViewController).tableView scrollToTop];
    }
}

- (void)PYSearchActionWithSearchText:(NSString *)text{
//    [self reloadData];
}

#pragma mark - page controller delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titleArr.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    return self.titleArr[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 0) {//头条
        WLKTFrontPageTVC *vc = [[WLKTFrontPageTVC alloc]init];
        return vc;
    }
//    if (index == 1) {//视频
//        WLKTNewsVideoTVC *vc = [[WLKTNewsVideoTVC alloc]init];
//        return vc;
//    }
    if (index == 1) {//新闻
        WLKTNewsNormalNewsTVC *vc = [[WLKTNewsNormalNewsTVC alloc]init];
        return vc;
    }
    if (index == 2) {//评价
        WLKTNewsCommentTVC *vc = [[WLKTNewsCommentTVC alloc]initWithStyle:UITableViewStyleGrouped];
        return vc;
    }
//    if (index == 4) {//投诉
//        WLKTNewsComplaintTVC *vc = [[WLKTNewsComplaintTVC alloc]initWithStyle:UITableViewStyleGrouped];
//        return vc;
//    }
    if (index == 3) {//问答
        WLKTNews_Q_A_TVC *vc = [[WLKTNews_Q_A_TVC alloc]initWithStyle:UITableViewStyleGrouped];
        return vc;
    }
    if (index == 4) {//解读
        WLKTNewsJieDuTVC *vc = [[WLKTNewsJieDuTVC alloc]init];
        return vc;
    }
    if (index == 5) {//政策
        WLKTNewsZhengCeTVC *vc = [[WLKTNewsZhengCeTVC alloc]init];
        return vc;
    }
    return [UIViewController new];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView{
    return CGRectMake(0, 0, kScreenWidth, 40);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView{
    return CGRectMake(0, 40, kScreenWidth, kScreenHeight - NavigationBarAndStatusHeight - 50);
}


#pragma mark - get
//- (WLKTPYSearch *)pysearch{
//    if (!_pysearch) {
//        _pysearch = [[WLKTPYSearch alloc]initWithTarget:self completion:^(NSString *searchText) {
//            [self PYSearchActionWithSearchText:searchText];
//        }];
//    }
//    return _pysearch;
//}

- (NSArray *)titleArr{
    if (!_titleArr) {
        _titleArr = @[@"推荐", @"新闻", @"动态", @"问答", @"政策解读", @"政策"];
    }
    return _titleArr;
}

@end

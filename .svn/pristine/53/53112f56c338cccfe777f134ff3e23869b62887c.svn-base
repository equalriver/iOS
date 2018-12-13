//
//  WLKTActivityVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/19.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityVC.h"
//#import <WMPageController.h>
//#import "WLKTClassifyHeadView.h"
//#import "WLKTClassifyCourseTVC.h"
//#import "WLKTClassifyCourseListApi.h"
//#import "WLKTClassifyData.h"
//#import "UIViewController+State.h"
//#import "WLKTClassifyScrollView.h"
//#import "WLKTClassifyFliterBtns.h"
//#import "WLKTCourseDetailVC.h"
//#import "WLKTSchoolVC.h"
//#import "WLKTTableviewRefresh.h"
//#import "WLKTClassifyActivityTVC.h"
//#import "WLKTClassifyActivityListApi.h"
//#import "WLKTActivityDetailVC.h"
//#import "WLKTPYSearch.h"

@interface WLKTActivityVC ()//<CLLocationManagerDelegate, ClassifyHeadNaviDelegate, WLKTClassifyFliterBtnsDelegate>
//@property (strong, nonatomic) WLKTPYSearch *pysearch;
//@property (nonatomic, strong) CLLocationManager *locationManager;
//@property (strong, nonatomic) WLKTClassifyFliterBtns *courseFliterBtns;
//@property (strong, nonatomic) WLKTClassifyHeadView *courseHeadView;
//@property (strong, nonatomic) WLKTClassifyFliterBtns *activityFliterBtns;
//@property (strong, nonatomic) WLKTClassifyHeadView *activityHeadView;
//@property (strong, nonatomic) WMPageController *pageController;
//@property (strong, nonatomic) WLKTClassifyScrollView *containerScrollView;
//@property (nonatomic, strong) UIView *contentView;
//@property (strong, nonatomic) WLKTClassifyCourseTVC *courseTVC;
//@property (strong, nonatomic) WLKTClassifyActivityTVC *activityTVC;
//@property (strong, nonatomic) UIButton *goTopBtn;
//
//@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabView;
//@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabViewPre;
//@property (nonatomic, assign) BOOL canScroll;
//@property (nonatomic, assign) CLLocationCoordinate2D currentCoordinate;
//@property (strong, nonatomic) WLKTClassifyData *activityData;
//@property (strong, nonatomic) WLKTClassifyData *courseData;
//@property (nonatomic, assign) ClassifySearchType type;
//@property (copy, nonatomic) NSString *courseTypeValue;
//@property (copy, nonatomic) NSString *courseSearchText;
//@property (copy, nonatomic) NSString *activityTypeValue;
//@property (copy, nonatomic) NSString *activitySearchText;
//@property (nonatomic, assign) BOOL isCourseList;
//@property (nonatomic, assign) NSInteger currentIndex;
@end

#define maxOffsetY  230 *ScreenRatio_6

@implementation WLKTActivityVC
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    _canScroll = YES;
//
//    _type = ClassifySearchTypeNone;
//    _currentCoordinate.latitude = 0;
//    _currentCoordinate.longitude = 0;
//    [self setupView];
//
//    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
//    [b setTitle:@"成都" forState:UIControlStateNormal];
//    [b setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
//    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:b];
//    self.navigationItem.leftBarButtonItem = left;
//    self.navigationItem.titleView = self.pysearch.searchBar;
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:kHomeLeaveTopNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addFliterViewNoti) name:kClassifyFliterViewAddNoti object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeFliterViewNoti) name:kClassifyFliterViewRemoveNoti object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goTopBtnWillShow) name:@"classifyGoTopNoti" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goTopBtnWillHidden) name:@"classifyLevelTopNoti" object:nil];
//
//    [self setCLLocation];
//    if (self.isCourseList) {
////        [self loadCourseDataWithType:self.type keyword:self.courseSearchText completion:nil];
//    }
//    else{
//        [self loadActivityDataWithType:self.type keyword:self.activitySearchText completion:nil];
//    }
//    WS(weakSelf);
//    [WLKTTableviewRefresh tableviewRefreshHeaderWithTaget:self.containerScrollView request:^{
//        weakSelf.pysearch.searchBar.text = @"";
//        weakSelf.courseSearchText = weakSelf.activitySearchText = @"";
//        weakSelf.courseTypeValue = weakSelf.activityTypeValue = @"";
//        [weakSelf.courseFliterBtns resetButtonStatus];
//        [weakSelf.activityFliterBtns resetButtonStatus];
//        weakSelf.courseHeadView.currentItem = -1;
//        weakSelf.activityHeadView.currentItem = -1;
//        [weakSelf.courseHeadView.classifyCV reloadData];
//        [weakSelf.activityHeadView.classifyCV reloadData];
//        [[NSNotificationCenter defaultCenter]postNotificationName:kClassifyDidSearchNewDataToClearPageNoti object:nil];
//        if (weakSelf.isCourseList) {
////            [weakSelf loadCourseDataWithType:ClassifySearchTypeNone keyword:nil completion:nil];
//        }
//        else{
//            [weakSelf loadActivityDataWithType:ClassifySearchTypeNone keyword:nil completion:nil];
//        }
//    }];
//}
//
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    //启动跟踪定位
//    [self.locationManager startUpdatingLocation];
//}
//
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    [self.locationManager stopUpdatingLocation];
//    self.state = WLKTViewStateNormal;
//}
//
//- (void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}
//
//- (void)setupView {
//    [self.view addSubview:self.courseFliterBtns];
//    [self.courseFliterBtns mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.width.mas_equalTo(self.view);
//        make.height.mas_equalTo(40);
//    }];
//    [self.view addSubview:self.activityFliterBtns];
//    [self.activityFliterBtns mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.width.mas_equalTo(self.view);
//        make.height.mas_equalTo(40);
//    }];
//    [self.view addSubview:self.containerScrollView];
//    [self.containerScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.bottom.trailing.equalTo(self.view).offset(0);
//        make.top.mas_equalTo(self.courseFliterBtns.mas_bottom);
//    }];
//    [self.containerScrollView addSubview:self.courseHeadView];
//    [self.courseHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.leading.trailing.equalTo(self.containerScrollView);
//        make.width.equalTo(self.containerScrollView);
//        make.height.mas_equalTo(maxOffsetY);
//    }];
//    [self.containerScrollView addSubview:self.activityHeadView];
//    [self.activityHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.leading.trailing.equalTo(self.containerScrollView);
//        make.width.equalTo(self.containerScrollView);
//        make.height.mas_equalTo(maxOffsetY);
//    }];
//    [self.containerScrollView addSubview:self.contentView];
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.courseHeadView.mas_bottom);
//        make.leading.trailing.bottom.equalTo(self.containerScrollView);
//        make.width.equalTo(self.containerScrollView);
//        make.height.mas_equalTo(kScreenHeight - NavigationBarAndStatusHeight - 44);
//    }];
//    [self.contentView addSubview:self.pageController.view];
//
//    [self.view addSubview:self.goTopBtn];
//    [self.goTopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-60);
//        make.right.mas_equalTo(self.view).offset(-15);
//    }];
//}
//
//#pragma mark - network
////- (void)loadCourseDataWithType:(ClassifySearchType)type keyword:(NSString *)keyword completion:(void(^)(void))completion{
////    self.state = WLKTViewStateLoading;
////    WLKTClassifyCourseListApi *api = [[WLKTClassifyCourseListApi alloc]initWithLatitude:[NSString stringWithFormat:@"%lf", self.currentCoordinate.latitude] longitude:[NSString stringWithFormat:@"%lf", self.currentCoordinate.longitude] page:1 ClassifySearchType:type keyword:keyword value:self.courseTypeValue];
////    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
////        !completion ?: completion();
////        [self.containerScrollView.mj_header endRefreshing];
////        [[NSNotificationCenter defaultCenter]postNotificationName:@"ClassifyFliterViewRemoveByButton" object:nil];
////        self.state = WLKTViewStateNormal;
////        self.courseData = [WLKTClassifyData modelWithJSON:request.responseJSONObject[@"result"]];
////        if (self.isCourseList) {
////            self.courseFliterBtns.isCourseList = YES;
////            self.courseHeadView.data = self.courseData;
////            self.courseFliterBtns.data = self.courseData;
////        }
////
////        [self.pageController reloadData];
////
////    } failure:^(__kindof YTKBaseRequest *request) {
////        [self.containerScrollView.mj_header endRefreshing];
////        WS(weakSelf);
////        self.state = WLKTViewStateError;
////        self.loadingBlock = ^{
////            [weakSelf loadCourseDataWithType:type keyword:keyword completion:nil];
////        };
////    }];
////}
//
//- (void)loadActivityDataWithType:(ClassifySearchType)type keyword:(NSString *)keyword completion:(void(^)(void))completion{
//    self.state = WLKTViewStateLoading;
//    WLKTClassifyActivityListApi *api = [[WLKTClassifyActivityListApi alloc]initWithLatitude:[NSString stringWithFormat:@"%lf", self.currentCoordinate.latitude] longitude:[NSString stringWithFormat:@"%lf", self.currentCoordinate.longitude] page:1 ClassifySearchType:type keyword:keyword value:self.activityTypeValue];
//
//    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
//        !completion ?: completion();
//        [self.containerScrollView.mj_header endRefreshing];
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"ClassifyFliterViewRemoveByButton" object:nil];
//        self.state = WLKTViewStateNormal;
//        self.activityData = [WLKTClassifyData modelWithJSON:request.responseJSONObject[@"result"]];
//        if (!self.isCourseList) {
//            self.activityFliterBtns.isCourseList = false;
//            self.activityHeadView.data = self.activityData;
//            self.activityFliterBtns.data = self.activityData;
//        }
//        [self.pageController reloadData];
//
//    } failure:^(__kindof YTKBaseRequest *request) {
//        [self.containerScrollView.mj_header endRefreshing];
//        WS(weakSelf);
//        self.state = WLKTViewStateError;
//        self.loadingBlock = ^{
//            [weakSelf loadActivityDataWithType:type keyword:keyword completion:nil];
//        };
//    }];
//}
//
//#pragma mark - page controller delegate
//- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
//    if (self.activityData) {
//        return 1;
//    }
//    return 0;
//}
//
//- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
//    if (index == 1) {
//        return self.courseData.course_num.length ? [NSString stringWithFormat:@"课程(%@)", self.courseData.course_num] : @"课程";
//    }
//    return self.activityData.act_num.length ? [NSString stringWithFormat:@"活动(%@)", self.activityData.act_num] : @"活动";
//}
//
//- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
//    if (index == 1) {
//        [self.courseTVC.dataArr removeAllObjects];
//        if (self.courseData.list) {
//            [self.courseTVC.dataArr addObjectsFromArray:self.courseData.list];
//            [self.courseTVC.tableView reloadData];
//        }
//        self.courseTVC.type = self.type;
//        self.courseTVC.typeValue = self.courseTypeValue;
//        self.courseTVC.searchText = self.courseSearchText;
//        return self.courseTVC;
//    }
//    else{
//        [self.activityTVC.dataArr removeAllObjects];
//        if (self.activityData.list) {
//            [self.activityTVC.dataArr addObjectsFromArray:self.activityData.list];
//            [self.activityTVC.tableView reloadData];
//        }
//        self.activityTVC.type = self.type;
//        self.activityTVC.typeValue = self.activityTypeValue;
//        self.activityTVC.searchText = self.activitySearchText;
//        return self.activityTVC;
//    }
//}
//
//- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView{
//    return CGRectMake(0, 0, kScreenWidth, 40);
//}
//
//- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView{
//    return CGRectMake(0, 0, kScreenWidth, kScreenHeight - NavigationBarAndStatusHeight -100);
//}
//
//- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info{
//    if (self.pageController.selectIndex == 1) {//course
//        self.isCourseList = YES;
//        self.courseHeadView.hidden = false;
//        self.courseFliterBtns.hidden = false;
//        self.activityHeadView.hidden = YES;
//        self.activityFliterBtns.hidden = YES;
//        self.courseHeadView.data = self.courseData;
//        self.courseFliterBtns.data = self.courseData;
//        self.courseFliterBtns.isCourseList = YES;
//        self.courseTVC.type = self.type;
//        self.courseTVC.typeValue = self.courseTypeValue;
//        self.courseTVC.searchText = self.courseSearchText;
//        if (!self.courseData) {
//            [self loadCourseDataWithType:ClassifySearchTypeNone keyword:nil completion:nil];
//        }
//    }
//    else{
//        self.isCourseList = false;
//        self.courseHeadView.hidden = YES;
//        self.courseFliterBtns.hidden = YES;
//        self.activityHeadView.hidden = false;
//        self.activityFliterBtns.hidden = false;
//        self.activityHeadView.data = self.activityData;
//        self.activityFliterBtns.data = self.activityData;
//        self.activityFliterBtns.isCourseList = false;
//        self.activityTVC.type = self.type;
//        self.activityTVC.typeValue = self.activityTypeValue;
//        self.activityTVC.searchText = self.activitySearchText;
//        if (!self.activityData) {
//            [self loadActivityDataWithType:ClassifySearchTypeNone keyword:nil completion:nil];
//        }
//    }
//}
//
//#pragma mark - scroll view delegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    [[UIApplication sharedApplication].keyWindow endEditing:YES];
//    CGFloat offsetY = scrollView.contentOffset.y;
//    if (offsetY >= maxOffsetY) {
//        scrollView.contentOffset = CGPointMake(0, maxOffsetY);
//        //        NSLog(@"滑动到顶端");
//        [[NSNotificationCenter defaultCenter] postNotificationName:kHomeGoTopNotification object:nil userInfo:@{@"canScroll":@"1"}];
//        _canScroll = NO;
//    }else{
//        //        NSLog(@"离开顶端");
//        if (!_canScroll) {
//            scrollView.contentOffset = CGPointMake(0, maxOffsetY);
//        }
//    }
//
//}
//
//#pragma mark - UISearchBarDelegate
//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
//    self.type = ClassifySearchTypeNone;
//    self.courseTypeValue = self.activityTypeValue = @"";
//    [self.courseFliterBtns resetButtonStatus];
//    [self.activityFliterBtns resetButtonStatus];
//    self.courseHeadView.currentItem = -1;
//    self.activityHeadView.currentItem = -1;
//
//    self.courseSearchText = self.activitySearchText = searchBar.text;
//
//    [searchBar resignFirstResponder];
//    [[NSNotificationCenter defaultCenter]postNotificationName:kClassifyDidSearchNewDataToClearPageNoti object:nil];
//
////    [self loadCourseDataWithType:ClassifySearchTypeNone keyword:searchBar.text completion:nil];
//    [self loadActivityDataWithType:ClassifySearchTypeNone keyword:searchBar.text completion:nil];
//}
//
//#pragma mark - WLKTClassifyHeadViewDelegate
//- (void)didSelectedNaviItemByType:(NSString *)type{
//    self.courseSearchText = self.activitySearchText = self.pysearch.searchBar.text = @"";
//    if (self.pageController.selectIndex == 1) {//course
//        self.courseTypeValue = type;
//    }
//    else{
//        self.activityTypeValue = type;
//    }
//    self.type = ClassifySearchTypeClassify;
//    [[NSNotificationCenter defaultCenter]postNotificationName:kClassifyDidSearchNewDataToClearPageNoti object:nil];
//    if (self.isCourseList) {
//        [self.courseFliterBtns resetButtonStatus];
////        [self loadCourseDataWithType:self.type keyword:nil completion:nil];
//    }
//    else{
//        [self.activityFliterBtns resetButtonStatus];
//        [self loadActivityDataWithType:self.type keyword:nil completion:nil];
//    }
//}
//
//- (void)didSelectedImageWithType:(WLKTBannerListTye)type url:(NSString *)url{
//    [[NSNotificationCenter defaultCenter]postNotificationName:kClassifyDidSearchNewDataToClearPageNoti object:nil];
//    if (type == WLKTBannerListTyeCourseDetail) {
//        WLKTCourseDetailVC *vc = [[WLKTCourseDetailVC alloc]initWithCourseId:url];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
//    }
//    if (type == WLKTBannerListTyeSchool) {
//        WLKTSchoolVC *vc = [[WLKTSchoolVC alloc]initWithSchoolId:url];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
//    }
//    if (type == WLKTBannerListTyeActivityDetail) {
//        WLKTActivityDetailVC *vc = [[WLKTActivityDetailVC alloc]initWithActivityId:url];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
//    }
//}
//
//#pragma mark - FliterButton delegate
//- (void)didSelectedFliterButtonWithType:(ClassifySearchType)type value:(NSString *)value completion:(void (^)(void))completion{
//    self.courseSearchText = self.activitySearchText = self.pysearch.searchBar.text = @"";
//    self.type = type;
//    if (self.pageController.selectIndex == 1) {//course
//        self.courseTypeValue = value;
//    }
//    else{
//        self.activityTypeValue = value;
//    }
//    if (self.isCourseList) {
//        self.courseHeadView.currentItem = -1;
//        [self.courseHeadView.classifyCV reloadData];
////        [self loadCourseDataWithType:self.type keyword:nil completion:^{
////            !completion ?: completion();
////        }];
//    }
//    else{
//        self.activityHeadView.currentItem = -1;
//        [self.activityHeadView.classifyCV reloadData];
//        [self loadActivityDataWithType:self.type keyword:nil completion:^{
//            !completion ?: completion();
//        }];
//    }
//}
//
//#pragma mark - CoreLocation 代理
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
//    CLLocation *location = [locations firstObject];//取出第一个位置
//    //    self.currentCoordinate = [WLKTLocationChange MarsGS2BaiduGS:location.coordinate];//位置坐标
//    self.currentCoordinate = location.coordinate;
//    self.courseTVC.currentCoordinate = self.currentCoordinate;
//    self.activityTVC.currentCoordinate = self.currentCoordinate;
//    if (self.isCourseList) {
////        [self loadCourseDataWithType:self.type keyword:self.courseSearchText completion:nil];
//    }
//    else{
//        [self loadActivityDataWithType:self.type keyword:self.activitySearchText completion:nil];
//    }
//    //如果不需要实时定位，使用完即关闭定位服务
//    [_locationManager stopUpdatingLocation];
//}
//
//- (void)setCLLocation{
//    if(![CLLocationManager locationServicesEnabled]){
//        UIAlertController *al = [UIAlertController alertControllerWithTitle:@"打开[定位服务]来允许[未来课堂]确定您的位置" message:@"请在系统设置中开启定位服务(设置>隐私>定位服务>开启)" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:nil];
//        [al addAction:cancel];
//        UIAlertAction *def = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            //跳转到定位权限页面
//            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//            if( [[UIApplication sharedApplication]canOpenURL:url] ) {
//                [[UIApplication sharedApplication] openURL:url];
//            }
//        }];
//        [al addAction:def];
//        [self presentViewController:al animated:YES completion:nil];
//    }
//}
//
//#pragma mark - action
//- (void)PYSearchActionWithSearchText:(NSString *)text{
//    self.type = ClassifySearchTypeNone;
//    self.courseTypeValue = self.activityTypeValue = @"";
//    [self.courseFliterBtns resetButtonStatus];
//    [self.activityFliterBtns resetButtonStatus];
//    self.courseHeadView.currentItem = -1;
//    self.activityHeadView.currentItem = -1;
//
//    self.courseSearchText = self.activitySearchText = text;
//
//
//    [[NSNotificationCenter defaultCenter]postNotificationName:kClassifyDidSearchNewDataToClearPageNoti object:nil];
//
////    [self loadCourseDataWithType:ClassifySearchTypeNone keyword:text completion:nil];
//    [self loadActivityDataWithType:ClassifySearchTypeNone keyword:text completion:nil];
//}
//
//- (void)goTopAction:(UIButton *)sender{
//    if (self.isCourseList) {
//        [self.courseTVC.tableView scrollToTop];
//    }
//    else{
//        [self.activityTVC.tableView scrollToTop];
//    }
//    [self.containerScrollView scrollToTop];
//}
//
//- (void)resetSearchStatus{
//    self.type = ClassifySearchTypeNone;
//    self.courseSearchText = self.activitySearchText = self.pysearch.searchBar.text = @"";
//    self.courseTypeValue = self.activityTypeValue = @"";
//    [self.courseFliterBtns resetButtonStatus];
//    [self.activityFliterBtns resetButtonStatus];
//    self.courseHeadView.currentItem = -1;
//    self.activityHeadView.currentItem = -1;
//    [self.courseHeadView.classifyCV reloadData];
//    [self.activityHeadView.classifyCV reloadData];
//}
//
//#pragma mark - notification
//-(void)acceptMsg:(NSNotification *)notification{
//    NSDictionary *userInfo = notification.userInfo;
//    NSString *canScroll = userInfo[@"canScroll"];
//    if ([canScroll isEqualToString:@"1"]) {
//        _canScroll = YES;
//    }
//}
//
//- (void)addFliterViewNoti{
//    self.containerScrollView.scrollEnabled = false;
//}
//
//- (void)removeFliterViewNoti{
//    self.containerScrollView.scrollEnabled = YES;
//}
//
//- (void)goTopBtnWillShow{
//    self.goTopBtn.hidden = false;
//}
//
//- (void)goTopBtnWillHidden{
//    self.goTopBtn.hidden = YES;
//}
//
//#pragma mark - get
//- (WLKTClassifyFliterBtns *)courseFliterBtns{
//    if (!_courseFliterBtns) {
//        _courseFliterBtns = [[WLKTClassifyFliterBtns alloc]initWithFrame:CGRectNull];
//        _courseFliterBtns.delegate = self;
//    }
//    return _courseFliterBtns;
//}
//- (WLKTClassifyHeadView *)courseHeadView{
//    if (!_courseHeadView) {
//        _courseHeadView = [[WLKTClassifyHeadView alloc]initWithFrame:CGRectNull];
//        _courseHeadView.delegate = self;
//    }
//    return _courseHeadView;
//}
//- (WLKTClassifyFliterBtns *)activityFliterBtns{
//    if (!_activityFliterBtns) {
//        _activityFliterBtns = [[WLKTClassifyFliterBtns alloc]initWithFrame:CGRectNull];
//        _activityFliterBtns.delegate = self;
//        _activityFliterBtns.hidden = YES;
//    }
//    return _activityFliterBtns;
//}
//- (WLKTClassifyHeadView *)activityHeadView{
//    if (!_activityHeadView) {
//        _activityHeadView = [[WLKTClassifyHeadView alloc]initWithFrame:CGRectNull];
//        _activityHeadView.delegate = self;
//        _activityHeadView.hidden = YES;
//    }
//    return _activityHeadView;
//}
//- (WLKTClassifyScrollView *)containerScrollView {
//    if (!_containerScrollView) {
//        _containerScrollView = [[WLKTClassifyScrollView alloc] init];
//        _containerScrollView.delegate = self;
//        _containerScrollView.showsVerticalScrollIndicator = NO;
//    }
//    return _containerScrollView;
//}
//- (UIView *)contentView {
//    if (!_contentView) {
//        _contentView = [[UIView alloc] init];
//    }
//    return _contentView;
//}
//- (WMPageController *)pageController{
//    if (!_pageController) {
//        _pageController = [[WMPageController alloc]init];
//        _pageController.titleColorNormal = UIColorHex(999999);
//        _pageController.titleColorSelected = kNavBarBackgroundColor;
//        _pageController.menuViewStyle = WMMenuViewStyleLine;
//        _pageController.menuView.height = 44;
//        _pageController.titleSizeSelected = 14;
//        _pageController.titleSizeNormal = 14;
//        _pageController.menuItemWidth = 100;
//        _pageController.progressWidth = 30;
//        _pageController.delegate = self;
//        _pageController.dataSource = self;
//    }
//    return _pageController;
//}
//- (WLKTPYSearch *)pysearch{
//    if (!_pysearch) {
//        _pysearch = [[WLKTPYSearch alloc]initWithTarget:self completion:^(NSString *searchText) {
//            [self PYSearchActionWithSearchText:searchText];
//        }];
//    }
//    return _pysearch;
//}
//- (CLLocationManager *)locationManager{
//    if (!_locationManager) {
//        _locationManager = [[CLLocationManager alloc] init];
//        // 版本适配
//        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
//            [_locationManager requestWhenInUseAuthorization];
//        }
//        //设置代理
//        _locationManager.delegate = self;
//        //设置定位精度
//        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//        //定位频率,每隔多少米定位一次
//        _locationManager.distanceFilter = 10.0;//十米定位一次
//    }
//    return _locationManager;
//}
//- (WLKTClassifyCourseTVC *)courseTVC{
//    if (!_courseTVC) {
//        _courseTVC = [[WLKTClassifyCourseTVC alloc]initWithStyle:UITableViewStylePlain];
//    }
//    return _courseTVC;
//}
//- (WLKTClassifyActivityTVC *)activityTVC{
//    if (!_activityTVC) {
//        _activityTVC = [[WLKTClassifyActivityTVC alloc]initWithStyle:UITableViewStylePlain];
//    }
//    return _activityTVC;
//}
//- (UIButton *)goTopBtn{
//    if (!_goTopBtn) {
//        _goTopBtn = [UIButton new];
//        _goTopBtn.hidden = YES;
//        [_goTopBtn setImage:[UIImage imageNamed:@"顶部"] forState:UIControlStateNormal];
//        [_goTopBtn addTarget:self action:@selector(goTopAction:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _goTopBtn;
//}
//
@end


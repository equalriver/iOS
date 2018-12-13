//
//  WLKTUserMyCourseVC.m
//  wlkt
//
//  Created by 尹平江 on 2017/8/10.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUserMyCourseVC.h"
#import "WLKTPayCourseTVC.h"
#import "WLKTUnPayCourseTVC.h"
#import "WLKTMyCourseCollectVC.h"

@interface WLKTUserMyCourseVC ()

@end

@implementation WLKTUserMyCourseVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"我的课程";
        self.titleColorNormal = [UIColor blackColor];
        self.titleColorSelected = UIColorHex(33c4da);
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuView.height = 44;
        self.titleSizeSelected = 14;
        self.titleSizeNormal = 14;
        self.itemsWidths = @[@100, @100];
        self.progressWidth = 30;
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = self;
    self.selectIndex = self.selectedIndex;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    if (index == 0) {
        return @"已支付";
    }
    if (index == 1) {
        return @"待支付";
    }
    return @"我收藏的";
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return 3;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 0) {
        WLKTPayCourseTVC *vc = [[WLKTPayCourseTVC alloc] init];
        return vc;
    }
    if (index == 1) {
        WLKTUnPayCourseTVC *vc = [[WLKTUnPayCourseTVC alloc] init];
        return vc;
    }
    WLKTMyCourseCollectVC *vc = [[WLKTMyCourseCollectVC alloc]init];
    return vc;
    
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView{
    return CGRectMake(0, 0, kScreenWidth, 40);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView{
    return CGRectMake(0, 40, kScreenWidth, kScreenHeight - NavigationBarAndStatusHeight - 40);
}

@end

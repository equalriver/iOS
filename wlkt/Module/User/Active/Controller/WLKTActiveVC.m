//
//  WLKTActiveVC.m
//  wlkt
//
//  Created by 尹平江 on 2017/7/10.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActiveVC.h"
#import "WLKTActiveCollectTVC.h"
#import "WLKTActiveRegisterTVC.h"

@interface WLKTActiveVC ()


@end

@implementation WLKTActiveVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"我的活动";
        self.titleColorNormal = [UIColor blackColor];
        self.titleColorSelected = UIColorHex(33c4da);
        self.menuViewStyle = WMMenuViewStyleLine;
//        self.isNeedUnfoldButton = NO;
        self.menuView.height = 44;
        self.titleSizeSelected = 14;
        self.titleSizeNormal = 14;
//        self.menuBGColor = [UIColor clearColor];
        self.itemsWidths = @[@100, @100];
        //self.progressHeight = 2;
        self.progressWidth = 30;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSource = self;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    if (index == 0) {
        return @"我报名的";
    }
    return @"我收藏的";
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return 2;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView{
    return CGRectMake(0, 0, kScreenWidth, 40);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView{
    return CGRectMake(0, 40, kScreenWidth, kScreenHeight - NavigationBarAndStatusHeight - 40);
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 0) {
        WLKTActiveRegisterTVC *vc = [[WLKTActiveRegisterTVC alloc] init];
        return vc;
    }
    WLKTActiveCollectTVC *vc = [[WLKTActiveCollectTVC alloc] init];
    return vc;
}

@end

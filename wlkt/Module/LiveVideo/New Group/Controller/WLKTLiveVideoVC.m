//
//  WLKTLiveVideoVC.m
//  wlkt
//
//  Created by 尹平江 on 2018/4/26.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTLiveVideoVC.h"
#import "WLKTHomepageNavigationButton.h"
#import "WLKTLVOpenClassVC.h"
#import "WLKTLVLiveVC.h"

@interface WLKTLiveVideoVC ()
@property (strong, nonatomic) WLKTHomepageNavigationButton *openClass;
@property (strong, nonatomic) WLKTHomepageNavigationButton *liveVideo;

@end

@implementation WLKTLiveVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setBarButtonItem];
    
}

- (void)setBarButtonItem{
    UIBarButtonItem *openClass = [[UIBarButtonItem alloc]initWithCustomView:self.openClass];
    UIBarButtonItem *course = [[UIBarButtonItem alloc]initWithCustomView:self.liveVideo];
    UIBarButtonItem *fix_1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fix_1.width = 15 *ScreenRatio_6;

    if (IsIOS_11_Later) {
        self.navigationItem.leftBarButtonItems = @[openClass, fix_1, course];
    }
    else{
        self.navigationItem.leftBarButtonItems = @[openClass, course];
    }
    
}

#pragma mark - action
- (void)liveVideoNaviButtonAct:(UIButton *)sender{
    self.selectIndex = (int)sender.tag;
    
    NSArray *arr = @[self.openClass, self.liveVideo];
    for (WLKTHomepageNavigationButton *btn in arr) {
        if (btn.tag == sender.tag) {
            btn.detailLabel.textColor = UIColorHex(33c4da);
        }
        else{
            btn.detailLabel.textColor = KMainTextColor_3;
        }
    }
}

#pragma mark - wmpageController
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return 2;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 0) {
        WLKTLVOpenClassVC *vc = [[WLKTLVOpenClassVC alloc]initWithStyle:UITableViewStylePlain];
        return vc;
    }

    WLKTLVLiveVC *vc = [[WLKTLVLiveVC alloc]initWithStyle:UITableViewStylePlain];
    return vc;

}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info{
    [SVProgressHUD dismiss];
    NSArray *arr = @[self.openClass, self.liveVideo];
    for (WLKTHomepageNavigationButton *btn in arr) {
        if (btn.tag == ((NSNumber *)(info[@"index"])).integerValue) {
            btn.detailLabel.textColor = UIColorHex(33c4da);
        }
        else{
            btn.detailLabel.textColor = KMainTextColor_3;
        }
        
    }
    
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectZero;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView{
    return CGRectMake(0, 0, kScreenWidth, kScreenHeight - NavigationBarAndStatusHeight - 50);
}

#pragma mark - get
- (WLKTHomepageNavigationButton *)openClass{
    if (!_openClass) {
        _openClass = [[WLKTHomepageNavigationButton alloc]initWithFrame:CGRectMake(0, 0, 70 *ScreenRatio_6, 30) title:@"推荐"];
        _openClass.tag = 0;
        _openClass.detailLabel.textColor = UIColorHex(33c4da);
        [_openClass addTarget:self action:@selector(liveVideoNaviButtonAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openClass;
}
- (WLKTHomepageNavigationButton *)liveVideo{
    if (!_liveVideo) {
        _liveVideo = [[WLKTHomepageNavigationButton alloc]initWithFrame:CGRectMake(0, 0, 70 *ScreenRatio_6, 30) title:@"课程"];
        _liveVideo.tag = 1;
        [_liveVideo addTarget:self action:@selector(liveVideoNaviButtonAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _liveVideo;
}

@end


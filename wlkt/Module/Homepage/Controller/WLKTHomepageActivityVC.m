//
//  WLKTHomepageActivityVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/23.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTHomepageActivityVC.h"

@interface WLKTHomepageActivityVC ()

@end

@implementation WLKTHomepageActivityVC

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    if (scrollView.contentOffset.y > ScreenHeight) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"homepageGoTopShowNoti" object:nil];
    }
    else{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"homepageGoTopDismissNoti" object:nil];
    }
}

@end
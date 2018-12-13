//
//  UIViewController+WLKTSetup.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/11.
//  Copyright © 2018年 neimbo. All rights reserved.
//
#import <Aspects.h>
#import "UIViewController+WLKTSetup.h"

@implementation UIViewController (WLKTSetup)
+ (void)load{
    
    [self aspect_hookSelector:@selector(viewWillDisappear:) withOptions:AspectPositionBefore usingBlock:^{
        [SVProgressHUD dismiss];
    } error:NULL];
//    [self aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo){
//        [(UIViewController *)aspectInfo.instance preferredStatusBarStyle];
//    } error:NULL];
//    [self aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
//        [SVProgressHUD setContainerView:((UIViewController *)aspectInfo.instance).view];
//    } error:NULL];
}

@end

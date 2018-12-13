//
//  UINavigationController+WLKTSetup.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/31.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "UINavigationController+WLKTSetup.h"
#import "WLKTQRScanVC.h"
#import <Aspects.h>

@implementation UINavigationController (WLKTSetup)
+ (void)load{
    [self aspect_hookSelector:@selector(popViewControllerAnimated:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo){
        [SVProgressHUD dismiss];
        if ([aspectInfo.instance isKindOfClass:[UINavigationController class]]) {
            
            UINavigationController *navi = aspectInfo.instance;
            
            for (UIViewController *v in navi.viewControllers) {
                
                if ([v isKindOfClass:[WLKTQRScanVC class]]) {
                    
                    [navi popToRootViewControllerAnimated:YES];
                    return ;
                    
                }
            }
        }

    } error:NULL];
}

@end

//
//  WLKTLoadingView.m
//  wlkt
//
//  Created by slovelys on 17/3/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTLoadingView.h"
#import "WLKTSpinnerView.h"

@interface WLKTLoadingView ()

@property (weak, nonatomic) IBOutlet WLKTSpinnerView *spinnerView;

@end

@implementation WLKTLoadingView

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview) {
        [_spinnerView beginRefreshing];
    } else {
        [_spinnerView endRefreshing];
    }
}

@end

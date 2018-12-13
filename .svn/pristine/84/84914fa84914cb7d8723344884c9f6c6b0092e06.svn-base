//
//  WLKTStateViewFactory.m
//  wlkt
//
//  Created by slovelys on 17/3/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTStateViewFactory.h"

@implementation WLKTStateViewFactory

+ (UIView *)stateViewForState:(WLKTViewState)state {
    if (state == WLKTViewStateLoading) {
        UIView *v = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([WLKTLoadingView class]) owner:nil options:nil].firstObject;
//        v.userInteractionEnabled = false;
        return v;
    }
    if (state == WLKTViewStateError) {
        UIView *v = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([WLKTErrorView class]) owner:nil options:nil].firstObject;
//        v.userInteractionEnabled = YES;
        return v;
    }
    return nil;
}

@end

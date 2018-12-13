//
//  UIView+WLKTViewAnimate.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/6.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "UIView+WLKTViewAnimate.h"

@implementation UIView (WLKTViewAnimate)

+ (void)viewAnimateComeOutWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay target:(UIView *)view completion:(void(^)(BOOL finished))completion{
    [UIView animateWithDuration:duration delay:delay usingSpringWithDamping:0.8f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint center = view.center;
        center.y -= view.size.height;
        [view setCenter:center];
    } completion:^(BOOL finished) {
        completion(finished);
    }];
}

+ (void)viewAnimateDismissWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay target:(UIView *)view completion:(void(^)(BOOL finished))completion{
    [UIView animateWithDuration:duration delay:delay usingSpringWithDamping:0.8f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint center = view.center;
        center.y += view.size.height;
        [view setCenter:center];
    } completion:^(BOOL finished) {
        completion(finished);
    }];
}

@end

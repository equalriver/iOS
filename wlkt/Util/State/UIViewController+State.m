//
//  UIViewController+State.m
//  wlkt
//
//  Created by slovelys on 2017/5/2.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "UIViewController+State.h"
#import <objc/runtime.h>
#import "WLKTStateViewFactory.h"
#import <UIGestureRecognizer+BlocksKit.h>

@implementation UIViewController (State)

- (void)showStateView:(UIView *)view {
    [self.stateView removeFromSuperview];
    objc_setAssociatedObject(self, @selector(stateView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.state == WLKTViewStateLoading) {
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    if (self.state == WLKTViewStateError) {
        [self addTapGesture:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
}

- (void)hideStateView {
    UIView *view = [self stateView];
    [UIView animateWithDuration:0.2 animations:^{
        view.alpha = 0;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
        objc_setAssociatedObject(self, @selector(stateView), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }];
}

- (void)addTapGesture:(UIView *)view {
    @weakify(self)
    [view addGestureRecognizer:[UITapGestureRecognizer bk_recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
        @strongify(self)
        if (self.loadingBlock) {
            self.loadingBlock();
        }
    }]];
}

#pragma mark - Setters & Getters

- (WLKTViewState)state {
    NSNumber *state = objc_getAssociatedObject(self, _cmd);
    return state.unsignedIntegerValue;
}

- (void)setState:(WLKTViewState)state {
    if (self.state == WLKTViewStateNormal) {
        [self hideStateView];
        return;
    }
    if (self.state == state) {
        return;
    }
    objc_setAssociatedObject(self, @selector(state), @(state), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UIView *view = [WLKTStateViewFactory stateViewForState:state];
    if (state == WLKTViewStateError) {
         [view setValue:self.loadingBlock forKey:@"loadingBlock"];
    }
    [self setStateView:view];
}

- (WLKTStateType)stateType {
    NSNumber *type = objc_getAssociatedObject(self, _cmd);
    if (!type) {
        type = @(WLKTStateTypeNormal);
        self.stateType = WLKTStateTypeNormal;
    }
    return (WLKTStateType)type.unsignedIntegerValue;
}

- (void)setStateType:(WLKTStateType)stateType {
    objc_setAssociatedObject(self, @selector(stateType), @(stateType), OBJC_ASSOCIATION_ASSIGN);
}

- (void (^)(void))loadingBlock {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLoadingBlock:(void (^)(void))loadingBlock {
    objc_setAssociatedObject(self, @selector(loadingBlock), loadingBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIView *)stateView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setStateView:(UIView *)view {
    if (view) {
        [self showStateView:view];
    } else {
        [self hideStateView];
    }
}

- (BOOL)isVisible {
    return (self.isViewLoaded && self.view.window);
}

@end

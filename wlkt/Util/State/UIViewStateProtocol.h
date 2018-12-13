//
//  UIViewStateProtocol.h
//  wlkt
//
//  Created by slovelys on 17/3/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

typedef NS_ENUM(NSUInteger, WLKTStateType) {
    WLKTStateTypeNormal,
};

typedef NS_ENUM(NSUInteger, WLKTViewState) {
    WLKTViewStateIdle,
    WLKTViewStateLoading,
    WLKTViewStateEmpty,
    WLKTViewStateError,
    WLKTViewStateNormal
};

@protocol UIViewStateProtocol <NSObject>

@property (assign, nonatomic) WLKTViewState state;

@optional
@property (copy, nonatomic) void (^loginBlock)(void);
@property (copy, nonatomic) void (^loadingBlock)(void);

@end

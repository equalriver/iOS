//
//  WLKTStateViewFactory.h
//  wlkt
//
//  Created by slovelys on 17/3/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTLoadingView.h"
#import "WLKTErrorView.h"
#import "UIViewStateProtocol.h"

@interface WLKTStateViewFactory : UIView

+ (UIView *)stateViewForState:(WLKTViewState)state;

@end

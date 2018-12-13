//
//  WLKTErrorView.h
//  wlkt
//
//  Created by slovelys on 17/3/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLKTErrorView : UIView

@property (copy, nonatomic) void (^loadingBlock)(void);

@end

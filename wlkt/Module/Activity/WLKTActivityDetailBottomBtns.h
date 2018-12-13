//
//  WLKTActivityDetailBottomBtns.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFButton.h"

@protocol ActivityDetailBottomDelegate <NSObject>
- (void)bottomButtonDidSelectedButton:(UIButton *)button;

@end

@interface WLKTActivityDetailBottomBtns : UIView
@property (strong, nonatomic) ZFButton *collectBtn;
@property (weak, nonatomic) id<ActivityDetailBottomDelegate> delegate;
@end

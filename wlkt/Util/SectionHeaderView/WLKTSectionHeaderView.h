//
//  WLKTSectionHeaderView.h
//  wlkt
//
//  Created by slovelys on 17/3/30.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^buttonTapBlock)(NSString *title);

@interface WLKTSectionHeaderView : UIView

@property (copy, nonatomic) buttonTapBlock tap;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title isNeedMoreButton:(BOOL)isNeedMoreButton;

@end

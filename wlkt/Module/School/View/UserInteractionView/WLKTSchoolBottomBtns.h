//
//  WLKTSchoolBottomBtns.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFButton.h"

@protocol WLKTSchoolBottomDelegate <NSObject>
- (void)schoolBottomButtonDidSelectedButton:(UIButton *)button;

@end

@interface WLKTSchoolBottomBtns : UIView
@property (strong, nonatomic) ZFButton *collectBtn;
@property (weak, nonatomic) id<WLKTSchoolBottomDelegate> delegate;
@end

//
//  WLKTSchoolNewsDetailBottomBtns.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/23.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFButton.h"

@protocol SchoolNewsDetailBottomDelegate <NSObject>
- (void)schoolNewsDetailBottomButtonDidSelected:(UIButton *)button;

@end

@interface WLKTSchoolNewsDetailBottomBtns : UIView
@property (strong, nonatomic) ZFButton *collectBtn;
@property (weak, nonatomic) id<SchoolNewsDetailBottomDelegate> delegate;
@end

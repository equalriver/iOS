//
//  WLKTCDBottomButtons.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/16.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFButton.h"
#import "WLKTCDData.h"

@protocol CDBottomButtonDelegate <NSObject>
- (void)CourseDetailBottomButtonDidSelectedButton:(UIButton *)button;

@end

@interface WLKTCDBottomButtons : UIView
@property (weak, nonatomic) id<CDBottomButtonDelegate> delegate;
@property (strong, nonatomic) WLKTCDData *data;
@end

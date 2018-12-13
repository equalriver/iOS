//
//  WLKTLivePaySuccessVC.h
//  wlkt
//
//  Created by 尹平江 on 2017/5/4.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLKTLivePaySuccessVC : UIViewController
/**
 *  状态图
 */
@property (strong, nonatomic) UIImageView *stateImageView;
/**
 *  stateLabel_1
 */
@property (strong, nonatomic) UILabel *stateLabel_1;
/**
 *  stateLabel_2
 */
@property (strong, nonatomic) UILabel *stateLabel_2;
/**
 *  finishButton
 */
@property (strong, nonatomic) UIButton *finishButton;

@property (strong, nonatomic) UIButton *orderButton;

@end

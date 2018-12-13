//
//  WLKTDiscardChangeView.h
//  wlkt
//
//  Created by 尹平江 on 17/3/28.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLKTDiscardChangeView : UIView
/**
 *  icon
 */
@property (strong, nonatomic) UIImageView *iconIV;
/**
 *  warningMsg
 */
@property (strong, nonatomic) UILabel *warningLabel;
/**
 *  分割线1
 */
@property (strong, nonatomic) UIView *separatorView_one;
/**
 *  分割线2
 */
@property (strong, nonatomic) UIView *separatorView_two;
/**
 *  commitBtn
 */
@property (strong, nonatomic) UIButton *commitChangeBtn;
/**
 *  discardBtn
 */
@property (strong, nonatomic) UIButton *discardBtn;

@end

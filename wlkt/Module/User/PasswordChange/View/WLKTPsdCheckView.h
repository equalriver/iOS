//
//  WLKTPsdCheckView.h
//  wlkt
//
//  Created by 尹平江 on 17/3/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLKTPsdCheckView : UIView
/**
 *  icon
 */
@property (strong, nonatomic) UIImageView *iconIV;
/**
 *  warningMsg
 */
@property (strong, nonatomic) UILabel *warningLabel;
/**
 *  commit
 */
@property (strong, nonatomic) UIButton *commitButton;
/**
 *  分割线1
 */
@property (strong, nonatomic) UIView *separatorView_one;

@end

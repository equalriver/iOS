//
//  WLKTActivePayWayCell.h
//  wlkt
//
//  Created by 尹平江 on 2017/7/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLKTActivePayWayCell : UITableViewCell
/**
 *  银行icon
 */
@property (strong, nonatomic) UIImageView *bankIconImageView;
/**
 *  银行title
 */
@property (strong, nonatomic) UILabel *bankTitle;
/**
 *  天府银行(推荐)
 */
@property (strong, nonatomic) UILabel *tianfuPayDetailLabel;
/**
 *  勾选icon
 */
@property (strong, nonatomic) UIImageView *checkImageView;


@property (strong, nonatomic) UIView *separatorView_1;

@end

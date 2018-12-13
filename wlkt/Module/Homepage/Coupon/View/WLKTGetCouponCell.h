//
//  WLKTWLKTGetCouponCell.h
//  wlkt
//
//  Created by 尹平江 on 2017/8/16.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCouponCenterData.h"

@interface WLKTGetCouponCell : UITableViewCell
@property (strong, nonatomic) UIImageView *bgIV;
@property (strong, nonatomic) UILabel *priceFixLabel;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *couponLabel;
@property (strong, nonatomic) UILabel *couponDetailLabel;
@property (strong, nonatomic) UILabel *bottomLabel;
@property (strong, nonatomic) UIView *separatorView_1;
@property (strong, nonatomic) UIView *separatorView_2;
@property (strong, nonatomic) UILabel *getCouponLabel;
- (void)setCellData:(WLKTCouponCenterData *)data;

@end

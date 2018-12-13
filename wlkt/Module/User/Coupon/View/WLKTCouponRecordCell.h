//
//  WLKTCouponRecordCell.h
//  wlkt
//
//  Created by 尹平江 on 2017/8/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTExchangeButton.h"
#import "WLKTMycouponListData.h"

@interface WLKTCouponRecordCell : UITableViewCell
@property (strong, nonatomic) UIImageView *bgIV;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIView *separatorView_1;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *discountLabel;
@property (strong, nonatomic) UIImageView *usedIV;
@property (strong, nonatomic) UIView *separatorView_2;
@property (strong, nonatomic) UILabel *conditionLabel;
@property (strong, nonatomic) UILabel *useTimeLabel;
@property (strong, nonatomic) WLKTExchangeButton *useRuleBtn;
- (void)setCellData:(WLKTMycouponListData *)data;
@end

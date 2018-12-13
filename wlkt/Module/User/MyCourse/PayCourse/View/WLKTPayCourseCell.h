//
//  WLKTPayCourseCell.h
//  wlkt
//
//  Created by 尹平江 on 17/3/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTPayCourseData.h"
#import "WLKTExchangeButton.h"

@interface WLKTPayCourseCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellContent:(WLKTPayCourseData *)data;

- (void)setCellContent:(WLKTPayCourseData *)data;
@property (strong, nonatomic) UIView *separatorView_1;
@property (strong, nonatomic) UIView *separatorView_2;
@property (strong, nonatomic) UIView *separatorView_3;
@property (strong, nonatomic) UIView *separatorView_4;
@property (strong, nonatomic) UIView *separatorView_5;
///school icon
@property (strong, nonatomic) UIImageView *schoolIconIV;
///学校title & detail btn
@property (strong, nonatomic) WLKTExchangeButton *schoolTitleBtn;
///支付时间
@property (strong, nonatomic) UILabel *payTimeLabel;
///支付状态
@property (strong, nonatomic) UILabel *payStateLabel;
///详情图
@property (strong, nonatomic) UIImageView *courseImageView;
///课程名称
@property (strong, nonatomic) UILabel *courseNameLabel;
///价格类型
@property (strong, nonatomic) UILabel *priceTypeLabel;
///课程类型
@property (strong, nonatomic) UILabel *courseTypeLabel;
///班型
@property (strong, nonatomic) UILabel *standardLabel;
///单价
@property (strong, nonatomic) UILabel *priceLabel;
///单价原价
@property (strong, nonatomic) UILabel *rawPriceLabel;
///购买的课时数量
@property (strong, nonatomic) UILabel *courseNumLabel;
///报名编号icon
@property (strong, nonatomic) UIImageView *tradeNumIcon;
///报名编号
@property (strong, nonatomic) UILabel *tradeNumLabel;
///交易号icon
@property (strong, nonatomic) UIImageView *payNumIcon;
///交易号
@property (strong, nonatomic) UILabel *payNumLabel;
///开班时间icon
@property (strong, nonatomic) UIImageView *openTimeIcon;
///开班时间
@property (strong, nonatomic) UILabel *openTimeLabel;
///地址图标
@property (strong, nonatomic) UIImageView *locationImageView;
///详细地址
@property (strong, nonatomic) UILabel *locationMsgLabel;
///总额tag
@property (strong, nonatomic) UILabel *totalPriceTagLabel;
///总额
@property (strong, nonatomic) UILabel *totalPriceLabel;
///优惠券折扣价tag
@property (strong, nonatomic) UILabel *youhuiPriceTagLabel;
///优惠券折扣价
@property (strong, nonatomic) UILabel *youhuiPriceLabel;
///实际付款
@property (strong, nonatomic) UILabel *payPriceLabel;
@end













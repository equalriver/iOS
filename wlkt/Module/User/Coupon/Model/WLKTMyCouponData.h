//
//  WLKTMyCouponData.h
//  wlkt
//
//  Created by 尹平江 on 2017/8/15.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTMycouponListData.h"

@interface WLKTMyCouponData : NSObject
@property (strong, nonatomic) NSArray *couponlist;
///优惠券未使用的数量
@property (copy, nonatomic) NSString *weishiyong;
///优惠券已使用数量
@property (copy, nonatomic) NSString *yishiyong;
///优惠券过期数量
@property (copy, nonatomic) NSString *guoqi;

@end

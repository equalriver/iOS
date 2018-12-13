//
//  WLKTMyCouponTools.h
//  wlkt
//
//  Created by 尹平江 on 2017/8/15.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTMyCouponData.h"
#import "WLKTMyCouponApi.h"
#import "WLKTMyCouponDelApi.h"
#import "WLKTUseRuleAlertView.h"
#import "WLKTCouponRuleData.h"
#import "WLKTCouponRuleApi.h"

typedef void(^success)(WLKTMyCouponData *data);
typedef void(^fail)(NSString *error);

@interface WLKTMyCouponTools : NSObject
+ (void)requestWithStatus:(NSInteger)status success:(void(^)(WLKTMyCouponData *data))success fail:(void(^)(NSString *error))fail;
+ (void)requestWithDeleteID:(__kindof NSArray *)mcids success:(void(^)(void))success fail:(void(^)(NSString *error))fail;
+ (UIView *)makeUseRuleAlertViewWithFrame:(CGRect)frame;

@end

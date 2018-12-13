//
//  WLKTMyCouponTools.m
//  wlkt
//
//  Created by 尹平江 on 2017/8/15.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTMyCouponTools.h"

@implementation WLKTMyCouponTools

+ (void)requestWithStatus:(NSInteger)status success:(void(^)(WLKTMyCouponData *data))success fail:(void(^)(NSString *error))fail {
    WLKTMyCouponApi *api = [[WLKTMyCouponApi alloc]initWithStatus:status];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        WLKTMyCouponData *data = [WLKTMyCouponData modelWithJSON:request.responseJSONObject[@"list"]];
        success(data);
    } failure:^(__kindof YTKBaseRequest *request) {
        fail(request.requestOperationError.localizedDescription);
    }];
}

+ (void)requestWithDeleteID:(__kindof NSArray *)mcids success:(void(^)(void))success fail:(void(^)(NSString *error))fail {
    WLKTMyCouponDelApi *api = [[WLKTMyCouponDelApi alloc]initWithID:mcids];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        success();
    } failure:^(__kindof YTKBaseRequest *request) {
        fail(request.requestOperationError.localizedDescription);
    }];
}

+ (UIView *)makeUseRuleAlertViewWithFrame:(CGRect)frame{
    WLKTUseRuleAlertView *v = [[WLKTUseRuleAlertView alloc]initWithFrame:frame];
    WLKTCouponRuleApi *api = [[WLKTCouponRuleApi alloc]init];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        WLKTCouponRuleData *data = [WLKTCouponRuleData modelWithJSON:request.responseJSONObject[@"result"][@"list"]];
        if (data) {
            [v setData:data];
        }
    } failure:^(__kindof YTKBaseRequest *request) {
        ShowApiError;
    }];
    
    return v;
}

@end

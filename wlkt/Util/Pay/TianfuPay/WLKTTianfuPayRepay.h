//
//  WLKTTianfuPayRepay.h
//  wlkt
//
//  Created by 尹平江 on 2017/5/3.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTTianfuPayRepay : NSObject
+ (void)tianfuPayWithOrderId:(NSString *)oid target:(__kindof UIViewController *)vc;

@end

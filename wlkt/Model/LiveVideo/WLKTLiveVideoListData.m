//
//  WLKTLiveVideoListData.m
//  wlkt
//
//  Created by 尹平江 on 2018/5/25.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTLiveVideoListData.h"

@implementation WLKTLiveVideoListData
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{
             @"vid" : @"id"
             };
}
@end

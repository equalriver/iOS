//
//  WLKTActiveCollectListData.m
//  wlkt
//
//  Created by 尹平江 on 2017/7/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActiveCollectListData.h"


@implementation WLKTActiveCollectListData

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{
             @"list" : [WLKTActiveCollectData class]
             };
}

@end

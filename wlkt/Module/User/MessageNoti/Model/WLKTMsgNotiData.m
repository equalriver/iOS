//
//  WLKTMsgNotiData.m
//  wlkt
//
//  Created by 尹平江 on 17/3/30.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTMsgNotiData.h"
#import "WLKTMsgNotiDitalData.h"

@implementation WLKTMsgNotiData

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{
             @"list" : [WLKTMsgNotiDitalData class]
             };
}
- (NSString *)description {
    return self.modelDescription;
}

@end

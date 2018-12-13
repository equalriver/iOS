//
//  WLKTNews_Q_A_detailData.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/4.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTNews_Q_A_detailData.h"

@implementation WLKTNews_Q_A_detailData
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"qid" : @"id"
             };
}
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"replylist": [WLKTNews_Q_A_detailReplyData class]
             };
}
@end

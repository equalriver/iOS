
//
//  WLKTCDQueslist.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/29.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDQueslist.h"

@implementation WLKTCDQueslist
+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"list": [CDQueslist_detailList class]
             };
}
@end


@implementation CDQueslist_detailList
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"qid" : @"id"
             };
}
@end

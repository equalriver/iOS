//
//  WLKTNews_Q_A_list.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/2.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTNews_Q_A_list.h"

@implementation WLKTNews_Q_A_list
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"answerlist": [WLKTNewsAnswerItem class]
             };
}
@end

//
//  WLKTNewsCommentList.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/2.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTNewsCommentList.h"

@implementation WLKTNewsCommentList
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"handlelist": [WLKTNewsAnswerItem class]
             };
}
@end

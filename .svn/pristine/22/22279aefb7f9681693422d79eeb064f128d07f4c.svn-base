//
//  WLKTCDCommentlist.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/29.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDCommentlist.h"

@implementation WLKTCDCommentlist
+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"list": [CDCommentList_item class]
             };
}
@end


@implementation CDCommentList_item
+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"reply": [CDCommentList_item_reply class]
             };
}
@end


@implementation CDCommentList_item_reply

@end

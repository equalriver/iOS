//
//  WLKTNewsQuestionItem.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/2.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTNewsQuestionItem.h"

@implementation WLKTNewsQuestionItem
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"qid" : @"id"
             };
}
@end

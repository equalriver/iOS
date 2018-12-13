//
//  WLKTCDQuestionList.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/8.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDQuestionList.h"

@implementation WLKTCDQuestionList
+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"list": [CDQuesListData class]
             
             };
}
@end


@implementation CDQuesListData
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"qid" : @"id"
             };
}

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"answerlist": [CDQuesListAnswerlist class]
             
             };
}
@end


@implementation CDQuesListAnswerlist

@end

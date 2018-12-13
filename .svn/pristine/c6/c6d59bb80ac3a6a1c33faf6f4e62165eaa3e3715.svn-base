//
//  WLKTCDQuestionList.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/8.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTCDCourseinfo.h"

@interface CDQuesListAnswerlist: NSObject
@property (copy, nonatomic) NSString *answer;
@end

@interface CDQuesListData: NSObject
///问题id
@property (copy, nonatomic) NSString *qid;
///问题的内容
@property (copy, nonatomic) NSString *question;
///该问题的回答数量,大于1是有值
@property (copy, nonatomic) NSString *count;
///提问的时间
@property (copy, nonatomic) NSString *createtime;
///回答的列表
@property (copy, nonatomic) NSArray<CDQuesListAnswerlist *> *answerlist;
@end

@interface WLKTCDQuestionList : NSObject
@property (strong, nonatomic) WLKTCDCourseinfo *courseinfo;
@property (copy, nonatomic) NSArray<CDQuesListData *> *list;
@end

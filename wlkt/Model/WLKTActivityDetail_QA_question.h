//
//  WLKTActivityDetail_QA_question.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTActivityDetail_QA_answer.h"
@interface WLKTActivityDetail_QA_question : NSObject
@property (copy, nonatomic) NSString *qid;
@property (copy, nonatomic) NSString *user_id;
@property (copy, nonatomic) NSString *suid;
@property (copy, nonatomic) NSString *point_id;
@property (copy, nonatomic) NSString *course_id;
@property (copy, nonatomic) NSString *act_id;
@property (copy, nonatomic) NSString *question;
@property (copy, nonatomic) NSString *create_time;
@property (copy, nonatomic) NSString *status;
@property (copy, nonatomic) NSString *username;

@property (copy, nonatomic) NSArray<WLKTActivityDetail_QA_answer *> *answerlist;
@end

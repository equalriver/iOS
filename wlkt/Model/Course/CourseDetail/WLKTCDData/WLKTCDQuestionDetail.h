//
//  WLKTCDQuestionDetail.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/8.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTCDCourseinfo.h"

@interface CDQuestionDetailQues: NSObject
///问题id
@property (copy, nonatomic) NSString *qid;
///提问者的用户名
@property (copy, nonatomic) NSString *username;
///头像
@property (copy, nonatomic) NSString *headimg;
///问题内容
@property (copy, nonatomic) NSString *question;
///时间
@property (copy, nonatomic) NSString *createtime;
@end

@interface CDQuestionDetailList: NSObject
///回答的id
@property (copy, nonatomic) NSString *aid;
///用户名
@property (copy, nonatomic) NSString *name;
///标签(机构,同学)
@property (copy, nonatomic) NSString *tag;
///头像
@property (copy, nonatomic) NSString *headimg;
///回答的内容
@property (copy, nonatomic) NSString *answer;
///时间
@property (copy, nonatomic) NSString *createtime;
@end


@interface WLKTCDQuestionDetail : NSObject
@property (strong, nonatomic) WLKTCDCourseinfo *courseinfo;
@property (strong, nonatomic) CDQuestionDetailQues *question;
@property (copy, nonatomic) NSArray<CDQuestionDetailList *> *list;
@property (copy, nonatomic) NSString *questionnum;
@property (copy, nonatomic) NSString *answernum;
@property (copy, nonatomic) NSArray *reporttype;

@end




//
//  WLKTNewsCommentList.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/2.
//  Copyright © 2018年 neimbo. All rights reserved.
//
#import "WLKTNewsAnswerItem.h"
#import <Foundation/Foundation.h>

@interface WLKTNewsCommentList : NSObject
///用户id
@property (copy, nonatomic) NSString *user_id;
///学校id
@property (copy, nonatomic) NSString *suid;
///学校名称
@property (copy, nonatomic) NSString *schoolname;
///评论内容
@property (copy, nonatomic) NSString *content;
///总分
@property (copy, nonatomic) NSString *total_score;
///效果
@property (copy, nonatomic) NSString *effect;
///师资
@property (copy, nonatomic) NSString *teacher;
///环境
@property (copy, nonatomic) NSString *environment;
///用户名
@property (copy, nonatomic) NSString *username;
///显示时间
@property (copy, nonatomic) NSString *displaytime;
///评论日期
@property (copy, nonatomic) NSString *day;
///标签
@property (copy, nonatomic) NSString *tag;
@property (copy, nonatomic) NSString *tagcolor;
///评论的分类1是课程,2是活动
@property (copy, nonatomic) NSString *linktype;
///课程或者活动的id,如果linktype=1,这里的linkid就是课程id, 如果linktype=2,这里的linkid就是活动id
@property (copy, nonatomic) NSString *linkid;
///课程或者活动的名称
@property (copy, nonatomic) NSString *title;
///评论总数
@property (copy, nonatomic) NSString *comment_num;
///图片列表
@property (copy, nonatomic) NSArray *imglist;

/**************  投诉数据拼接  ***************/
///投诉内容
@property (copy, nonatomic) NSString *describe;
///投诉总数
@property (copy, nonatomic) NSString *tousutimes;

@property (strong, nonatomic) WLKTNewsAnswerItem *handlelist;


/**************  问答数据拼接  ***************/

///提问内容
@property (copy, nonatomic) NSString *question;
///该问题提问总数
@property (copy, nonatomic) NSString *asknums;

@property (copy, nonatomic) NSString *asktype;

@property (strong, nonatomic) WLKTNewsAnswerItem *answerlist;
@end

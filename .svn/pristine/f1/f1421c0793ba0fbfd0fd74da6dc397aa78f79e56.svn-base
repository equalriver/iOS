//
//  WLKTCDCommentlist.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/29.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDCommentList_item_reply: NSObject
///回复人,只有机构才能回复,所以是学校名称
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *content;
///回复的时间
@property (copy, nonatomic) NSString *createtime;
@end


@interface CDCommentList_item: NSObject
///评价的id
@property (copy, nonatomic) NSString *comId;
///评价人
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *headimg;
///评价的内容
@property (copy, nonatomic) NSString *content;
///效果分
@property (copy, nonatomic) NSString *effect;
///师资分
@property (copy, nonatomic) NSString *teacher;
///环境分
@property (copy, nonatomic) NSString *environment;
///时间
@property (copy, nonatomic) NSString *create_time;
///原图地址
@property (copy, nonatomic) NSArray *picture;
///压缩后的图片地址
@property (copy, nonatomic) NSArray *thumb_picture;
///评价的回复数组
@property (copy, nonatomic) NSArray<CDCommentList_item_reply *> *reply;

@end


@interface WLKTCDCommentlist : NSObject
@property (copy, nonatomic) NSArray<CDCommentList_item *> *list;
@property (copy, nonatomic) NSString *num;
///好评度
@property (copy, nonatomic) NSString *hpd;

@end

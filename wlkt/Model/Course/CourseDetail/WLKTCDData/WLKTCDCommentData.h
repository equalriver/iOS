//
//  WLKTCDCommentData.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/9.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTCDCommentReplyData: NSObject
///回复人,只有机构才能回复,所以是学校名称
@property (copy, nonatomic) NSString *username;
///回复的内容
@property (copy, nonatomic) NSString *content;
///回复的时间
@property (copy, nonatomic) NSString *createtime;
@end


@interface WLKTCDCommentData : NSObject
///评价的id
@property (copy, nonatomic) NSString *comId;
///评价人
@property (copy, nonatomic) NSString *username;
///头像
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
///原图地址,数组
@property (copy, nonatomic) NSArray *picture;
///压缩后的图片地址,数组
@property (copy, nonatomic) NSArray *thumb_picture;
@property (copy, nonatomic) NSArray<WLKTCDCommentReplyData *> *reply;
@end

//
//  WLKTSchoolNewsDetailComment.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/1.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTSchoolNewsDetailComment : NSObject
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *cid;
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *create_time;
@property (copy, nonatomic) NSString *user_id;
@property (copy, nonatomic) NSString *love_num;
@property (copy, nonatomic) NSString *iszan;
@property (copy, nonatomic) NSString *replycount;
@property (strong, nonatomic) WLKTSchoolNewsDetailComment *reply;
@property (copy, nonatomic) NSString *displaytime;
@end

//{
//    "iszan": "1",
//    "content": "鲁谷路",
//    "id": "58",
//    "replycount": "0",
//    "username": "1398****",
//    "create_time": "1512356039",
//    "reply": "<null>",
//    "love_num": "1",
//    "user_id": "20110715044",
//    "displaytime": "12-04 10:53"
//}


//
//  WLKTNews_Q_A_detailReplyData.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/4.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTNews_Q_A_detailReplyData : NSObject
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *answer;
@property (copy, nonatomic) NSArray *picture;
@property (copy, nonatomic) NSArray *thumb_picture;
@property (copy, nonatomic) NSString *create_time;
@property (copy, nonatomic) NSString *user_id;
@end
//{
//    "username": "****",
//    "answer": "why破过敏",
//    "picture": [
//    ],
//    "create_time": "2018-01-04",
//    "thumb_picture": [
//    ],
//    "user_id": "<null>"
//}


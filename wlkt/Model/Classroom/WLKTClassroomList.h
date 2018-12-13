//
//  WLKTClassroomList.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/2/1.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTClassroomList : NSObject
@property (copy, nonatomic) NSString *cid;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *video;
@property (copy, nonatomic) NSString *hits;
@property (copy, nonatomic) NSString *createtime;
@property (copy, nonatomic) NSString *tokenurl;
@property (copy, nonatomic) NSString *thumb_image;
@property (copy, nonatomic) NSString *displaytime;
@property (copy, nonatomic) NSString *videotimes;
@end
//{
//    "id": 6,
//    "title": "tg1",
//    "video": "5ddddd16c50b44b6812ef6c72f7375be",
//    "hits": 19,
//    "createtime": "1517446848",
//    "tokenurl": "http://www.wlktang.com/aliyun/getToken",
//    "thumb_image": "http://vod.wlktang.com/snapshot/5ddddd16c50b44b6812ef6c72f7375be00005.jpg?auth_key=1517463552-0-0-6b964877890f3ea6b212d725dc70e6c9",
//    "displaytime": "4小时前",
//    "videotimes": "1:16"
//}


//
//  WLKTActivityCommentList.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTActivityCommentList : NSObject
@property (copy, nonatomic) NSString *user_id;
@property (copy, nonatomic) NSString *schoolname;
@property (copy, nonatomic) NSString *pointname;
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *total_score;
@property (copy, nonatomic) NSString *effect;
@property (copy, nonatomic) NSString *teacher;
@property (copy, nonatomic) NSString *environment;
@property (copy, nonatomic) NSArray *thumb_picture;
@property (copy, nonatomic) NSArray *picture;
@property (copy, nonatomic) NSString *create_time;
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *comment_id;
@end

//
//  WLKTNewsNormalNewsList.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/2.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTNewsNormalNewsList : NSObject
///新闻id
@property (copy, nonatomic) NSString *nid;
///标签
@property (copy, nonatomic) NSString *newstag;
///标题
@property (copy, nonatomic) NSString *title;
///来源
@property (copy, nonatomic) NSString *from;
///作者
@property (copy, nonatomic) NSString *author;
///浏览数
@property (copy, nonatomic) NSString *hits_num;
///新闻图片列表
@property (copy, nonatomic) NSArray *imglist;
///显示的发布时间
@property (copy, nonatomic) NSString *displaytime;
@property (copy, nonatomic) NSString *tagcolor;
///评论数
@property (copy, nonatomic) NSString *comment_num;
/************ 视频数据拼接 *******************/
///视频地址
@property (copy, nonatomic) NSString *video;
///视频截图
@property (copy, nonatomic) NSString *thumb_image;

@property (copy, nonatomic) NSString *videotimes;
@property (copy, nonatomic) NSString *tokenurl;
@property (copy, nonatomic) NSString *type;
@end

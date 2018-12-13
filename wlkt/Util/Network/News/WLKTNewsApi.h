//
//  WLKTNewsApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/2.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

typedef enum : NSUInteger {
    WLKTNewsTypeFrontPage,
    WLKTNewsTypeVideo,
    WLKTNewsTypeNews,
    WLKTNewsTypeComment,
    WLKTNewsTypeComplaint,
    WLKTNewsType_Q_A
} WLKTNewsType;

@interface WLKTNewsApi : YTKRequest
- (instancetype)initWithType:(WLKTNewsType)type page:(NSInteger)page;
- (instancetype)initWithType:(WLKTNewsType)type page:(NSInteger)page newstag:(NSString *)newstag;
@end

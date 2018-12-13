//
//  WLKTCourseDetailCommentListApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/8.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTCourseDetailCommentListApi : YTKRequest
- (instancetype)initWithCourseId:(NSString *)cid star:(NSInteger)star page:(NSInteger)page;

@end

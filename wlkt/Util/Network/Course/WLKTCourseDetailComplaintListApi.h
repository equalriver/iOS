//
//  WLKTCourseDetailComplaintListApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/8.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTCourseDetailComplaintListApi : YTKRequest
- (instancetype)initWithCourseId:(NSString *)cid page:(NSInteger)page;

@end

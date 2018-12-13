//
//  WLKTHPCourseListApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/8.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTHPCourseListApi : YTKRequest
- (instancetype)initWithLatitude:(NSString *)lat longitude:(NSString *)lng page:(NSInteger)page keyword:(NSString *)keyword;
@end

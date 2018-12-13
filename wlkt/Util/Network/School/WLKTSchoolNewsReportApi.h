//
//  WLKTSchoolNewsReportApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTSchoolNewsReportApi : YTKRequest
- (instancetype)initWithNewsId:(NSString *)nid content:(NSString *)content type:(NSString *)type;
@end

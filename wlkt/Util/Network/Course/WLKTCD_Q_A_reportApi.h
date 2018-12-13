//
//  WLKTCD_Q_A_reportApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/9.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

typedef enum : NSUInteger {
    WLKTReportTypeDefault,
    WLKTReportTypeNews,
    WLKTReportTypeComment,
    WLKTReportTypeQuestion,
    WLKTReportTypeAnswer
} WLKTReportType;

@interface WLKTCD_Q_A_reportApi : YTKRequest
- (instancetype)initWithReportId:(NSString *)rid content:(NSString *)content type:(WLKTReportType)type;
@end

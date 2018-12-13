//
//  WLKTCD_Q_A_reportApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/9.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCD_Q_A_reportApi.h"

@interface WLKTCD_Q_A_reportApi ()
@property (copy, nonatomic) NSString *rid;
@property (copy, nonatomic) NSString *content;
@property (assign, nonatomic) WLKTReportType type;
@end

@implementation WLKTCD_Q_A_reportApi
- (instancetype)initWithReportId:(NSString *)rid content:(NSString *)content type:(WLKTReportType)type
{
    self = [super init];
    if (self) {
        _rid = rid;
        _content = content;
        _type = type;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"report/question";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id" : _rid,
             @"content": _content,
             @"type": @(_type)
             };
}
@end

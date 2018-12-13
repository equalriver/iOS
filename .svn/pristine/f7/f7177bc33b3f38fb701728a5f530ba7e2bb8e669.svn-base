//
//  WLKTSchoolNewsReportApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolNewsReportApi.h"

@interface WLKTSchoolNewsReportApi ()
@property (copy, nonatomic) NSString *nid;
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *type;
@end

@implementation WLKTSchoolNewsReportApi
- (instancetype)initWithNewsId:(NSString *)nid content:(NSString *)content type:(NSString *)type
{
    self = [super init];
    if (self) {
        _nid = nid;
        _content = content;
        _type = type;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"report/news";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id": _nid,
             @"content": _content,
             @"type": _type
             };
}
@end

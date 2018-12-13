//
//  WLKTCDQuestionListApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/8.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDQuestionListApi.h"

@interface WLKTCDQuestionListApi ()
@property (copy, nonatomic) NSString *cid;
@property (nonatomic) NSInteger page;
@end

@implementation WLKTCDQuestionListApi
- (instancetype)initWithCourseId:(NSString *)cid page:(NSInteger)page
{
    self = [super init];
    if (self) {
        _cid = cid;
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"course3/queslist";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id" : _cid,
             @"page": @(_page)
             };
}
@end

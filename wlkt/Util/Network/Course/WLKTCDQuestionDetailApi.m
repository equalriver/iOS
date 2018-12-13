//
//  WLKTCDQuestionDetailApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/8.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDQuestionDetailApi.h"

@interface WLKTCDQuestionDetailApi ()
@property (copy, nonatomic) NSString *qid;
@property (nonatomic) NSInteger page;
@end

@implementation WLKTCDQuestionDetailApi
- (instancetype)initWithQuestionId:(NSString *)qid page:(NSInteger)page
{
    self = [super init];
    if (self) {
        _qid = qid;
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"course3/quesdetails";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id" : _qid,
             @"page": @(_page)
             };
}

@end

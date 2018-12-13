//
//  WLKTNews_Q_A_normalApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/4.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTNews_Q_A_normalApi.h"

@interface WLKTNews_Q_A_normalApi ()
@property (copy, nonatomic) NSString *qid;
@property (nonatomic) NSInteger page;
@end

@implementation WLKTNews_Q_A_normalApi
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
    return @"news/askdetails";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"askid": @(_qid.integerValue),
             @"page": @(_page)
             };
}
@end

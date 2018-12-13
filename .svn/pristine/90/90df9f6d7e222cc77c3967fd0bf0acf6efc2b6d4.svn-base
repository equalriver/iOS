//
//  WLKTActivityDetail_Q_A_listApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityDetail_Q_A_listApi.h"

@interface WLKTActivityDetail_Q_A_listApi ()
@property (copy, nonatomic) NSString *aid;
@property (nonatomic) NSInteger page;
@end

@implementation WLKTActivityDetail_Q_A_listApi
- (instancetype)initWithActivity:(NSString *)aid page:(NSInteger)page
{
    self = [super init];
    if (self) {
        _aid = aid;
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"ques/actlist";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id" : _aid,
             @"page": @(_page)
             };
}

@end

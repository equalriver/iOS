//
//  WLKTActivityDetailComplaintListApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityDetailComplaintListApi.h"

@interface WLKTActivityDetailComplaintListApi ()
@property (copy, nonatomic) NSString *aid;
@property (nonatomic) NSInteger page;
@end

@implementation WLKTActivityDetailComplaintListApi
- (instancetype)initWithActivityId:(NSString *)aid page:(NSInteger)page
{
    self = [super init];
    if (self) {
        _aid = aid;
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"tousu/actlist";
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

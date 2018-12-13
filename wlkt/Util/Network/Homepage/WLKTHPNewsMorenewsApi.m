//
//  WLKTHPNewsMorenewsApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/31.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTHPNewsMorenewsApi.h"

@interface WLKTHPNewsMorenewsApi ()
@property (nonatomic) NSInteger page;
@end

@implementation WLKTHPNewsMorenewsApi
- (instancetype)initWithPage:(NSInteger)page
{
    self = [super init];
    if (self) {
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"index2/morenews";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"page": @(_page)
             };
}
@end

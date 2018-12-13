//
//  WLKTActivityDetailCommentListApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityDetailCommentListApi.h"

@interface WLKTActivityDetailCommentListApi ()
@property (copy, nonatomic) NSString *aid;
@property (copy, nonatomic) NSString *star;
@property (nonatomic) NSInteger page;
@end

@implementation WLKTActivityDetailCommentListApi
- (instancetype)initWithActivity:(NSString *)aid star:(NSString *)star page:(NSInteger)page
{
    self = [super init];
    if (self) {
        _aid = aid;
        _star = star;
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"comlist/actlist";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id" : _aid,
             @"star": _star,
             @"page": @(_page)
             };
}

@end

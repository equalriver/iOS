//
//  WLKTLiveVideoListApi.m
//  wlkt
//
//  Created by 尹平江 on 2018/5/25.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTLiveVideoListApi.h"

@interface WLKTLiveVideoListApi ()
@property (assign, nonatomic) NSInteger page;
@end

@implementation WLKTLiveVideoListApi

- (instancetype)initWithPage:(NSInteger)page
{
    self = [super init];
    if (self) {
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"live/clist";
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

//
//  WLKTClassroomApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/2/1.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTClassroomApi.h"

@interface WLKTClassroomApi ()
@property (nonatomic) NSInteger page;
@end

@implementation WLKTClassroomApi
- (instancetype)initWithPage:(NSInteger)page
{
    self = [super init];
    if (self) {
        _page = page;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"ketang/index";
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

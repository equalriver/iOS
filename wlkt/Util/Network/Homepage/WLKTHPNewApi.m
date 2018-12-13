//
//  WLKTHPNewApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/25.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTHPNewApi.h"

@implementation WLKTHPNewApi
- (NSString *)requestUrl {
    return @"index2/index";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{};
}
@end

//
//  WLKTLaunchPageApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/11.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTLaunchPageApi.h"

@implementation WLKTLaunchPageApi
- (NSString *)requestUrl {
    return @"index2/getload";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             
             };
}
@end


//
//  WLKTJoinSchoolClassifyApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTJoinSchoolClassifyApi.h"

@implementation WLKTJoinSchoolClassifyApi
- (NSString *)requestUrl {
    return @"enter/index";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             };
}
@end

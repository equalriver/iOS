//
//  WLKTHPExchangeCourseApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/26.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTHPExchangeCourseApi.h"

@implementation WLKTHPExchangeCourseApi
- (NSString *)requestUrl {
    return @"index2/getindexyh";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{};
}
@end

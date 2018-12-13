//
//  WLKTSearchApi.m
//  wlkt
//
//  Created by slovelys on 17/3/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSearchApi.h"

@interface WLKTSearchApi ()

@property (copy, nonatomic) NSString *searchText;

@end

@implementation WLKTSearchApi

- (instancetype)initWithSearchText:(NSString *)searchText {
    WLKT_INIT(
              _searchText = [searchText copy];
    )
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (NSString *)requestUrl {
    return  @"course/search/keyword";
}

- (id)requestArgument {
    return @{
             @"keyword" : _searchText
             };
}

@end

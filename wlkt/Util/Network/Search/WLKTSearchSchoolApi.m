//
//  WLKTSearchSchoolApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSearchSchoolApi.h"

@interface WLKTSearchSchoolApi ()
@property (copy, nonatomic) NSString *searchText;
@property (assign, nonatomic) int page;

@end

@implementation WLKTSearchSchoolApi
- (instancetype)initWithSearchText:(NSString *)searchText page:(int)page{
    WLKT_INIT(
              _searchText = [searchText copy];
              _page = page;
              )
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (NSString *)requestUrl {
    return  @"search/school/keyword";
}

- (id)requestArgument {
    return @{
             @"keyword" : _searchText,
             @"page" : @(_page)
             };
}
@end

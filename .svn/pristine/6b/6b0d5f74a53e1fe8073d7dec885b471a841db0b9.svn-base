//
//  WLKTSNSLoginApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/23.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSNSLoginApi.h"

@interface WLKTSNSLoginApi ()
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *snsuserid;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *head;
@end

@implementation WLKTSNSLoginApi
- (instancetype)initWithType:(NSString *)type snsuserid:(NSString *)snsuserid name:(NSString *)name head:(NSString *)head{
    WLKT_INIT(
              _type = type;
              _snsuserid = snsuserid;
              _name = name;
              _head = head;
              )
}

- (NSString *)requestUrl {
    return @"sns/login";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"type" : _type ?: @"",
             @"snsuserid" : _snsuserid ?: @"",
             @"name" : _name ?: @"",
             @"head": _head ?: @""
             };
}
@end

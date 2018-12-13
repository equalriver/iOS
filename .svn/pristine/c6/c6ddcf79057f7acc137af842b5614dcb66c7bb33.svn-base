//
//  WLKTUserTeamworkApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUserTeamworkApi.h"

@interface WLKTUserTeamworkApi ()
@property (copy, nonatomic) NSString *describe;
@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *type;
@end

@implementation WLKTUserTeamworkApi
- (instancetype)initWithDescribe:(NSString *)describe phone:(NSString *)phone type:(NSString *)type
{
    self = [super init];
    if (self) {
        _describe = describe;
        _phone = phone;
        _type = type;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"tousu/cooper";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"describe": _describe,
             @"phone": _phone,
             @"type": _type
             };
}
@end

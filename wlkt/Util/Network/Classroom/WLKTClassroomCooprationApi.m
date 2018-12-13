//
//  WLKTClassroomCooprationApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/2/7.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTClassroomCooprationApi.h"

@interface WLKTClassroomCooprationApi ()
@property (copy, nonatomic) NSString *describe;
@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *name;
@end

@implementation WLKTClassroomCooprationApi
- (instancetype)initWithDescribe:(NSString *)describe phone:(NSString *)phone name:(NSString *)name
{
    self = [super init];
    if (self) {
        _describe = describe ? describe : @"";
        _phone = phone ? phone : @"";
        _name = name ? name : @"";
    }
    return self;
}

- (NSString *)requestUrl {
    return @"tousu/videocourse";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"describe": _describe,
             @"phone": _phone,
             @"name": _name
             };
}
@end

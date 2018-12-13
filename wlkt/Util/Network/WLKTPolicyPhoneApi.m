//
//  WLKTPolicyPhoneApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/2/26.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTPolicyPhoneApi.h"

@interface WLKTPolicyPhoneApi ()
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *typeId;
@property (copy, nonatomic) NSString *phone;
@end

@implementation WLKTPolicyPhoneApi
- (instancetype)initWithType:(WLKTPolicyPhoneType)type typeId:(NSString *)typeId phone:(NSString *)phone
{
    self = [super init];
    if (self) {
        switch (type) {
            case WLKTPolicyPhoneTypeCourse:
                _type = @"course";
                break;
            case WLKTPolicyPhoneTypeActivity:
                _type = @"activity";
                break;
            case WLKTPolicyPhoneTypeSchool:
                _type = @"school";
                break;
            default:
                break;
        }
        _typeId = typeId;
        _phone = phone;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"call/tocall";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"type": _type,
             @"id": _typeId ? _typeId : @"",
             @"phone": _phone ? _phone : @""
             };
}

@end

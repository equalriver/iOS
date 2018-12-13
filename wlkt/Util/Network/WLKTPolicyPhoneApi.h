//
//  WLKTPolicyPhoneApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/2/26.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

typedef enum : NSUInteger {
    WLKTPolicyPhoneTypeCourse,
    WLKTPolicyPhoneTypeActivity,
    WLKTPolicyPhoneTypeSchool,
} WLKTPolicyPhoneType;

@interface WLKTPolicyPhoneApi : YTKRequest
- (instancetype)initWithType:(WLKTPolicyPhoneType)type typeId:(NSString *)typeId phone:(NSString *)phone;
@end

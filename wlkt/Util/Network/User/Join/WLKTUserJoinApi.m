//
//  WLKTUserJoinApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUserJoinApi.h"

@interface WLKTUserJoinApi ()
@property (copy, nonatomic) NSString *schify;//机构分类,传id给我
@property (copy, nonatomic) NSString *schname;//学校名称
@property (copy, nonatomic) NSString *fr_phone;//法人电话
@property (copy, nonatomic) NSString *user;//申请人姓名
@property (copy, nonatomic) NSString *phone;//申请人电话
@property (copy, nonatomic) NSString *email;//申请人邮箱
@end

@implementation WLKTUserJoinApi
- (instancetype)initWithSchify:(NSString *)schify
                       schname:(NSString *)schname
                      fr_phone:(NSString *)fr_phone
                          user:(NSString *)user
                         phone:(NSString *)phone
                         email:(NSString *)email
{
    self = [super init];
    if (self) {
        _schify = schify;
        _schname = schname;
        _fr_phone = fr_phone;
        _user = user;
        _phone = phone;
        _email = email;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"enter/enter";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"schify": _schify,
             @"schname": _schname,
             @"fr_phone": _fr_phone,
             @"user": _user,
             @"phone": _phone,
             @"email": _email
             };
}
@end



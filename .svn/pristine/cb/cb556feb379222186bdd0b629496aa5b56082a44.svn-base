//
//  WLKTMessageReadApi.m
//  wlkt
//
//  Created by 尹平江 on 2017/5/4.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTMessageReadApi.h"
#import "WLKTLogin.h"

@interface WLKTMessageReadApi ()
@property (assign, nonatomic) NSInteger msgID;

@end

@implementation WLKTMessageReadApi

- (instancetype)initWithMessageId:(NSInteger)msgID
{
    self = [super init];
    if (self) {
        _msgID = msgID;
    }
    return self;
}


- (NSString *)requestUrl {
    return @"message/getread";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id" : @(_msgID),
             @"app_userinfo" : TheCurUser.token
             };
}

@end

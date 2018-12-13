//
//  WLKTUserinfoChangeApi.h
//  wlkt
//
//  Created by 尹平江 on 17/3/28.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTUserinfoChangeApi : YTKRequest

- (instancetype)initWithUsername:(NSString *)username sex:(NSString *)sex phone:(NSString *)phone hobby:(NSString *)hobby;

@end

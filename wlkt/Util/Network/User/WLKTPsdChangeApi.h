//
//  WLKTPsdChangeApi.h
//  wlkt
//
//  Created by 尹平江 on 17/3/30.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTPsdChangeApi : YTKRequest
- (instancetype)initWithOldPassword:(NSString *)OldPassword otherPassword:(NSString *)otherPassword;
@end

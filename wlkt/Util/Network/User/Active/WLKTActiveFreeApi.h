//
//  WLKTActiveFreeApi.h
//  wlkt
//
//  Created by 尹平江 on 2017/7/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTActiveFreeApi : YTKRequest
- (instancetype)initWithHdid:(NSString *)hdid uname:(NSString *)uname uphone:(NSString *)uphone renshu:(NSString *)renshu;
@end

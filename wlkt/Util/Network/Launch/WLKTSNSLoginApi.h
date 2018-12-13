//
//  WLKTSNSLoginApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/23.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTSNSLoginApi : YTKRequest
- (instancetype)initWithType:(NSString *)type snsuserid:(NSString *)snsuserid name:(NSString *)name head:(NSString *)head;

@end

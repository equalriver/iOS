//
//  WLKTSNSValidateApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/28.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTSNSValidateApi : YTKRequest
- (instancetype)initWithPhone:(NSString *)phone code:(NSString *)code;
@end

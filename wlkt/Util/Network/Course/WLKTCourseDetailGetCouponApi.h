//
//  WLKTCourseDetailGetCouponApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTCourseDetailGetCouponApi : YTKRequest
///errorCode 状态,0成功,-1(重复领取或者已经领取完毕)
- (instancetype)initWithCouponId:(NSString *)cid;

@end

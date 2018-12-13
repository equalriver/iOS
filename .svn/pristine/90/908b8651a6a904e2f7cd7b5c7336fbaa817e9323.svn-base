//
//  WLKTCDPriceFilterApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/10.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

typedef enum : NSUInteger {
    WLKTCDPriceFilterTypeDefault,
    WLKTCDPriceFilterTypePriceType,
    WLKTCDPriceFilterTypeClassType,
    WLKTCDPriceFilterTypeStandard,
    WLKTCDPriceFilterTypeAddress
} WLKTCDPriceFilterType;

@interface WLKTCDPriceFilterApi : YTKRequest
- (instancetype)initWithCourseId:(NSString *)courseId
                       priceType:(NSString *)priceType
                       classType:(NSString *)classType
                        standard:(NSString *)standard
                         address:(NSString *)address
                            type:(WLKTCDPriceFilterType)type
                             lat:(NSString *)lat
                             lng:(NSString *)lng;
@end

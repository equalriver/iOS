//
//  WLKTCDPriceFilterApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/10.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDPriceFilterApi.h"

@interface WLKTCDPriceFilterApi ()
@property (copy, nonatomic) NSString *courseId;
@property (copy, nonatomic) NSString *priceType;
@property (copy, nonatomic) NSString *classType;
@property (copy, nonatomic) NSString *standard;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *lat;
@property (copy, nonatomic) NSString *lng;
@end

@implementation WLKTCDPriceFilterApi
- (instancetype)initWithCourseId:(NSString *)courseId
                       priceType:(NSString *)priceType
                       classType:(NSString *)classType
                        standard:(NSString *)standard
                         address:(NSString *)address
                            type:(WLKTCDPriceFilterType)type
                             lat:(NSString *)lat
                             lng:(NSString *)lng
{
    self = [super init];
    if (self) {
        _courseId = courseId;
        _priceType = priceType;
        _classType = classType;
        _standard = standard;
        _address = address;
        _type = @"";
        _lat = lat;
        _lng = lng;
        switch (type) {
            case WLKTCDPriceFilterTypePriceType:
                _type = @"shoufei";
                break;
                
            case WLKTCDPriceFilterTypeClassType:
                _type = @"banxing";
                break;
                
            case WLKTCDPriceFilterTypeStandard:
                _type = @"biaozhun";
                break;
                case WLKTCDPriceFilterTypeAddress:
                _type = @"address";
                break;
            default:
                break;
        }
    }
    return self;
}

- (NSString *)requestUrl {
    return @"course3/pricesys";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"kecid" : _courseId,
             @"pricetype": _priceType,
             @"classtype": _classType,
             @"standard": _standard,
             @"address": _address,
             @"clickname": _type,
             @"lat": _lat,
             @"lng": _lng
             };
}
@end


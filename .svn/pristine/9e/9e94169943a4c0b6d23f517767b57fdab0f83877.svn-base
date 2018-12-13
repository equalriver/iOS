//
//  WLKTClassifyActivityListApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/18.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTClassifyActivityListApi.h"

@interface WLKTClassifyActivityListApi ()
@property (copy, nonatomic) NSString *lat;
@property (copy, nonatomic) NSString *lng;
@property (nonatomic) NSInteger page;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *keyword;
@property (copy, nonatomic) NSString *value;
@end

@implementation WLKTClassifyActivityListApi
- (instancetype)initWithLatitude:(NSString *)lat longitude:(NSString *)lng page:(NSInteger)page ClassifySearchType:(ClassifySearchType)type keyword:(NSString *)keyword value:(NSString *)value
{
    self = [super init];
    if (self) {
        _lat = lat;
        _lng = lng;
        _page = page;
        _keyword = keyword;
        _value = value;
        switch (type) {
            case ClassifySearchTypeDistance:
                _type = @"distance";
                break;
            case ClassifySearchTypeClassify:
                _type = @"classify";
                break;
            case ClassifySearchTypeSmartSort:
                _type = @"smart";
                break;
            case ClassifySearchTypeFliter:
                _type = @"filter";
                break;
            case ClassifySearchTypeNone:
                _type = @"";
                break;
        }
    }
    return self;
}

- (NSString *)requestUrl {
    return @"act2/index";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"lat": _lat,
             @"lng": _lng,
             @"page": @(_page),
             _type: _value ? _value : @"",
             @"keyword": _keyword ? _keyword : @""
             };
}
@end



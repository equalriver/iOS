//
//  WLKTClassifyCourseListApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/5.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"
#import "WLKTClassifySearchResult.h"

@interface WLKTClassifyCourseListApi : YTKRequest
- (instancetype)initWithLatitude:(NSString *)lat longitude:(NSString *)lng page:(NSInteger)page ClassifySearchType:(ClassifySearchType)type keyword:(NSString *)keyword value:(NSString *)value;
@end

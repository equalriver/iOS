//
//  WLKTSearchSchoolApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTSearchSchoolApi : YTKRequest
- (instancetype)initWithSearchText:(NSString *)searchText page:(int)page;

@end

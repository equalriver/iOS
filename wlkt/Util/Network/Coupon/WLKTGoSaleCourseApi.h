//
//  WLKTGoSaleCourseApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTGoSaleCourseApi : YTKRequest
- (instancetype)initWithCid:(NSString *)cid page:(int)page;

@end

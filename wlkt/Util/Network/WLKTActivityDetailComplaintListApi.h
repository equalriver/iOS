//
//  WLKTActivityDetailComplaintListApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTActivityDetailComplaintListApi : YTKRequest
- (instancetype)initWithActivityId:(NSString *)aid page:(NSInteger)page;
@end

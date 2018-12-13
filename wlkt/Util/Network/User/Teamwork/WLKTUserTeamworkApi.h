//
//  WLKTUserTeamworkApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTUserTeamworkApi : YTKRequest
- (instancetype)initWithDescribe:(NSString *)describe phone:(NSString *)phone type:(NSString *)type;
@end

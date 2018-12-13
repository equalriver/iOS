//
//  WLKTMessageReadApi.h
//  wlkt
//
//  Created by 尹平江 on 2017/5/4.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTMessageReadApi : YTKRequest
- (instancetype)initWithMessageId:(NSInteger)msgID;

@end

//
//  WLKTCDQuestionDetailApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/8.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTCDQuestionDetailApi : YTKRequest
- (instancetype)initWithQuestionId:(NSString *)qid page:(NSInteger)page;
@end

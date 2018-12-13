//
//  WLKTActivityDetail_ques.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTActivityDetail_quesList.h"

@interface WLKTActivityDetail_ques : NSObject
///问答个数
@property (copy, nonatomic) NSString *total;
@property (copy, nonatomic) NSArray<WLKTActivityDetail_quesList *> *ques;
@end

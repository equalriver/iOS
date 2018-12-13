//
//  WLKTActivityDetailComplaint.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTActivityDetailComplaintList.h"

@interface WLKTActivityDetailComplaint : NSObject
///投诉个数
@property (copy, nonatomic) NSString *total;
@property (copy, nonatomic) NSArray<WLKTActivityDetailComplaintList *> *complaint;
@end

//
//  WLKTClassifyData.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/5.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTClassifyNaviData.h"
#import "WLKTClassifyBanner.h"
#import "WLKTCourse.h"
#import "WLKTClassifyFliterItem.h"
#import "WLKTClassifyFliterClassify.h"

@interface WLKTClassifyData : NSObject
@property (copy, nonatomic) NSArray<WLKTClassifyNaviData *> *nav_classify;
@property (copy, nonatomic) NSArray<WLKTClassifyBanner *> *banner;
@property (copy, nonatomic) NSArray<WLKTCourse *> *list;
@property (copy, nonatomic) NSString *course_num;
@property (copy, nonatomic) NSString *act_num;
@property (copy, nonatomic) NSString *sch_num;
@property (copy, nonatomic) NSArray<WLKTClassifyFliterItem *> *distance;
@property (copy, nonatomic) NSArray<WLKTClassifyFliterClassify *> *classify;
@property (copy, nonatomic) NSArray<WLKTClassifyFliterItem *> *smartsort;
@property (copy, nonatomic) NSArray<WLKTClassifyFliterItem *> *filter;
@property (copy, nonatomic) NSArray<WLKTCourse *> *tuijianlist;
@end

//
//  WLKTClassifyData.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/5.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTClassifyData.h"

@implementation WLKTClassifyData
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"nav_classify": [WLKTClassifyNaviData class],
             @"banner": [WLKTClassifyBanner class],
             @"list": [WLKTCourse class],
             @"distance": [WLKTClassifyFliterItem class],
             @"classify": [WLKTClassifyFliterClassify class],
             @"smartsort": [WLKTClassifyFliterItem class],
             @"filter": [WLKTClassifyFliterItem class]
             };
}
@end

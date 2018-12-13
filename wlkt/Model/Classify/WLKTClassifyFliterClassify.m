//
//  WLKTClassifyFliterClassify.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/5.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTClassifyFliterClassify.h"

@implementation WLKTClassifyFliterClassify
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{
             @"fid" : @"id"
             };
}
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"child": [WLKTClassifyFliterItem class]
             };
}
@end

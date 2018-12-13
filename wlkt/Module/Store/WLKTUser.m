//
//  WLKTUser.m
//  wlkt
//
//  Created by slovelys on 17/3/19.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUser.h"

@implementation WLKTUser

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"uid" : @"id"
             };
}

- (NSString *)description {
    return self.modelDescription;
}

@end

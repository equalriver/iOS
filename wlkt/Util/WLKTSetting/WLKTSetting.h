//
//  WLKTSetting.h
//  wlkt
//
//  Created by slovelys on 2017/4/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTSetting : NSObject

+ (NSString *)cacheCostString;
+ (void)clearCacheWithCompletion:(void (^)(void))completion;

@end

//
//  WLKTCourseTableData.h
//  wlkt
//
//  Created by slovelys on 17/3/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTHomepageApi.h"
#import "WLKTHomepage.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^InitializeCompletion)(WLKTHomepage *homepage, WLKTViewState state);

@interface WLKTCourseTableData : NSObject

+ (void)initializeDataWithCompletion:(InitializeCompletion)completion ;

@end

NS_ASSUME_NONNULL_END

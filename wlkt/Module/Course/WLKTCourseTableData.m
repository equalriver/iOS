//
//  WLKTCourseTableData.m
//  wlkt
//
//  Created by slovelys on 17/3/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseTableData.h"

@implementation WLKTCourseTableData

+ (void)initializeDataWithCompletion:(InitializeCompletion)completion {
    WLKTHomepageApi *initializeApi = [[WLKTHomepageApi alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [initializeApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            WLKTHomepage *homepage = [WLKTHomepage modelWithDictionary:request.responseJSONObject[@"result"]];
            if (completion) {
                completion(homepage, WLKTViewStateNormal);
            }
        } failure:^(__kindof YTKBaseRequest *request) {
            ShowApiError;
            WLKTHomepage *homepage = [WLKTHomepage new];
            if (completion) {
                completion(homepage, WLKTViewStateError);
            }
        }];
    });
}

@end

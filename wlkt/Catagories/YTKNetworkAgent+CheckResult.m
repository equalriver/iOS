//
//  YTKNetworkAgent+CheckResult.m
//  wlkt
//
//  Created by slovelys on 17/3/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKNetworkAgent+CheckResult.h"
#import "YTKNetworkPrivate.h"
#import <Aspects.h>

@implementation YTKNetworkAgent (CheckResult)

//+ (void)load {
//    #pragma clang diagnostic push
//    #pragma clang diagnostic ignored "-Wundeclared-selector"
//    [self swizzleInstanceMethod:@selector(checkResult:) with:@selector(wlkt_checkResult:)];
//    #pragma clang diagnostic pop
//}
//
//- (BOOL)wlkt_checkResult:(YTKBaseRequest *)request {
//    id json = [request responseJSONObject];
//    BOOL result = [request statusCodeValidator] && ([json[@"errorCode"] integerValue] == 0);
//    if (json[@"errorCode"] && [[json[@"errorCode"] stringValue] length] > 0) {
//        result = NO;
//        if ([json[@"errorCode"] integerValue] == 0) {
//            result = YES;
//        }
//    }
//
//    id validator = [request jsonValidator];
//    if (validator != nil) {
//        result = [YTKNetworkPrivate checkJson:json withValidator:validator];
//    }
//    return result;
//}

@end

//
//  WLKTPopupControllerFactory.m
//  wlkt
//
//  Created by slovelys on 2017/7/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTPopupControllerFactory.h"

@implementation WLKTPopupControllerFactory

+ (WLKTPopupController *)popupControllerWithType:(WLKTPopupControllerType)type {
    Class cls = NSClassFromString([[self classArray] objectAtIndex:type]);
    WLKTPopupController *popup = [[cls alloc] init];
    return popup;
}

+ (NSArray *)classArray {
    return @[@"WLKTActivityPopupController"];
}

@end

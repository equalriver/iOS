//
//  WLKTPopupControllerFactory.h
//  wlkt
//
//  Created by slovelys on 2017/7/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTPopupController.h"

typedef NS_ENUM(NSUInteger, WLKTPopupControllerType) {
    WLKTPopupControllerTypeActivity
};

@interface WLKTPopupControllerFactory : NSObject

+ (WLKTPopupController *)popupControllerWithType:(WLKTPopupControllerType)type;

@end

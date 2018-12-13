//
//  WLKTMessageManager.m
//  wlkt
//
//  Created by slovelys on 2017/4/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTMessageManager.h"
#import "WLKTMsgNotiApi.h"
#import "AppDelegate.h"
#import "WLKTAppCoordinator.h"
#import "WLKTLogin.h"
#import <UITabBarItem+WZLBadge.h>
#import <UIBarButtonItem+WZLBadge.h>
#import <UIView+WZLBadge.h>

@interface WLKTMessageManager ()

@property (strong, nonatomic) WLKTMsgNotiApi *api;
@property (strong, nonatomic) NSHashTable<UIBarButtonItem *> *messageButtons;
@property (weak, nonatomic) UITabBarController *rootTabBarController;
@property (weak, nonatomic) WLKTAppCoordinator *appCoordinator;
@property (assign, nonatomic) BOOL hasBadge;

@end

@implementation WLKTMessageManager

+ (instancetype)sharedManager {
    static WLKTMessageManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self new];
    });
    return manager;
}

- (void)requestLatestMessagesWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    if ([WLKTLogin curUser]) {
        @weakify(self)
        [self.api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            @strongify(self)
            __block BOOL hasNoReadMessage = NO;
            NSArray *messageArray = request.responseJSONObject[@"result"][@"list"];
            [messageArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj[@"status"] integerValue] == 0 ) {
                     [self setBadge];
                    hasNoReadMessage = YES;
                    *stop = YES;
                }
            }];
//            if (numberOfNewMessages.unsignedIntegerValue) {
//                [self setBadge];
//            }
            
            if (completionHandler) {
                if (hasNoReadMessage) {
                    completionHandler(UIBackgroundFetchResultNewData);
                } else {
                    completionHandler(UIBackgroundFetchResultNoData);
                }
            }
        } failure:^(__kindof YTKBaseRequest *request) {
            if (completionHandler) {
                completionHandler(UIBackgroundFetchResultFailed);
            }
        }];
    } else {
        if (completionHandler) {
            completionHandler(UIBackgroundFetchResultNoData);
        }
    }
}

- (void)addMessageButton:(id)button {
    [self.messageButtons addObject:button];
}

- (void)setBadge {
    self.hasBadge = YES;
    for (id messageButton in _messageButtons) {
        if ([messageButton isKindOfClass:[UIBarButtonItem class]]) {
            [(UIBarButtonItem *)messageButton showBadge];
            ((UIBarButtonItem *)messageButton).badgeCenterOffset = CGPointMake(-3, 10);
        } else if ([messageButton isKindOfClass:[UITabBarItem class]]) {
            [(UITabBarItem *)messageButton showBadge];
            ((UITabBarItem *)messageButton).badgeCenterOffset = CGPointMake(0, 2);
        } else if ([messageButton isKindOfClass:[UILabel class]]) {
            [(UILabel *)messageButton showBadge];
            ((UILabel *)messageButton).badgeCenterOffset = CGPointMake(3, 1);
        }
    }
    
}

- (void)clearBadge {
    self.hasBadge = NO;
     for (id messageButton in _messageButtons) {
         if ([messageButton isKindOfClass:[UIBarButtonItem class]]) {
             [(UIBarButtonItem *)messageButton clearBadge];
         } else if ([messageButton isKindOfClass:[UITabBarItem class]]) {
             [(UITabBarItem *)messageButton clearBadge];
         } else if ([messageButton isKindOfClass:[UILabel class]]) {
             [(UILabel *)messageButton clearBadge];
         }
    }
}

#pragma mark - Setters & Getters

- (WLKTMsgNotiApi *)api {
    if (!_api) {
        _api = [WLKTMsgNotiApi new];
    }
    return _api;
}

- (NSHashTable *)messageButtons {
    if (!_messageButtons) {
        _messageButtons = [NSHashTable weakObjectsHashTable];
    }
    return _messageButtons;
}

- (UITabBarController *)rootTabBarController {
    if (!_rootTabBarController) {
        _rootTabBarController = (UITabBarController *)kKeyWindow.rootViewController;
    }
    return _rootTabBarController;
}

- (WLKTAppCoordinator *)appCoordinator {
    if (!_appCoordinator) {
        _appCoordinator = ((AppDelegate *)[UIApplication sharedApplication].delegate).appCoordinator;
    }
    return _appCoordinator;
}

@end

//
//  WLKTMessageManager.h
//  wlkt
//
//  Created by slovelys on 2017/4/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTMessageManager : NSObject

@property (strong, nonatomic, readonly) NSMutableArray *messages;

+ (instancetype)sharedManager;

- (void)addMessageButton:(id)button;

- (void)requestLatestMessagesWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

- (void)setBadge;
- (void)clearBadge;

@end

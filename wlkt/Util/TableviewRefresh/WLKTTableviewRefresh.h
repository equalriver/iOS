//
//  WLKTTableviewRefresh.h
//  wlkt
//
//  Created by 尹平江 on 17/4/17.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJRefresh.h>

typedef void(^requestBlock)(void);
typedef void(^footerBlock)(void);

@interface WLKTTableviewRefresh : NSObject
+ (void)tableviewRefreshHeaderWithTaget:(UIScrollView *)currentView request:(requestBlock)request;
+ (void)tableviewRefreshFooterWithTaget:(UIScrollView *)currentView block:(footerBlock)footerBlock;

@end

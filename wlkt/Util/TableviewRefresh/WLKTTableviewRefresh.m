//
//  WLKTTableviewRefresh.m
//  wlkt
//
//  Created by 尹平江 on 17/4/17.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTTableviewRefresh.h"



@implementation WLKTTableviewRefresh

+ (void)tableviewRefreshHeaderWithTaget:(UIScrollView *)currentView request:(requestBlock)request{

    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        request();
        
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTintColor:KMainTextColor_6];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"释放更新" forState:MJRefreshStatePulling];
    [header setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    currentView.mj_header = header;
    
}

+ (void)tableviewRefreshFooterWithTaget:(UIScrollView *)currentView block:(footerBlock)footerBlock{
     MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
         footerBlock();
     }];
    footer.backgroundColor = kMainBackgroundColor;
    [footer setTintColor:KMainTextColor_6];
    [footer setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
    [footer setTitle:@"正在加载数据..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];
    footer.automaticallyRefresh = NO;
//    footer.automaticallyHidden = YES;
    footer.automaticallyChangeAlpha = YES;
    currentView.mj_footer = footer;
}

@end

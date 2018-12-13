//
//  WLKTBannerData.m
//  wlkt
//
//  Created by slovelys on 17/3/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTBannerData.h"
#import <BlocksKit.h>
#import "WLKTBannerApi.h"
#import "WLKTCourse.h"

@interface WLKTBannerData () <SDCycleScrollViewDelegate>

@property (assign, nonatomic) WLKTBannerPosition position;
@property (copy, nonatomic) NSArray *dataSource;
@property (strong, nonatomic) WLKTBannerApi *api;
@property (weak, nonatomic) SDCycleScrollView *bannerView;

@end

@implementation WLKTBannerData

- (instancetype)initWithBannerView:(SDCycleScrollView *)bannerView position:(WLKTBannerPosition)position {
    WLKT_INIT(
              _bannerView = bannerView;
              _bannerView.autoScroll = YES;
              _bannerView.delegate = self;
              _position = position;
              bannerView.autoScrollTimeInterval = 5;
              bannerView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
              _bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
              bannerView.backgroundColor = UIColorHex(f5f5f5);
              _bannerView.currentPageDotColor = kNavBarBackgroundColor;
    )
}

- (void)dealloc {
    [_api stop];
}

- (void)reloadData {
    void (^completion)(id) = ^(id responseJSONObject) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSArray *courseArray = [NSArray modelArrayWithClass:[WLKTCourse class] json:responseJSONObject[@"result"][@"bannerlist"]];
            NSArray *imgUrls = [courseArray bk_map:^id(WLKTCourse *obj) {
                return obj.img;
            }];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.dataSource = courseArray;
                self.bannerView.imageURLStringsGroup = imgUrls;
            });
        });
    };
    
    if (self.api.cacheJson) {
        completion(_api.cacheJson);
    }
    
    [_api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        completion(request.responseJSONObject);
    } failure:^(__kindof YTKBaseRequest *request) {
        
    }];
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(bannerView:didSelectCourseItem:)]) {
        [self.delegate bannerView:self.bannerView didSelectCourseItem:self.dataSource[index]];
    }
}

#pragma mark - Getters & Setters
- (WLKTBannerApi *)api {
    if (!_api) {
        _api = [[WLKTBannerApi alloc] initWithPosition:_position];
    }
    return _api;
}

@end

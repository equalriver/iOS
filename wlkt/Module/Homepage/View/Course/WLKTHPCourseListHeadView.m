//
//  WLKTHPCourseListHeadView.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/9.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTHPCourseListHeadView.h"
#import "SDCycleScrollView.h"


@interface WLKTHPCourseListHeadView ()<SDCycleScrollViewDelegate>
@property (strong, nonatomic) SDCycleScrollView *bannerView;
@property (strong, nonatomic) UIView *sepView;

@end

@implementation WLKTHPCourseListHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _currentItem = -1;
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.bannerView];
        [self addSubview:self.sepView];
        [self makeConstraints];
    }
    return self;
}

- (void)setData:(WLKTClassifyData *)data{
    _data = data;
    if (data.banner.count) {
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:3];
        for (WLKTClassifyBanner *obj in data.banner) {
            [arr addObject:obj.img];
        }
        self.bannerView.imageURLStringsGroup = arr;
    }

}

#pragma mark - banner view delegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    if (self.data.banner.count) {
        if ([self.delegate respondsToSelector:@selector(didSelectedImageWithType:url:)]) {
            [self.delegate didSelectedImageWithType:self.data.banner[index].type url:self.data.banner[index].url];
        }
    }
}


#pragma mark -
- (void)makeConstraints{
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth - 20 *ScreenRatio_6, 100 *ScreenRatio_6));
        make.center.mas_equalTo(self);
        
    }];
    [self.sepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 10 *ScreenRatio_6));
        make.left.bottom.mas_equalTo(self);
    }];

}

#pragma mark - get
- (SDCycleScrollView *)bannerView{
    if (!_bannerView) {
        _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectNull delegate:self placeholderImage:[UIImage imageNamed:@"活动banner1"]];
        _bannerView.backgroundColor = [UIColor whiteColor];
        _bannerView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    }
    return _bannerView;
}
- (UIView *)sepView{
    if (!_sepView) {
        _sepView = [UIView new];
        _sepView.backgroundColor = kMainBackgroundColor;
    }
    return _sepView;
}

@end


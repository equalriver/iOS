//
//  WLKTHPBannerView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/25.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HPBannerViewDelegate<NSObject>
- (void)didSelectedBannerItem:(NSInteger)index;
@end

@interface WLKTHPBannerView : UIView
@property (weak, nonatomic) id<HPBannerViewDelegate> delegate;
@property (nonatomic, copy) NSArray *bannerArr;
@end

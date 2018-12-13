//
//  WLKTClassifyHeadView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/4.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTClassifyData.h"
#import "WLKTClassifySearchResult.h"

@protocol ClassifyHeadNaviDelegate <NSObject>
- (void)didSelectedNaviItemByType:(NSString *)type;
- (void)didSelectedImageWithType:(WLKTBannerListTye)type url:(NSString *)url;
@end

@interface WLKTClassifyHeadView : UIView
@property (strong, nonatomic) WLKTClassifyData *data;
@property (strong, nonatomic) UICollectionView *classifyCV;
@property (nonatomic) NSInteger currentItem;
@property (weak, nonatomic) id<ClassifyHeadNaviDelegate> delegate;
@end

//
//  WLKTHPRecommendInterestCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/24.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTHomepageInterestItem.h"

@protocol RecommendInterestDelegate<NSObject>
- (void)didSelectedInterestItem:(NSInteger)index;
@end

@interface WLKTHPRecommendInterestCell : UITableViewCell
@property (weak, nonatomic) id<RecommendInterestDelegate> delegate;
- (instancetype)initWithInterestArray:(NSArray *)array;
@end

//
//  WLKTHPRecommendVRCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/24.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTSchoolVRList.h"

@protocol WLKTHPRecommendDelegate <NSObject>
- (void)didSelectedVRPhotoWithIndex:(NSInteger)index;
@end

@interface WLKTHPRecommendVRCell : UITableViewCell
@property (weak, nonatomic) id<WLKTHPRecommendDelegate> delegate;
- (instancetype)initWithListArr:(NSArray<WLKTSchoolVRList *> *)array;
@end

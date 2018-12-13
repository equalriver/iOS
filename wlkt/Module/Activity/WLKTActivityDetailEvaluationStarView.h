//
//  WLKTActivityDetailEvaluationStarView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//
#import "WLKTActivityCommentStar.h"

@protocol ActivityDetailEvaluationStarDelegate <NSObject>
- (void)didSelectedStarItem:(NSInteger)index;
@end

@interface WLKTActivityDetailEvaluationStarView : UIView
@property (weak, nonatomic) id<ActivityDetailEvaluationStarDelegate> delegate;
- (void)setStarWithData:(WLKTActivityCommentStar *)data;
@end

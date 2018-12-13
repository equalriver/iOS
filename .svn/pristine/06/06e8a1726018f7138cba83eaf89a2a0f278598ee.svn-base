//
//  WLKTActivityDetail_Q_A_2_headerQuestionView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTActivityDetail_QA_question.h"

@protocol ActivityDetail_Q_A_2_headerQuestionDelegate <NSObject>
- (void)didSelectedAnswerButtonAtIndex:(NSInteger)index;
@end

@interface WLKTActivityDetail_Q_A_2_headerQuestionView : UIView
- (instancetype)initWithIndex:(NSInteger)index frame:(CGRect)frame;
@property (weak, nonatomic) id<ActivityDetail_Q_A_2_headerQuestionDelegate> delegate;
- (void)setCellData:(WLKTActivityDetail_QA_question *)data;
@end

//
//  WLKTNewsCommentSectionView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTNewsCommentList.h"
#import "WLKTNewsComplaintList.h"
#import "WLKTNews_Q_A_list.h"
#import "WLKTNews_Q_A_detailData.h"

typedef enum : NSUInteger {
    NewsSectionViewTypeComment,
    NewsSectionViewTypeComplaint,
    NewsSectionViewType_Q_A,
    NewsSectionViewType_Q_A_detail,
} NewsSectionViewType;

@interface WLKTNewsCommentSectionView : UIView
- (instancetype)initWithFrame:(CGRect)frame type:(NewsSectionViewType)type data:(id)data clickHandle:(void(^)(void))clickHandle;
@property (strong, nonatomic) UILabel *titleLabel;
@end

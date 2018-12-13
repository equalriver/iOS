//
//  WLKTCDMoreEvaluationCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/22.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGPhoto.h"
#import "WLKTCDCommentData.h"

@protocol CDMoreEvaluationPhotoDelegate <NSObject>
- (void)didSelectedPhotoItem:(NSIndexPath *)indexPath type:(LGShowImageType)type index:(NSInteger)index;
@end

@interface WLKTCDMoreEvaluationCell : UITableViewCell
@property (weak, nonatomic) id<CDMoreEvaluationPhotoDelegate> delegate;
@property (strong, nonatomic) WLKTCDCommentData *data;
@property (assign, nonatomic) NSInteger index;
@end

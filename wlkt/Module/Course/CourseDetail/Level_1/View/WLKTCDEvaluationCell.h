//
//  WLKTCDEvaluationCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/15.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCDData.h"

@protocol CDEvaluationDelegate<NSObject>
- (void)didSelectedImage:(NSInteger)index;
@end

@interface WLKTCDEvaluationCell : UITableViewCell
@property (weak, nonatomic) id <CDEvaluationDelegate> delegate;
@property (strong, nonatomic) CDCommentList_item *data;
@end

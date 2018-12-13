//
//  WLKTSchoolNewsDetailCommentCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/23.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTSchoolNewsDetailComment.h"

typedef enum : NSUInteger {
    SchoolNewsDetailCommentLike,
    SchoolNewsDetailCommentReport,
} SchoolNewsDetailCommentType;

@protocol SchoolNewsDetailCommentCellDelegate <NSObject>
- (void)didSelectedSchoolNewsDetailCommentButtonByType:(SchoolNewsDetailCommentType)type button:(UIButton *)button indexPath:(NSIndexPath *)indexPath;
@end

@interface WLKTSchoolNewsDetailCommentCell : UITableViewCell
@property (weak, nonatomic) id<SchoolNewsDetailCommentCellDelegate> delegate;
- (void)setCellData:(WLKTSchoolNewsDetailComment *)data indexPath:(NSIndexPath *)indexPath;
@end

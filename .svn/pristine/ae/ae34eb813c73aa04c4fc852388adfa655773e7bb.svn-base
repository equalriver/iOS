//
//  WLKTNewsDetailCommentCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/26.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTNewsDetailReplyList.h"
#import "WLKTNews_Q_A_detailReplyData.h"

typedef enum : NSUInteger {
    NewsDetailCommentLike,
    NewsDetailCommentReport,
    NewsDetailCommentReply
} NewsDetailCommentType;

@protocol NewsDetailCommentCellDelegate <NSObject>
- (void)didSelectedNewsDetailCommentButtonByType:(NewsDetailCommentType)type button:(UIButton *)button indexPath:(NSIndexPath *)indexPath;

@optional
- (void)didClickViewAllReplyButtonWithIndexPath:(NSIndexPath *)indexPath;
@end

@interface WLKTNewsDetailCommentCell : UITableViewCell
@property (strong, nonatomic) UIButton *replyButton;
@property (weak, nonatomic) id<NewsDetailCommentCellDelegate> delegate;
- (void)setCellData:(WLKTNewsDetailReplyList *)data indexPath:(NSIndexPath *)indexPath;
- (instancetype)initWithSingleState:(BOOL)isSingle;
@end

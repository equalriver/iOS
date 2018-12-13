//
//  WLKTNewsCommentReplyHeadView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/4.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTNewsDetailReplyList.h"

typedef enum : NSUInteger {
    NewsDetailCommentInfoLike,
    NewsDetailCommentInfoReport,
    NewsDetailCommentInfoReply
} NewsDetailCommentInfoType;

@protocol NewsDetailCommentInfoCellDelegate <NSObject>
- (void)didSelectedNewsDetailCommentInfoButtonByType:(NewsDetailCommentInfoType)type button:(UIButton *)button indexPath:(NSIndexPath *)indexPath;
@end

@interface WLKTNewsCommentReplyHeadView : UIView
@property (strong, nonatomic) UIButton *replyButton;
@property (weak, nonatomic) id<NewsDetailCommentInfoCellDelegate> delegate;
- (void)setCellData:(WLKTNewsDetailReplyList *)data indexPath:(NSIndexPath *)indexPath;

@end

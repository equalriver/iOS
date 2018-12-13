//
//  WLKTSchoolNewsDetailMsgCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTSchoolNewsDetailData.h"
#import "WLKTNewsDetailData.h"

@protocol SchoolNewsDetailMsgDelegate <NSObject>
- (void)didTapLikeIcon:(void(^)(BOOL finish, NSString *likeCount))completion;

@optional
- (void)didLoadHtmlStringWithHeight:(CGFloat)height;
@end

@interface WLKTSchoolNewsDetailMsgCell : UITableViewCell
@property (strong, nonatomic) UIWebView *webView;
@property (weak, nonatomic) id<SchoolNewsDetailMsgDelegate> delegate;
- (void)setCellData:(WLKTSchoolNewsDetailData *)data isLoadWeb:(BOOL)isLoadWeb;
- (void)setNewsCellData:(WLKTNewsDetailData *)data isLoadWeb:(BOOL)isLoadWeb;
- (instancetype)initWithSchoolNews;
@end

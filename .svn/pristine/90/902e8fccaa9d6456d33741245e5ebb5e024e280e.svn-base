//
//  WLKTSchoolNewsDetailCommentAlertView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/23.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SchoolNewsDetailCommentAlertDelegate <NSObject>
- (void)didFinishWithComment:(NSString *)comment completion:(void(^)(BOOL finished))completion;
@end

@interface WLKTSchoolNewsDetailCommentAlertView : UIView
@property (weak, nonatomic) id<SchoolNewsDetailCommentAlertDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame isPushViewController:(BOOL)isPush;
@end

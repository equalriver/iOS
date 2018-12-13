//
//  WLKTSchoolGoReportVC.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTSchoolNewsDetailComment.h"
#import "WLKTNewsDetailReplyList.h"

typedef enum : NSUInteger {
    ReportTypeXuJiaXinXi,
    ReportTypeGuangGaoQiZha,
    ReportTypeSaoRaoManMa,
    ReportTypeLaJiYingXiao,
    ReportTypeBingDuMuMa,
    ReportTypeOther
} ReportType;

@interface WLKTSchoolCommentGoReportVC : UIViewController
- (instancetype)initWithComment:(WLKTSchoolNewsDetailComment *)comment success:(void(^)(void))success;
- (instancetype)initWithNewsComment:(WLKTNewsDetailReplyList *)comment success:(void (^)(void))success;
@end

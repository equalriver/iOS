//
//  WLKTCDMoreIntroVC.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/20.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCDData.h"
#import "WLKTCDBottomButtons.h"

@interface WLKTCDMoreIntroVC : UIViewController
- (instancetype)initWithCourseId:(NSString *)courseId;
@property (strong, nonatomic) WLKTCDData *data;
@property (strong, nonatomic) WLKTCDBottomButtons *bottomBtns;
@property (strong, nonatomic) UITableView *tableView;
@end



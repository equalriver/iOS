//
//  WLKTCDMoreReportAlert.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/22.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLKTCDMoreReportAlert : UIView
@property (copy, nonatomic) NSArray *dataArr;
- (instancetype)initWithFrame:(CGRect)frame confirm:(void(^)(NSString *str))callback;
@end

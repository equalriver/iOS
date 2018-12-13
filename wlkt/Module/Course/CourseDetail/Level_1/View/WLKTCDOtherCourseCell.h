//
//  WLKTCDOtherCourseCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/16.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCDData.h"

@protocol CDOtherCourseDelegate<NSObject>
- (void)didSelectedCourseItem:(NSInteger)index;
@end

@interface WLKTCDOtherCourseCell : UITableViewCell
@property (weak, nonatomic) id <CDOtherCourseDelegate> delegate;
@property (strong, nonatomic) WLKTCDData *data;
@end

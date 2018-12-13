//
//  WLKTCDTeacherCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/30.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCDData.h"

@protocol CDTeacherCellDelegate<NSObject>
- (void)didClickTeacherItem;
@end

@interface WLKTCDTeacherCell : UITableViewCell
@property (strong, nonatomic) WLKTCDData *data;
@property (weak, nonatomic) id <CDTeacherCellDelegate> delegate;
@end

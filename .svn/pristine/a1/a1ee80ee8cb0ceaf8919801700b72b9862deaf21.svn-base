//
//  WLKTSchoolHeadCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTSchoolInfo.h"

@protocol SchoolHeadCellDelegate <NSObject>
- (void)didSelectedPhoneButton;
@end

@interface WLKTSchoolHeadCell : UITableViewCell
@property (weak, nonatomic) id<SchoolHeadCellDelegate> delegate;
- (void)setCellData:(WLKTSchoolInfo *)data;
@end

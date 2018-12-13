//
//  WLKTSchoolVideoCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTSchoolVideoList.h"

@protocol WLKTSchoolVideoDelegate <NSObject>
- (void)didSelectedVideoItem:(NSIndexPath *)indexPath;
@end

@interface WLKTSchoolVideoCell : UITableViewCell
@property (weak, nonatomic) id<WLKTSchoolVideoDelegate> delegate;
- (instancetype)initWithData:(NSArray<WLKTSchoolVideoList *> *)dataArr;
@end

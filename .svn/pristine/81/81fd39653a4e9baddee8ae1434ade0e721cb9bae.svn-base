//
//  WLKTActivityDetailVRPhotoCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTSchoolVRList.h"

@protocol ActivityDetailVRPhotoDelegate <NSObject>
- (void)didSelectedVRPhotoWithIndex:(NSIndexPath *)indexPath;
@end

@interface WLKTActivityDetailVRPhotoCell : UITableViewCell
@property (weak, nonatomic) id<ActivityDetailVRPhotoDelegate> delegate;
- (instancetype)initWithListArr:(NSArray<WLKTSchoolVRList *> *)array;
@end

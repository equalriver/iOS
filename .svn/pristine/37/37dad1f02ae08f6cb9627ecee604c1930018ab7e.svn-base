//
//  WLKTSchoolVRCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTSchoolVRList.h"

@protocol WLKTSchoolVRPhotoDelegate <NSObject>
- (void)didSelectedVRPhotoWithIndex:(NSIndexPath *)indexPath;
@end

@interface WLKTSchoolVRCell : UITableViewCell
@property (weak, nonatomic) id<WLKTSchoolVRPhotoDelegate> delegate;
- (instancetype)initWithListArr:(NSArray<WLKTSchoolVRList *> *)array;
@end

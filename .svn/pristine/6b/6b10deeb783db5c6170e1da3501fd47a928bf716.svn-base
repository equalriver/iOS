//
//  WLKTActivityDetailPhotoCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGPhoto.h"
#import "WLKTCourseDetailNewPhoto.h"

@protocol ActivityDetailPhotoDelegate <NSObject>
- (void)didSelectedPhotoItem:(NSIndexPath *)indexPath type:(LGShowImageType)type;
@end

@interface WLKTActivityDetailPhotoCell : UITableViewCell
- (instancetype)initWithImageArray:(NSArray<WLKTCourseDetailNewPhoto *> *)imageArray;
@property (weak, nonatomic) id<ActivityDetailPhotoDelegate> delegate;

@end

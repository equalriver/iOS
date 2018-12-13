//
//  WLKTSchoolPhotoCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGPhoto.h"
#import "WLKTSchoolPhotoList.h"

@protocol WLKTSchoolPhotoDelegate <NSObject>
- (void)didSelectedPhotoItem:(NSIndexPath *)indexPath type:(LGShowImageType)type;
@end

@interface WLKTSchoolPhotoCell : UITableViewCell
@property (weak, nonatomic) id<WLKTSchoolPhotoDelegate> delegate;
- (instancetype)initWithData:(NSArray<WLKTSchoolPhotoList *> *)data;
@end

//
//  WLKTClassifyActivityCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/18.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCourse.h"

typedef enum : NSUInteger {
    ClassifyActivityPhoneTypeZiXun,
    ClassifyActivityPhoneTypeOnline,
} ClassifyActivityPhoneType;

@protocol ClassifyActivityPhoneDelegate <NSObject>
- (void)didSelectedClassifyActivityPhone:(ClassifyActivityPhoneType)type index:(NSInteger)index;
@end

@interface WLKTClassifyActivityCell : UITableViewCell
@property (weak, nonatomic) id<ClassifyActivityPhoneDelegate> delegate;
- (void)setCellData:(WLKTCourse *)data index:(NSInteger)index;
@property (nonatomic, assign) CLLocationCoordinate2D currentCoordinate;
@end

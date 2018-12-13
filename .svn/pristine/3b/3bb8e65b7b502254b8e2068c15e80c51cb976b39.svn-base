//
//  WLKTCouponSaleHeadCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/18.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTSaleCourseSchoolList.h"

@protocol WLKTCouponSaleSchoolItemDelegate <NSObject>

- (void)couponSaleDidSelectedItem:(NSIndexPath *)indexPath;

@end

@interface WLKTCouponSaleHeadCell : UITableViewCell
@property (strong, nonatomic) UIImageView *bgIV;
@property (strong, nonatomic) UIImageView *titleIV;
@property (strong, nonatomic) UICollectionView *schoolItemCV;
@property (weak, nonatomic) id<WLKTCouponSaleSchoolItemDelegate> delegate;
- (instancetype)initWithSchoolNames:(NSArray<WLKTSaleCourseSchoolList *> *)schoolNames;
@end

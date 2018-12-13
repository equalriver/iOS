//
//  WLKTCDHeaderCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/14.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCDData.h"

typedef enum : NSUInteger {
    CDHeaderCellYouhuiTypeZhe_jian,
    CDHeaderCellYouhuiTypeCoupon,

} CDHeaderCellYouhuiType;

@protocol CDHeaderCellDelegate<NSObject>
- (void)didSelectedBannerViewItem:(NSInteger)index;
- (void)didClickAttentionButton:(UIButton *)sender;
- (void)didSelectedYouhuiType:(CDHeaderCellYouhuiType)type;
- (void)didClickLicenseButton;
- (void)didClickRuleAlertButton;
@end

@interface WLKTCDHeaderCell : UITableViewCell
@property (weak, nonatomic) id<CDHeaderCellDelegate> delegate;
- (void)setCellData:(WLKTCDData *)data;
@end

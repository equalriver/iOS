//
//  WLKTCouponUnuseTVC.h
//  wlkt
//
//  Created by 尹平江 on 2017/8/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTMyCouponData.h"

typedef void(^unuseSelectedCellBlock)(NSMutableArray *array);

@interface WLKTCouponUnuseTVC : UITableViewController
@property (strong, nonatomic) NSMutableArray<WLKTMycouponListData *> *dataArr;

@end

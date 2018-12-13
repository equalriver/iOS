//
//  WLKTCDVRPlayVC.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/12.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCDData.h"

@interface WLKTCDVRPlayVC : UIViewController
@property (strong, nonatomic) WLKTCDData *data;
@property (strong, nonatomic) WLKTCDDataPoint *currentPoint;
@end

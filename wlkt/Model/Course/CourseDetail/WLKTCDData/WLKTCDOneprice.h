//
//  WLKTCDOneprice.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/29.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTCDDataPriceSystem.h"

@interface WLKTCDOneprice : NSObject
@property (copy, nonatomic) NSString *pid;
@property (copy, nonatomic) NSString *price_type;
@property (copy, nonatomic) NSString *cid;
//@property (copy, nonatomic) NSString *price;
@property (copy, nonatomic) NSString *class_type;
@property (copy, nonatomic) NSString *standard;
@property (copy, nonatomic) NSString *mincourse;
@property (copy, nonatomic) NSString *totalcourse;
@property (copy, nonatomic) NSString *status;
@property (copy, nonatomic) NSString *oldprice;
@property (copy, nonatomic) NSString *showprice;
@property (copy, nonatomic) NSString *minks;
@property (copy, nonatomic) NSString *maxks;
@property (copy, nonatomic) NSArray<WLKTCDDataPriceSystem *> *price_system;
@end

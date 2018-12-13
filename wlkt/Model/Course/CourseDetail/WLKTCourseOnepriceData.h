//
//  WLKTCourseOnepriceData.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTCourseOnepriceData : NSObject
///(一口价/课时价)
@property (copy, nonatomic) NSString *price_type;
@property (copy, nonatomic) NSString *status;
///最大购买数
@property (copy, nonatomic) NSString *totalcourse;
//@property (copy, nonatomic) NSString *cid;
@property (copy, nonatomic) NSString *price;
@property (copy, nonatomic) NSString *oldprice;
///等级
@property (copy, nonatomic) NSString *standard;
///(班课/一对一)
@property (copy, nonatomic) NSString *class_type;
///最低购买数
@property (copy, nonatomic) NSString *mincourse;
//{
//    "price_type": "2",
//    "status": "1",
//    "totalcourse": "50",
//    "id": "3",
//    "price": "144.00",
//    "oldprice": "180.00",
//    "standard": "5",
//    "class_type": "4",
//    "mincourse": "1",
//    "cid": "3"
//}
@end

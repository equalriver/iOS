//
//  WLKTCoursePriceRange.h
//  wlkt
//
//  Created by slovelys on 17/4/6.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTCoursePriceRange : NSObject
/// 最小课时数
@property (copy, nonatomic) NSString *min;
/// 课时区间
@property (copy, nonatomic) NSString *area;
/// 最大课时数
@property (copy, nonatomic) NSString *max;
/// 区间价格
@property (copy, nonatomic) NSString *price;

@end

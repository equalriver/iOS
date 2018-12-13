//
//  WLKTSaleCourseInfo.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTSaleCourseInfo : NSObject
///优惠券标题
@property (copy, nonatomic) NSString *title;
///有效时间
@property (copy, nonatomic) NSString *time;
///优惠券金额
@property (copy, nonatomic) NSString *money;
///符合使用的条数
@property (copy, nonatomic) NSString *count;
///使用条件
@property (copy, nonatomic) NSString *rule;
@end

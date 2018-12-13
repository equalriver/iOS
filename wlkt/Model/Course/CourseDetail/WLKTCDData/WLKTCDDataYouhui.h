//
//  WLKTCDDataYouhui.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/30.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTCDDataYouhui : NSObject
///优惠类型
@property (copy, nonatomic) NSString *type;
///优惠的标题
@property (copy, nonatomic) NSString *title;
///优惠的开始时间
@property (copy, nonatomic) NSString *starttime;
///优惠的结束时间
@property (copy, nonatomic) NSString *endtime;
///优惠说明
@property (copy, nonatomic) NSString *content;
///优惠的适用条件
@property (copy, nonatomic) NSString *msg;

@end

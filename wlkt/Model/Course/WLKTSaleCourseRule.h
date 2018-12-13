//
//  WLKTSaleCourseRule.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTSaleCourseRule : NSObject
///标题
@property (copy, nonatomic) NSString *title;
///一维数组,使用规则
@property (copy, nonatomic) NSArray *rule;
@end

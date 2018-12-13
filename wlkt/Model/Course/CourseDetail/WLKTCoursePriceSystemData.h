//
//  WLKTCoursePriceSystemData.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTCourseItemData.h"

@interface WLKTCoursePriceSystemData : NSObject
@property (copy, nonatomic) NSArray<WLKTCourseItemData *> *banxing;
@property (copy, nonatomic) NSArray<WLKTCourseItemData *> *shoufei;
@property (copy, nonatomic) NSArray<WLKTCourseItemData *> *biaozhun;
//{
//    "banxing": [
//                {
//                    "index": "3",
//                    "title": "一对一"
//                },
//                {
//                    "index": "4",
//                    "title": "班课"
//                }
//                ],
//    "shoufei": [
//                {
//                    "index": "2",
//                    "isinput": "2",
//                    "title": "课时价"
//                }
//                ],
//    "biaozhun": [
//                 {
//                     "index": "5",
//                     "title": "初级"
//                 },
//                 {
//                     "index": "6",
//                     "title": "中级"
//                 }
//                 ]
//}
@end

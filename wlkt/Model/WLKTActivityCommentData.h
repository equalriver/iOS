//
//  WLKTActivityCommentData.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTActivityCommentStar.h"
#import "WLKTActivityCommentList.h"

@interface WLKTActivityCommentData : NSObject
@property (copy, nonatomic) NSArray<WLKTActivityCommentList *> *comment;
@property (strong, nonatomic) WLKTActivityCommentStar *star;
@end

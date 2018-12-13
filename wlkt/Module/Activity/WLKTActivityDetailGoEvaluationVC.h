//
//  WLKTActivityDetailGoEvaluationVC.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTActivity.h"

typedef void(^evaluationSuccess)(void);

@interface WLKTActivityDetailGoEvaluationVC : UIViewController
- (instancetype)initWithActivity:(WLKTActivity *)activity;
@property (copy, nonatomic) evaluationSuccess successBlock;
@end

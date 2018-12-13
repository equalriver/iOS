//
//  WLKTActivityDetailGoAnswerVC.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTActivity.h"
#import "WLKTActivityDetail_QA_question.h"
@interface WLKTActivityDetailGoAnswerVC : UIViewController
- (instancetype)initWithQuestion:(WLKTActivityDetail_QA_question *)question activity:(WLKTActivity *)activity;
@end

//
//  WLKTActivityDetailGoEvaluationView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ActivityDetailGoEvaluationDelegate <NSObject>
- (void)didSelectedPingjiaStar:(NSInteger)starIndex;
- (void)didSelectedXiaoguoNumber:(NSInteger)number;
- (void)didSelectedShiziNumber:(NSInteger)number;
- (void)didSelectedHuanjingNumber:(NSInteger)number;
- (void)didEnterPingjia:(NSString *)text;
@end

@interface WLKTActivityDetailGoEvaluationView : UIView
@property (weak, nonatomic) id<ActivityDetailGoEvaluationDelegate> delegate;
- (instancetype)initWithSchoolName:(NSString *)schoolName;
@end

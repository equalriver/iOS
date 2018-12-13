//
//  WLKTCDTableSectionView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/2.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLKTCDTableSectionView : UIView
+ (WLKTCDTableSectionView *)TableSectionViewNormal:(CGRect)frame leftTitle:(NSString *)leftTitle right:(NSString *)right callback:(void(^)(void))callback;
+ (WLKTCDTableSectionView *)TableSectionViewSchool:(CGRect)frame leftTitle:(NSString *)leftTitle callback:(void(^)(void))callback;
+ (WLKTCDTableSectionView *)TableSectionViewFoot:(CGRect)frame title:(NSString *)title callback:(void(^)(void))callback;
@end

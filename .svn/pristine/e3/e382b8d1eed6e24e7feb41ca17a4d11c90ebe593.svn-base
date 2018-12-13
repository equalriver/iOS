//
//  WLKTHPFliterBar.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/2.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTClassifyData.h"

@protocol HPFilterBarDelegate<NSObject>
- (void)didSelectedClassifyWithIndex:(NSInteger)index;
- (void)didClickFilterWithData:(NSArray *)array;
@end

@interface WLKTHPFilterBar : UIView
- (instancetype)initWithFrame:(CGRect)frame classifyData:(WLKTClassifyData *)data;
@property (weak, nonatomic) id<HPFilterBarDelegate> delegate;
@end

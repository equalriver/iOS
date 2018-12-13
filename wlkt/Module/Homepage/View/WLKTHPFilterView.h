//
//  WLKTHPFliterView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/2.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTClassifyData.h"

typedef enum : NSUInteger {
    FilterViewHandleButtonTypeReset,
    FilterViewHandleButtonTypeConfirm
} FilterViewHandleButtonType;

@protocol WLKTHPFilterViewDelegate<NSObject>
- (void)didClickFilterViewHandleButton:(FilterViewHandleButtonType)type conditions:(NSArray *)array;
@end

@interface WLKTHPFilterView : UIView
@property (weak, nonatomic) id<WLKTHPFilterViewDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame data:(WLKTClassifyData *)data indexPaths:(NSArray<NSIndexPath *> *)indexPaths;
@end

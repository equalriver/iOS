//
//  WLKTJoinPickerView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    PickerViewActionTypeCancel,
    PickerViewActionTypeDefault,
} PickerViewActionType;

@protocol WLKTJoinPickerViewDelegate<NSObject>
- (void)didSelectedActionButtonWithType:(PickerViewActionType)type;
@end

@interface WLKTJoinPickerView : UIView
@property (strong, nonatomic) UIPickerView *pickView;
@property (weak, nonatomic) id<WLKTJoinPickerViewDelegate> delegate;
@end

//
//  WLKTClassifyFliterBtns.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/7.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTClassifyData.h"
#import "WLKTClassifySearchResult.h"

@protocol WLKTClassifyFliterBtnsDelegate <NSObject>
- (void)didSelectedFliterButtonWithType:(ClassifySearchType)type value:(NSString *)value completion:(void(^)(void))completion;
@end

@interface WLKTClassifyFliterBtns : UIView
@property (assign, nonatomic) BOOL isCourseList;
@property (strong, nonatomic) WLKTClassifyData *data;
@property (weak, nonatomic) id<WLKTClassifyFliterBtnsDelegate> delegate;

- (void)resetButtonStatus;
@end

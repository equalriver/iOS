//
//  WLKTHPCourseListHeadView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/9.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTClassifyData.h"

@protocol HPCourseListHeadView <NSObject>
- (void)didSelectedImageWithType:(WLKTBannerListTye)type url:(NSString *)url;
@end

@interface WLKTHPCourseListHeadView : UIView
@property (strong, nonatomic) WLKTClassifyData *data;
@property (nonatomic) NSInteger currentItem;
@property (weak, nonatomic) id<HPCourseListHeadView> delegate;
@end

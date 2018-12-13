//
//  WLKTScreenshotsPopView.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, SelectSheetType) {
    WeiXinSelectSheetType,
    WeiXinCircleSelectSheetType,
    QQSelectSheetType,
    SinaSelectSheetType
};
typedef void (^ActionSheetDidSelectSheetBlock)(SelectSheetType type);
typedef void (^ActionSheetDidHiddenBlock)(void);

@interface WLKTScreenshotsPopView : UIView

@property (nonatomic, copy) ActionSheetDidHiddenBlock hiddenBlock;
+(instancetype)initWithScreenShots:(UIImage *)shotsImage selectSheetBlock:(ActionSheetDidSelectSheetBlock)selectSheetBlock;
-(void)show;

@end

//
//  WLKTRectangleTagView.h
//  wlkt
//
//  Created by slovelys on 17/3/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WLKTRectangleViewDelegate <NSObject>

- (void)didTapCancelButton;
- (void)didSelectItemAtIndex:(NSInteger)index;

@end

@interface WLKTRectangleTagView : UIScrollView

@property (weak, nonatomic) id<WLKTRectangleViewDelegate> rectangleViewDelegate;

- (instancetype)initWithTextArray:(NSArray *)array;

- (void)removeRectangleTagView;

@end

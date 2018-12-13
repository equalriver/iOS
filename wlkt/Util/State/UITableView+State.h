//
//  UITableView+State.h
//  wlkt
//
//  Created by slovelys on 17/3/23.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "UIViewStateProtocol.h"
#import <UIScrollView+EmptyDataSet.h>

extern NSString * const kButtonTitleForStateError;

@interface UITableView (State) <UIViewStateProtocol, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (assign, nonatomic) WLKTViewState state;

@property (copy, nonatomic) NSString *titleForStateEmpty;
@property (copy, nonatomic) NSString *descriptionForStateEmpty;

@property (copy, nonatomic) NSString *buttonTitleForStateEmpty;
@property (strong, nonatomic) UIColor *buttonColorForStateEmpty;

@property (strong, nonatomic) UIImage *imageForStateEmpty;

@property (copy, nonatomic) void (^emptyButtonClickBlock)(void);

- (UIFont *)buttonTitleFontForState:(WLKTViewState)state;

@end

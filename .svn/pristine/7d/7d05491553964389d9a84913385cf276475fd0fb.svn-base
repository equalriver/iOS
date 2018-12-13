//
//  DZNEmptyDataSetView.m
//  wlkt
//
//  Created by slovelys on 17/3/23.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "DZNEmptyDataSetView.h"
#import <Aspects.h>
#import <Masonry.h>

@interface DZNEmptyDataSetView (Private)

@property (nonatomic, readonly) UIButton *button;
@property (nonatomic, readonly) UIView *contentView;
@property (nonatomic, assign) BOOL fadeInOnDisplay;

- (void)setupConstraints;
- (BOOL)canShowButton;
- (void)resetButtonConstraint;

@end

@implementation DZNEmptyDataSetView (TableView)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self aspect_hookSelector:@selector(setupConstraints) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
            DZNEmptyDataSetView *view = aspectInfo.instance;
            if ([view canShowButton]) {
                [view resetButtonConstraint];
            }
        } error:nil];
    });
}

- (void)resetButtonConstraint {
    if (!self.tableView) {
        return;
    }
    WLKTViewState state = self.tableView.state;
    
    self.button.layer.masksToBounds = YES;
    self.button.layer.cornerRadius = 3;
    
    NSString *buttonTitle;
    if (state == WLKTViewStateEmpty) {
        buttonTitle = self.tableView.buttonTitleForStateEmpty;
        self.button.layer.borderColor = UIColorHex(f0f0f0).CGColor;
        self.button.layer.borderWidth = CGFloatPixelCeil(1);
    } else {
        buttonTitle = kButtonTitleForStateError;
        self.button.layer.borderColor = UIColorHex(f0f0f0).CGColor;
        self.button.layer.borderWidth = CGFloatPixelCeil(1);
    }
    
    CGSize buttonSize = [buttonTitle sizeForFont:[self.tableView buttonTitleFontForState:state] size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByWordWrapping];
    CGFloat height =buttonSize.height + 12;
    CGFloat width = buttonSize.width + 40;
    [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.width.equalTo(@(width));
        make.height.equalTo(@(height));
    }];
    
}

- (UITableView *)tableView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTableView:(UITableView *)tableView {
    objc_setAssociatedObject(self, @selector(tableView), tableView, OBJC_ASSOCIATION_ASSIGN);
}

@end

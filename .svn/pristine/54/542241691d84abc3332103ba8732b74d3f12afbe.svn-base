//
//  WLKTConfirmOrderStundentMsgCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/28.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StundentMessageDelegate <NSObject>
- (void)textFieldValueChanged:(NSString *)text indexTitle:(NSString *)title;

@end

@interface WLKTConfirmOrderStundentMsgCell : UITableViewCell
- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder;
@property (weak, nonatomic) id<StundentMessageDelegate> delegate;
@property (strong, nonatomic) UITextField *detailTF;

@end

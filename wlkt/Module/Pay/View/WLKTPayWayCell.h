//
//  WLKTPayWayCell.h
//  wlkt
//
//  Created by 尹平江 on 2017/4/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLKTPayWayCell : UITableViewCell
/**
 *  银行icon
 */
@property (strong, nonatomic) UIImageView *bankIconImageView;
/**
 *  银行title
 */
@property (strong, nonatomic) UILabel *bankTitle;
/**
 *  推荐
 */
@property (strong, nonatomic) UILabel *tuijianLabel;
@property (strong, nonatomic) UIImageView *tuijianIV;
//@property (strong, nonatomic) UILabel *tuijianDetailLabel;
/**
 *  勾选icon
 */
@property (strong, nonatomic) UIImageView *checkImageView;
@property (strong, nonatomic) UIView *separatorView_1;

- (void)setCellData:(NSArray<UIImage *> *)icons title:(NSArray<NSString *> *)titles indexPath:(NSIndexPath *)indexPath selectedItem:(NSInteger)item;

@end

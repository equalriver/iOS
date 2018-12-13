//
//  WLKTActivePayCell.h
//  wlkt
//
//  Created by 尹平江 on 2017/7/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLKTActivePayCell : UITableViewCell
/**
 *  报名人数
 */
@property (strong, nonatomic) UILabel *registerCountLabel;
/**
 *  购买(-)
 */
@property (strong, nonatomic) UIButton *minusButton;
/**
 *  购买(+)
 */
@property (strong, nonatomic) UIButton *addButton;
/**
 *  购买TF
 */
@property (strong, nonatomic) UITextField *buyTF;
/**
 *  总价
 */
@property (strong, nonatomic) UILabel *totalLabel;
/**
 *  报名信息
 */
@property (strong, nonatomic) UILabel *studentInfoTitle;
/**
 *  学生姓名label
 */
@property (strong, nonatomic) UILabel *studentNameLabel;
/**
 *  学生姓名*
 */
@property (strong, nonatomic) UILabel *studentBadgeLabel;
/**
 *  学生姓名TF
 */
@property (strong, nonatomic) UITextField *studentNameTF;
/**
 *  联系电话label
 */
@property (strong, nonatomic) UILabel *phoneLabel;
/**
 *  联系电话*
 */
@property (strong, nonatomic) UILabel *phoneBadgeLabel;
/**
 *  联系电话TF
 */
@property (strong, nonatomic) UITextField *phoneTF;
/**
 *  支付方式title
 */
@property (strong, nonatomic) UILabel *payTypeTitle;


@property (strong, nonatomic) UIView *fillViewOne;
@property (strong, nonatomic) UIView *fillViewTwo;

// ********分割线*********

@property (strong, nonatomic) UIView *separatorView_1;
@property (strong, nonatomic) UIView *separatorView_2;
@property (strong, nonatomic) UIView *separatorView_3;
@property (strong, nonatomic) UIView *separatorView_4;


@end

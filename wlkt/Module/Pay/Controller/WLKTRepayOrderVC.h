//
//  WLKTConfirmOrderVC.h
//  wlkt
//
//  Created by 尹平江 on 17/4/1.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLKTRepayOrderVC : UIViewController

- (instancetype)initWithSchoolName:(NSString *)schoolName
                       schoolImage:(NSString *)schoolImage
                       courseName :(NSString *)courseName
                             price:(NSArray *)price
                         classType:(NSString *)classType
                     teachLocation:(NSString *)teachLocation
                           address:(NSString *)address
                              suid:(NSString *)suid
                          courseId:(NSString *)courseId
                           bkprice:(NSString *)bkprice
                       courseCount:(int)courseCount
                            onecut:(int)onecut;


/**
 *  学校名称
 */
@property (copy, nonatomic) NSString *schoolName;
/**
 *  学校图片url
 */
@property (copy, nonatomic) NSString *schoolImage;
/**
 *  课程名称
 */
@property (copy, nonatomic) NSString *courseName;
/**
 *  单价
 */
@property (copy, nonatomic) NSArray *price;
/**
 *  课程班型
 */
@property (copy, nonatomic) NSString *classType;
/**
 *  授课点
 */
@property (copy, nonatomic) NSString *teachLocation;
/**
 *  学校地址
 */
@property (copy, nonatomic) NSString *address;
/**
 *  学校id
 */
@property (copy, nonatomic) NSString *suid;
/**
 *  课程的id
 */
@property (copy, nonatomic) NSString *courseId;
/**
 *  课时数
 */
@property (assign, nonatomic) int courseCount;

@end

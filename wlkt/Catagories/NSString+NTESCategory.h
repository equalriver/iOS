//
//  NSString+NTESCategory.h
//  wlkt
//
//  Created by 尹平江 on 2018/5/14.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NTESCategory)
- (CGSize)stringSizeWithFont:(UIFont *)font;

- (NSUInteger)getBytesLength;

- (NSString *)stringByDeletingPictureResolution;

- (NSString *)removeSpace;

+ (BOOL)checkRoomNumber:(NSString *)roomNumber;

+ (BOOL)checkUserName:(NSString*) username;

+ (BOOL)checkPassword:(NSString*) password;

+ (BOOL)checkNickName : (NSString*) nickName;

+ (BOOL)checkPullUrl: (NSString *) pullUrl;

+ (BOOL)checkDemandUrl:(NSString *)demandUrl;

+ (BOOL)checkVideoName:(NSString *)videoName;

/**
 *  计算文本占用的宽高
 *
 *  @param font    显示的字体
 *  @param maxSize 最大的显示范围
 *
 *  @return 占用的宽高
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 转换时间字符串
 
 @param second 秒
 @param minDigits 最小位数 ［2, 3］。 2 - 00:00 ，3 － 00:00:00
 @return 时间字符串
 */
+ (NSString *)timeStringWithSecond:(NSInteger)second minDigits:(NSInteger)minDigits;
@end

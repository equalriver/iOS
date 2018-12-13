//
//  NSString+WLKTRegular.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/10/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "NSString+WLKTRegular.h"

@implementation NSString (WLKTRegular)

- (BOOL)isValidChinese {
    NSString *chineseRegex = @"^[\\u4e00-\\u9fa5]+$";
    return [self isValidateByRegex:chineseRegex];
}

- (BOOL)isValidPassword {
    //以字母开头，只能包含“字母”，“数字”，“下划线”，长度6~18
    NSString *regex = @"^([a-zA-Z]|[a-zA-Z0-9_]|[0-9]){6,18}$";
    return [self isValidateByRegex:regex];
}

- (BOOL)isValidUrl {
    NSString * regex = @"\\\\b((ftp|http|https?):\\\\/\\\\/[-\\\\w]+(\\\\.\\\\w[-\\\\w]*)+|(?i:[a-z0-9](?:[-a-z0-9]*[a-z0-9])?\\\\.)+(?-i:com\\\\b|edu\\\\b|biz\\\\b|gov\\\\b|in(?:t|fo)\\\\b|mil\\\\b|net\\\\b|org\\\\b|[a-z][a-z]\\\\b))(:\\\\d+)?(/[^.!,?;\\\"'<>()\\\\[\\\\]{}\\\\s\\\\x7F-\\\\xFF]*(?:[.!,?]+[^.!,?;\\\"\'<>()\\\\[\\\\]{}\\\\s\\\\x7F-\\\\xFF]+)*)?";
    return [self isValidateByRegex:regex];
}

- (BOOL)isValidPhoneNumber {
    NSString *regex = @"^[0-9]{11}";
    return [self isValidateByRegex:regex];
}

- (BOOL)isEmailAddress {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self isValidateByRegex:emailRegex];
}

- (BOOL)simpleVerifyIdentityCardNum {
    NSString *regex2 = @"^(\\\\d{14}|\\\\d{17})(\\\\d|[xX])$";
    return [self isValidateByRegex:regex2];
}

- (BOOL)isValidPostalcode {
    NSString *postalRegex = @"^[0-8]\\\\d{5}(?!\\\\d)$";
    return [self isValidateByRegex:postalRegex];
}

- (BOOL)isValidateByRegex:(NSString *)regex {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

@end

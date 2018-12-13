//
//  WLKTAuthcodeValidator.m
//  wlkt
//
//  Created by slovelys on 2017/4/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTAuthcodeValidator.h"

@implementation WLKTAuthcodeValidator

- (BOOL)validateInput:(NSString *)text  range:(NSRange)range replacementString:(NSString *)string {
    BOOL result = YES;
    NSUInteger strLength = text.length - range.length + string.length;
    result = (strLength <= kAuthCodeMaxLength);
    if (!result) {
        return result;
    }
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:characterSet] componentsJoinedByString:@""];
    return result = [string isEqualToString:filtered];
}

@end

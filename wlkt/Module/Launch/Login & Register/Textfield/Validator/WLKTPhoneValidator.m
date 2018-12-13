//
//  WLKTPhoneValidator.m
//  wlkt
//
//  Created by slovelys on 17/3/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTPhoneValidator.h"

@implementation WLKTPhoneValidator

- (BOOL)validateInput:(NSString *)text  range:(NSRange)range replacementString:(NSString *)string {
    BOOL result = YES;
    NSUInteger strLength = text.length - range.length + string.length;
    result = (strLength <= kPhoneNumberMaxLength);
    if (!result) {
        return result;
    }
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:characterSet] componentsJoinedByString:@""];
    return result = [string isEqualToString:filtered];
}

@end

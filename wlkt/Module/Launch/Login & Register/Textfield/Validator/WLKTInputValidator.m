//
//  WLKTInputValidator.m
//  wlkt
//
//  Created by slovelys on 17/3/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTInputValidator.h"

@interface WLKTInputValidator ()

@property (assign, nonatomic) NSUInteger maxLength;

@end

@implementation WLKTInputValidator

- (instancetype)initWithMaxLength:(NSUInteger)length {
    if (self = [super init]) {
        _maxLength = length;
    }
    return self;
}

- (BOOL)validateInput:(NSString *)text {
    return NO;
}

- (BOOL)validateInput:(NSString *)text range:(NSRange)range replacementString:(NSString *)string {
    NSUInteger strLength = text.length - range.length + string.length;
    return (strLength <= _maxLength);
}

@end

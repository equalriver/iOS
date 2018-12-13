//
//  UITextField+Validate.m
//  wlkt
//
//  Created by slovelys on 17/3/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "UITextField+Validate.h"
#import <objc/runtime.h>

@implementation UITextField (Validate)

- (BOOL)validate {
    return [self.validator validateInput:self.text];
}

- (BOOL)validateRange:(NSRange)range replacementString:(NSString *)string {
    return [self.validator validateInput:self.text range:range replacementString:string];
}

#pragma mark - Getters & Setters
- (WLKTInputValidator *)validator {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setValidator:(WLKTInputValidator *)validator {
    objc_setAssociatedObject(self, @selector(validator), validator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

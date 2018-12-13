//
//  WLKTLoginViewModel.m
//  wlkt
//
//  Created by slovelys on 17/3/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTLoginViewModel.h"
#import "WLKTUser.h"

@interface WLKTLoginViewModel ()

@property (strong, nonatomic) WLKTUser *user;

@end

@implementation WLKTLoginViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    
    _enableLoginSignal = [RACSignal combineLatest:@[RACObserve(self, account), RACObserve(self, password)] reduce:^id(NSString *account, NSString *password) {
        return @(account.length > 0 && password.length >= 6);
    }];
    
//    @weakify(self)
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
//        @strongify(self)
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [subscriber sendNext:@"登录成功"];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    
    [[self.loginCommand.executionSignals switchToLatest] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
}

@end

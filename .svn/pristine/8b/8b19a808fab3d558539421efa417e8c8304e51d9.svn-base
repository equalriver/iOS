//
//  WLKTActiveTianfuPay.m
//  wlkt
//
//  Created by 尹平江 on 2017/7/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActiveTianfuPay.h"
#import "WLKTTianfuPayVC.h"
#import "WLKTActiveTianfuPayApi.h"

@implementation WLKTActiveTianfuPay

+ (void)tianfuPayWithHdid:(NSString *)hdid
                    uname:(NSString *)uname
                   uphone:(NSString *)uphone
                   renshu:(NSString *)renshu
                   target:(__kindof UIViewController *)vc
{
    __block NSString *url = nil;
    if (![SVProgressHUD isVisible]) {
        [SVProgressHUD showProgress:-1 status:@"正在发起支付..."];
    }
    WLKTActiveTianfuPayApi *api = [[WLKTActiveTianfuPayApi alloc]initWithHdid:hdid uname:uname uphone:uphone renshu:renshu];
    
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        [SVProgressHUD dismiss];
        NSString *code = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"errorCode"]];
        if (![code isEqualToString:@"0"]) {
            [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"%@", request.responseJSONObject[@"message"]]];
        }
        else{
            url = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"result"]];
            if (url) {
                WLKTTianfuPayVC *tianfu = [[WLKTTianfuPayVC alloc]init];
                tianfu.url = url;
                [vc.navigationController pushViewController:tianfu animated:YES];
                
            }
        }
        
    } failure:^(__kindof YTKBaseRequest *request) {
        [SVProgressHUD showErrorWithStatus:@"支付失败"];
        NSLog(@"%ld", (long)request.responseStatusCode);
        //ShowApiError;
    }];
    
}

@end

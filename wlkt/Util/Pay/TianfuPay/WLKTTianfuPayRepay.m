//
//  WLKTTianfuPay.m
//  wlkt
//
//  Created by 尹平江 on 17/3/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTTianfuPayRepay.h"
#import <AFNetworking.h>
#import "WLKTTianfuPayVC.h"
#import "WLKTLogin.h"

@interface WLKTTianfuPayRepay ()

@end

@implementation WLKTTianfuPayRepay

+ (void)tianfuPayWithOrderId:(NSString *)oid target:(__kindof UIViewController *)vc
{
    __weak __typeof(&*vc)weakVC = vc;
    if (![SVProgressHUD isVisible]) {
        [SVProgressHUD showProgress:-1 status:@"正在发起支付..."];
    }
    //创建会话管理员
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置响应序列化 让响应格式统一
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //发出请求
    [manager POST:[NSString stringWithFormat:@"%@paynew/repay", kBaseURL] parameters:@{
                                                                                    @"id" : oid,
                                                                                    @"paytype": @"tianfupay",
                                                                                    @"app_userinfo" : TheCurUser.token,
                                                                                    @"nanbopage" : [@"nanboshengxueorg" md5String]
                                                                                    }
         progress:^(NSProgress * _Nonnull uploadProgress) {
                                                                                        
                                                                                    }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              __strong __typeof(&*weakVC)strongVC = weakVC;
              NSString *orderStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
              if (orderStr.length < 10) {
                  [SVProgressHUD showInfoWithStatus:@"订单已过期"];
                  return ;
              }
              [SVProgressHUD dismiss];
              WLKTTianfuPayVC *tianfu = [[WLKTTianfuPayVC alloc]init];
              tianfu.url = orderStr;
              [strongVC setHidesBottomBarWhenPushed:YES];
              [strongVC.navigationController pushViewController:tianfu animated:YES];
              
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              [SVProgressHUD showErrorWithStatus:@"支付失败"];
          }];
    
}

@end

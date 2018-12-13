//
//  WLKTActiveAlipay.m
//  wlkt
//
//  Created by 尹平江 on 2017/7/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActiveAlipay.h"
#import <AlipaySDK/AlipaySDK.h>
#import <AFNetworking.h>
#import "WLKTLogin.h"

@implementation WLKTActiveAlipay
+ (void)AlipayWithHdid:(NSString *)hdid
                 uname:(NSString *)uname
                uphone:(NSString *)uphone
                renshu:(NSString *)renshu
{
    if (![SVProgressHUD isVisible]) {
        [SVProgressHUD showProgress:-1 status:@"正在发起支付..."];
    }
    //创建会话管理员
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置响应序列化 让响应格式统一
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //发出请求
    [manager POST:[NSString stringWithFormat:@"%@actpay/index", kBaseURL] parameters:@{
                                                                                    @"hdid" : hdid ? hdid : @"",
                                                                                    @"uname" : uname ? uname : @"",
                                                                                    @"uphone" : uphone ? uphone : @"",
                                                                                    @"renshu" : renshu ? renshu : @"",
                                                                                    @"app_userinfo" : TheCurUser.token,
                                                                                    @"version": [NSString stringWithFormat:@"iOS%@", [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"]],
                                                                                    @"nanbopage" : [@"nanboshengxueorg" md5String]
                                                                                    }
         progress:^(NSProgress * _Nonnull uploadProgress) {
             
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              [SVProgressHUD dismiss];
//              NSString *s = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
              [[AlipaySDK defaultService] payOrder:[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding] fromScheme:alipayScheme callback:^(NSDictionary *resultDic) {
                  
                  [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"isSNSPush"];
                  
                  if (resultDic[@"resultStatus"]){
                      
                      if ([resultDic[@"resultStatus"] isEqualToString:@"9000"]) {//订单支付成功
                          dispatch_async(dispatch_get_main_queue(), ^{
                              //[SVProgressHUD showSuccessWithStatus:@"订单支付成功"];
                              [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"paySuccess" object:nil]];
                          });
                      }
                      else if ([resultDic[@"resultStatus"] isEqualToString:@"8000"] || [resultDic[@"resultStatus"] isEqualToString:@"6004"]) {//正在处理中
                          dispatch_async(dispatch_get_main_queue(), ^{
                              [SVProgressHUD showSuccessWithStatus:@"正在处理中..."];
                          });
                      }
                      else if ([resultDic[@"resultStatus"] isEqualToString:@"4000"]) {//订单支付失败
                          dispatch_async(dispatch_get_main_queue(), ^{
                              //[SVProgressHUD showErrorWithStatus:@"订单支付失败"];
                              [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"payFail" object:nil]];
                          });
                      }
                      else if ([resultDic[@"resultStatus"] isEqualToString:@"5000"]) {//重复请求
                          dispatch_async(dispatch_get_main_queue(), ^{
                              //[SVProgressHUD showErrorWithStatus:@"重复请求"];
                              [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"payFail" object:nil]];
                          });
                      }
                      else if ([resultDic[@"resultStatus"] isEqualToString:@"6001"]) {//用户中途取消
                          dispatch_async(dispatch_get_main_queue(), ^{
                              //[SVProgressHUD showErrorWithStatus:@"用户中途取消"];
                              [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"payFail" object:nil]];
                          });
                      }
                      else if ([resultDic[@"resultStatus"] isEqualToString:@"6002"]) {//网络连接出错
                          dispatch_async(dispatch_get_main_queue(), ^{
                              [SVProgressHUD showErrorWithStatus:@"网络连接出错"];
                              //[[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"payFail" object:nil]];
                          });
                      }
                      else{//其他错误
                          dispatch_async(dispatch_get_main_queue(), ^{
                              //[SVProgressHUD showErrorWithStatus:@"其它支付错误"];
                              [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"payFail" object:nil]];
                          });
                          
                      }
                  }
              }];
              
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              [SVProgressHUD dismiss];
              [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"payFail" object:nil]];
          }];
    
}
@end

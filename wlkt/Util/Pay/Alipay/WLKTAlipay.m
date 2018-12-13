//
//  WLKTAlipay.m
//  wlkt
//
//  Created by 尹平江 on 17/3/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTAlipay.h"
#import <AlipaySDK/AlipaySDK.h>
#import <AFNetworking.h>
#import "WLKTLogin.h"

@implementation WLKTAlipay

+ (void)AlipayWithGoodsName:(NSString *)goodsName
                     counts:(NSInteger)counts
                       suid:(NSString *)suid
                        uid:(NSString *)uid
                  classType:(NSString *)classType
                    address:(NSString *)address
                 personName:(NSString *)personName
                        age:(int)age
                      phone:(NSString *)phone
               total_amount:(NSString *)total_amount
                   pay_type:(NSString *)pay_type
                  school_mj:(NSString *)school_mj
                 school_yhq:(NSString *)school_yhq
                     pt_yhq:(NSString *)pt_yhq
{

    if (![SVProgressHUD isVisible]) {
        [SVProgressHUD showProgress:-1 status:@"正在发起支付..."];
    }
    //创建会话管理员
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置响应序列化 让响应格式统一
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //发出请求
    [manager POST:[NSString stringWithFormat:@"%@paynew/index", kBaseURL]
       parameters:@{
                    @"goodsName" : goodsName ? goodsName : @"",
                    @"counts" : @(counts),
                    @"suid" : suid ? suid : @"",
                    @"id" : uid ? uid : @"",
                    @"classType" : classType ? classType : @"",
                    @"address" : address ? address : @"",
                    @"personName" : personName ? personName : @"",
                    @"age" : @(age),
                    @"phone" : phone ? phone : @"",
                    @"total_amount" : total_amount ? total_amount : @"",
                    @"subject" : @"",
                    @"pay_type": pay_type ? pay_type : @"",
                    @"school_mj": school_mj ? school_mj : @"",
                    @"school_yhq": school_yhq ? school_yhq : @"",
                    @"pt_yhq": pt_yhq ? pt_yhq : @"",
                    @"version": [NSString stringWithFormat:@"iOS%@", [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"]],
                    @"app_userinfo" : TheCurUser.token,
                    @"nanbopage" : [@"nanboshengxueorg" md5String]
                    }
     
         progress:^(NSProgress * _Nonnull uploadProgress) {
            
                                                                                    }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSLog(@"**********alipay:  %d", [[[UIApplication sharedApplication] windows] objectAtIndex:0].hidden);
              [SVProgressHUD dismiss];
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

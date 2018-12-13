//
//  WLKTWeixinRepay.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/2/8.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTWeixinRepay.h"
#import <WXApi.h>
#import <AFNetworking.h>
#import "WLKTLogin.h"

@implementation WLKTWeixinRepay

+ (void)WeixinPayWithOrderId:(NSString *)oid
{
    if (![SVProgressHUD isVisible]) {
        [SVProgressHUD showProgress:-1 status:@"正在发起支付..."];
    }
    //创建会话管理员
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置响应序列化 让响应格式统一
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //发出请求
    [manager POST:[NSString stringWithFormat:@"%@paynew/repay", kBaseURL] parameters:@{
                                                                                       @"id" : oid ? oid : @"",
                                                                                       @"paytype": @"weixin",
                                                                                       @"app_userinfo" : TheCurUser.token,
                                                                                       @"version": [NSString stringWithFormat:@"iOS%@", [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"]],
                                                                                       @"nanbopage" : [@"nanboshengxueorg" md5String]
                                                                                       }
         progress:^(NSProgress * _Nonnull uploadProgress) {
             
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

              NSString *orderStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
              if (orderStr.length < 10) {
                  [SVProgressHUD showInfoWithStatus:@"订单已过期"];
                  return ;
              }
              if ( responseObject != nil) {
                  NSMutableDictionary *dict = NULL;
                  NSError *error;
                  //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
                  dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];
                  
                  if(dict != nil){
                      NSMutableString *retcode = [dict objectForKey:@"retcode"];
                      if (retcode.intValue == 0){
                          NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
                          
                          //调起微信支付
                          PayReq* req             = [[PayReq alloc] init];
                          req.partnerId           = [dict objectForKey:@"partnerid"];
                          req.prepayId            = [dict objectForKey:@"prepayid"];
                          req.nonceStr            = [dict objectForKey:@"noncestr"];
                          req.timeStamp           = stamp.intValue;
                          req.package             = [dict objectForKey:@"package"];
                          req.sign                = [dict objectForKey:@"sign"];
                          [WXApi sendReq:req];
                          
                      }else{
                          NSLog(@"%@", [dict objectForKey:@"retmsg"]);
                      }
                  }else{
                      [SVProgressHUD showInfoWithStatus:@"订单已过期"];
                      return ;
                  }
              }
              
              
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              [SVProgressHUD showErrorWithStatus:@"订单支付失败"];
              [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"payFail" object:nil]];
          }];
    
}


@end


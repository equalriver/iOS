//
//  WLKTWeixinPay.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/2/7.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTWeixinPay.h"
#import <WXApi.h>
#import <AFNetworking.h>
#import "WLKTLogin.h"

@implementation WLKTWeixinPay

+ (void)WeixinPayWithGoodsName:(NSString *)goodsName
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
    [manager POST:[NSString stringWithFormat:@"%@weixinpay/wx_pay", kBaseURL]
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
              [SVProgressHUD dismiss];
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
                      
                  }
              }
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              [SVProgressHUD dismiss];
              [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"payFail" object:nil]];
          }];
    
}


@end


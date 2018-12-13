//
//  WLKTTianfuPayApi.m
//  wlkt
//
//  Created by 尹平江 on 17/3/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTTianfuPayApi.h"
#import "WLKTLogin.h"
//goodsName	商品名称,课程名称
//counts	课时
//suid	报名课程所属学校id
//Id	课程的id
//classType	报名类型(一对一/班课)
//address	上课地址
//personName	上课人的姓名
//age	年龄
//phone	联系电话
@interface WLKTTianfuPayApi ()
@property (copy, nonatomic) NSString *goodsName;
@property (copy, nonatomic) NSString *classType;
@property (copy, nonatomic) NSString *personName;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *phone;
@property (strong, nonatomic) NSNumber *counts;
@property (copy, nonatomic) NSString *suid;
@property (copy, nonatomic) NSString *uid;
@property (strong, nonatomic) NSNumber *age;
@property (copy, nonatomic) NSString *pay_type;
@property (copy, nonatomic) NSString *school_mj;
@property (copy, nonatomic) NSString *school_yhq;
@property (copy, nonatomic) NSString *pt_yhq;
@end

@implementation WLKTTianfuPayApi

- (instancetype)initWithGoodsName:(NSString *)goodsName
                           counts:(NSInteger)counts
                             suid:(NSString *)suid
                              uid:(NSString *)uid
                        classType:(NSString *)classType
                          address:(NSString *)address
                       personName:(NSString *)personName
                              age:(int)age
                            phone:(NSString *)phone
                         pay_type:(NSString *)pay_type
                        school_mj:(NSString *)school_mj
                       school_yhq:(NSString *)school_yhq
                           pt_yhq:(NSString *)pt_yhq
{
    self = [super init];
    if (self) {
        _goodsName = goodsName;
        _counts = @(counts);
        _suid = suid;
        _uid = uid;
        _classType = classType;
        _address = address;
        _personName = personName;
        _age = @(age);
        _phone = phone;
        _pay_type = pay_type ? pay_type : @"";
        _school_mj = school_mj ? school_mj: @"";
        _school_yhq = school_yhq ? school_yhq : @"";
        _pt_yhq = pt_yhq ? pt_yhq : @"";
    }
    return self;
}
- (NSString *)requestUrl {
    return @"tianfupaynew/pay";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"goodsName" : _goodsName,
             @"counts" : _counts,
             @"suid" : _suid,
             @"id" : _uid,
             @"classType" : _classType,
             @"address" : _address,
             @"personName" : _personName,
             @"age" : _age,
             @"phone" : _phone,
             @"pay_type": _pay_type,
             @"school_mj": _school_mj,
             @"school_yhq": _school_yhq,
             @"pt_yhq": _pt_yhq,
             @"version": [NSString stringWithFormat:@"iOS%@", [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"]],
             @"app_userinfo" : TheCurUser.token
             };
}

@end


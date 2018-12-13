//
//  WLKTActiveCollectData.h
//  wlkt
//
//  Created by 尹平江 on 2017/7/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTActiveCollectData : NSObject
/// 活动id
@property (copy, nonatomic) NSString *aid;
/// 活动所属学校id
@property (copy, nonatomic) NSString *suid;
///	活动标题
@property (copy, nonatomic) NSString *title;
///	活动副标题
@property (copy, nonatomic) NSString *subtitle;
///	收费性质(1收费,0免费)
@property (copy, nonatomic) NSString *feesxz;
///	价格
@property (copy, nonatomic) NSString *price;
///	活动状态
@property (copy, nonatomic) NSString *actstatus;
///	地址简写
@property (copy, nonatomic) NSString *shortaddress;
///	图片
@property (copy, nonatomic) NSString *img;
///	学校名称
@property (copy, nonatomic) NSString *schoolname;
///	活动时间拼接
@property (copy, nonatomic) NSString *asctime;
///	价格的单位
@property (copy, nonatomic) NSString *coin;
///	该活动是否有效,1是有效,0是无效,意思是指该活动可能已经下架或者被删除了
@property (copy, nonatomic) NSString *valid;

@end

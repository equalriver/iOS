//
//  WLKTPolicyPhone.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/2/27.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTPolicyPhoneApi.h"

@interface WLKTPolicyPhone : NSObject
+ (void)policyPhoneWithType:(WLKTPolicyPhoneType)type typeId:(NSString *)typeId;
@end
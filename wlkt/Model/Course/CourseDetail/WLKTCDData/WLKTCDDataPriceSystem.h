//
//  WLKTCDDataPriceSystem.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/30.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDDataPriceSystemSub: NSObject
@property (copy, nonatomic) NSString *index;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *checkStaus;
//@property (copy, nonatomic) NSString *select;

@end

@interface WLKTCDDataPriceSystem : NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *value;
@property (copy, nonatomic) NSArray<CDDataPriceSystemSub *> *sub;

@end

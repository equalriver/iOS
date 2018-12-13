//
//  WLKTLiveVideoDetailVC.h
//  wlkt
//
//  Created by 尹平江 on 2018/5/14.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "NTESPlayerVC.h"

@interface WLKTLiveVideoDetailVC : NTESPlayerVC
@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *playUrl;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithName:(NSString *)name url:(NSString *)playUrl;
@end

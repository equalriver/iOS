//
//  WLKTUserGenderVC.h
//  wlkt
//
//  Created by 尹平江 on 17/3/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^userGenderBlock)(NSString *);

@interface WLKTUserGenderVC : UIViewController
@property (copy, nonatomic) userGenderBlock userGenderBlock;
@property (copy, nonatomic)NSString *userGenderTemp;
@end

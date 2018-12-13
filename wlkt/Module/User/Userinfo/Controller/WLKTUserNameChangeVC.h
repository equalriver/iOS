//
//  WLKTUserNameChangeVC.h
//  wlkt
//
//  Created by 尹平江 on 17/3/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^usernameChangeBlock)(NSString *);

@interface WLKTUserNameChangeVC : UIViewController

@property (strong, nonatomic) UITextField *userName;
@property (copy, nonatomic) usernameChangeBlock usernameChangeBlock;

@end

//
//  WLKTJoinTableViewController.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    WLKTJoinImagePickerTypeCertificate,
    WLKTJoinImagePickerTypeFaRenFront,
    WLKTJoinImagePickerTypeFaRenReverse,
    WLKTJoinImagePickerTypeApplicantFront,
    WLKTJoinImagePickerTypeApplicantReverse,
} WLKTJoinImagePickerType;

@interface WLKTJoinTableViewController : UITableViewController

@end

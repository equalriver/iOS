//
//  WLKTFrontPageCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTNewsNormalNewsList.h"

typedef enum : NSUInteger {
    WLKTNewsContainImage,
    WLKTNewsContainTextOnly,
    WLKTNewsContainVideo,
} WLKTNewsContainType;

@interface WLKTFrontPageCell : UITableViewCell
- (void)setCellData:(WLKTNewsNormalNewsList *)data;

@end

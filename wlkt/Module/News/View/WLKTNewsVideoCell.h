//
//  WLKTNewsVideoCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTNewsNormalNewsList.h"

@interface WLKTNewsVideoCell : UITableViewCell
- (void)setCellData:(WLKTNewsNormalNewsList *)data videoTapHandle:(void(^)(void))videoTapHandle;
@end

//
//  WLKTActivityDetailMoreBrowseCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTActivityDetailSchoolList.h"

@protocol ActivityDetailGoTopDelegate <NSObject>
- (void)didSelectedHotSchool:(NSString *)suid;
@end

@interface WLKTActivityDetailMoreBrowseCell : UITableViewCell
@property (weak, nonatomic) id<ActivityDetailGoTopDelegate> delegate;
- (instancetype)initWithData:(NSArray<WLKTActivityDetailSchoolList *> *)data;

@end

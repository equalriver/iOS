//
//  WLKTSchoolHeadIndexes.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SchoolHeadIndexesDelegate <NSObject>
- (void)SchoolHeadIndexesDidClick:(NSInteger)tag;

@end

@interface WLKTSchoolHeadIndexes : UIView
@property (weak, nonatomic) id<SchoolHeadIndexesDelegate> delegate;
- (void)setItemColorAtIndex:(NSInteger)index;

@end

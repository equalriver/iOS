//
//  WLKTActivityDetailIntroduceCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ActivityDetailIntroDelegate <NSObject>
- (void)didLoadHtmlStringWithHeight:(CGFloat)height;
@end

@interface WLKTActivityDetailIntroduceCell : UITableViewCell
@property (weak, nonatomic) id<ActivityDetailIntroDelegate> delegate;
@property (copy, nonatomic) NSString *intro;
@end

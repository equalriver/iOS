//
//  WLKActivityViewController.h
//  wlkt
//
//  Created by slovelys on 2017/7/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

typedef NS_ENUM(NSUInteger, ActivityListPosition) {
    ActivityListPositionList,
    ActivityListPositionHomepage,
    ActivityListPositionDetail,
};

@interface WLKActivityViewController : UITableViewController

- (instancetype)initWithActivityListPosition:(ActivityListPosition)position activityId:(NSString *)actid info:(NSDictionary *)info;

@end

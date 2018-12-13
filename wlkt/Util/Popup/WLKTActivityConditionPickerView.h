//
//  WLKTActivityConditionPickerView.h
//  wlkt
//
//  Created by slovelys on 2017/7/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

@protocol WLKTActivityConditionPickerViewDelegate <NSObject>

@optional

- (void)activityConditionPickerViewDidSelectedAtIndex:(NSInteger)index condition:(NSString *)condition;

@end

@interface WLKTActivityConditionPickerView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *primaryTableView;

@property (weak, nonatomic) IBOutlet UITableView *secondTableView;

@property (weak, nonatomic) id<WLKTActivityConditionPickerViewDelegate> delegate;

@end

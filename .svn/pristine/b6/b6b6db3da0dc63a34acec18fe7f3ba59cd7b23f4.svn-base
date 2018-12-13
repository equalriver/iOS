//
//  WLKTCourseDetailSectionHeaderView.m
//  wlkt
//
//  Created by slovelys on 17/4/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailSectionHeaderView.h"

@implementation WLKTCourseDetailSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text {
    if (self = [super initWithFrame:frame]) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, frame.size.width, frame.size.height)];
        label.text = text;
        label.textColor = kNavBarBackgroundColor;
        [self addSubview:label];
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(8, self.height - 1, kScreenWidth - 8, 1)];
        line.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:line];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end

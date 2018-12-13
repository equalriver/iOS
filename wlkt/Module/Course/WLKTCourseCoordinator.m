//
//  WLKTCourseCoordinator.m
//  wlkt
//
//  Created by slovelys on 17/3/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseCoordinator.h"
#import "WLKTUser.h"
//#import "WLKTClassifyVC.h"
#import "WLKTClassifyCourseTVC.h"

@interface WLKTCourseCoordinator ()

@property (strong, nonatomic, readwrite) UINavigationController *navigationController;
@property (strong, nonatomic) WLKTClassifyCourseTVC *course;
@property (strong, nonatomic) WLKTUser *user;

@end

@implementation WLKTCourseCoordinator

- (instancetype)initWithUser:(WLKTUser *)user {
    WLKT_INIT(
              _user = user;
              )
}

- (void)start {
    
}

- (WLKTClassifyCourseTVC *)course {
    if (!_course) {
        _course = [[WLKTClassifyCourseTVC alloc] init];
    }
    return _course;
}

- (UINavigationController *)navigationController {
    if (!_navigationController) {
        _navigationController = [[UINavigationController alloc] initWithRootViewController:self.course];
    }
    return _navigationController;
}

@end

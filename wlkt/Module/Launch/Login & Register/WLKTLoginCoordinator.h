//
//  WLKTLoginCoordinator.h
//  wlkt
//
//  Created by slovelys on 17/3/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTRegisterViewController.h"
@class WLKTLoginCoordinator;

@protocol WLKTLoginCoordinatorDelegate <NSObject>

@optional
- (void)loginCoordinatorDidFinishLogin:(WLKTLoginCoordinator *)coordinator;
- (void)loginCoordinatorDidFinishLogin:(WLKTLoginCoordinator *)coordinator handler:(void(^)(UIViewController *vc))handler;
- (void)loginCoordinatorDidRequestDismissal:(WLKTLoginCoordinator *)loginCoordinator;

@end

@interface WLKTLoginCoordinator : NSObject <WLKTRegisterViewControllerDelegate>

@property (strong, nonatomic, readonly) UINavigationController *navigationController;
@property (weak, nonatomic) id<WLKTLoginCoordinatorDelegate> delegate;

@end

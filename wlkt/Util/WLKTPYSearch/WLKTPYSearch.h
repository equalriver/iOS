//
//  PYSearch.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/26.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLKTPYSearch : NSObject
+ (UISearchBar *)searchBarWithTarget:(UIViewController *)vc completion:(void(^)(NSString *searchText))completion;
- (instancetype)initWithTarget:(UIViewController *)vc completion:(void(^)(NSString *searchText))completion;
@property (strong, nonatomic) UISearchBar *searchBar;
@end

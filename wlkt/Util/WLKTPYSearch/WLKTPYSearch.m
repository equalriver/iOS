//
//  PYSearch.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/26.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTPYSearch.h"
#import <PYSearch.h>
#import "WLKTCourse.h"
#import "WLKTSearchApi.h"
#import <BlocksKit.h>
#import "WLKTSearchResultVC.h"

@interface WLKTPYSearch()<PYSearchViewControllerDelegate, PYSearchViewControllerDataSource, UISearchBarDelegate>
@property (strong, nonatomic) WLKTSearchApi *api;

@property (strong, nonatomic) UIViewController *vc;

@property (strong, nonatomic) NSMutableArray *searchResults;
@property (copy, nonatomic) void(^completion)(NSString *searchText);
@end

@implementation WLKTPYSearch
+ (UISearchBar *)searchBarWithTarget:(UIViewController *)vc completion:(void(^)(NSString *searchText))completion{
    WLKTPYSearch *s = [[WLKTPYSearch alloc]initWithTarget:vc completion:^(NSString *searchText) {
        completion(searchText);
    }];
    return s.searchBar;
}

- (instancetype)initWithTarget:(UIViewController *)vc completion:(void(^)(NSString *searchText))completion
{
    self = [super init];
    if (self) {
        _vc = vc;
        _completion = completion;

    }
    return self;
}

#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:nil searchBarPlaceholder:@"请输入关键词"];
    searchViewController.searchBar.tintColor = [UIColor lightGrayColor];
//    searchViewController.searchSuggestionHidden = YES;
    searchViewController.delegate = self;
    searchViewController.dataSource = self;
    searchViewController.searchHistoriesCount = 10;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self.vc.navigationController presentViewController:nav animated:YES completion:nil];
    
    return NO;
}

//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
//    [[UIApplication sharedApplication].keyWindow endEditing:YES];
//    !self.completion ?: self.completion(searchBar.text);
//    [self.vc.navigationController dismissViewControllerAnimated:YES completion:nil];
//}

#pragma mark - PYSearchViewControllerDelegate
- (void)searchViewController:(PYSearchViewController *)searchViewController searchTextDidChange:(UISearchBar *)seachBar searchText:(NSString *)searchText{
    if (searchText.length) {
        WLKTSearchApi *api = [[WLKTSearchApi alloc] initWithSearchText:searchText];
        [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            [request.responseJSONObject[@"result"][@"list"] enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.searchResults addObject:obj];
            }];
            searchViewController.searchSuggestions = [request.responseJSONObject[@"result"][@"list"] bk_map:^id(NSDictionary *obj) {
                return obj[@"coursename"];
            }];
        } failure:^(__kindof YTKBaseRequest *request) {
            NSLog(@"%@", request.responseJSONObject);
        }];
    }
}

//- (void)searchViewController:(PYSearchViewController *)searchViewController didSelectHotSearchAtIndex:(NSInteger)index searchText:(NSString *)searchText {
//    WLKTCourse *course = self.hotSearchs[index];
//    WLKTSearchResultVC *vc = [[WLKTSearchResultVC alloc]initWithSearchText:course.coursename];
//    [searchViewController.navigationController pushViewController:vc animated:YES];
//}

- (void)searchViewController:(PYSearchViewController *)searchViewController didSelectSearchHistoryAtIndex:(NSInteger)index searchText:(NSString *)searchText {
    WLKTSearchApi *api = [[WLKTSearchApi alloc] initWithSearchText:searchText];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSMutableArray *array = [NSMutableArray array];
        [self.searchResults removeAllObjects];
        [request.responseJSONObject[@"result"][@"list"] enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.searchResults addObject:obj];
        }];
        if (array.count == 1) {
            NSDictionary * dic = request.responseJSONObject[@"result"][@"list"][0];
//            !self.completion ?: self.completion(dic[@"coursename"]);
            WLKTSearchResultVC *vc = [[WLKTSearchResultVC alloc]initWithSearchText:dic[@"coursename"]];
            [searchViewController.navigationController pushViewController:vc animated:YES];
        } else {
            searchViewController.searchSuggestions = [request.responseJSONObject[@"result"][@"list"] bk_map:^id(NSDictionary *obj) {
                return obj[@"coursename"];
            }];
        }
//        if (array.count == 0) {
//            !self.completion ?: self.completion(searchText);
//        }
//        [searchViewController.navigationController dismissViewControllerAnimated:YES completion:nil];
        
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@", request.responseJSONObject);
    }];
}

- (void)searchViewController:(PYSearchViewController *)searchViewController didSelectSearchSuggestionAtIndexPath:(NSIndexPath *)indexPath searchBar:(UISearchBar *)searchBar{
    [self.searchResults enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj[@"coursename"] isEqualToString:searchBar.text]) {
                //            !self.completion ?: self.completion(searchText);
            
            WLKTSearchResultVC *vc = [[WLKTSearchResultVC alloc]initWithSearchText:searchBar.text];
            [searchViewController.navigationController pushViewController:vc animated:YES];
            *stop = YES;
        }
    }];
        //    [searchViewController.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - get
- (UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth - 70 * ScreenRatio_6, 44)];
        _searchBar.delegate = self;
        _searchBar.placeholder = @"请输入关键词";
        [_searchBar setSearchBarStyle:UISearchBarStyleMinimal];
        _searchBar.barTintColor = [UIColor whiteColor];
    }
    return _searchBar;
}
- (NSMutableArray *)searchResults {
    if (!_searchResults) {
        _searchResults = [NSMutableArray arrayWithCapacity:10];
    }
    return  _searchResults;
}
@end
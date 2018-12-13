//
//  WLKTClassifySearchAllResult.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/4.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTClassifyData.h"

typedef enum : NSUInteger {
    ClassifySearchTypeDistance,
    ClassifySearchTypeClassify,
    ClassifySearchTypeSmartSort,
    ClassifySearchTypeFliter,
    ClassifySearchTypeNone
} ClassifySearchType;

@protocol WLKTClassifySearchResultDelegate <NSObject>
- (void)didSelectedSearchResultType:(ClassifySearchType)type
                  searchResultIndex:(NSMutableDictionary<NSNumber *, NSNumber *> *)searchResultIndex
             searchAllLevel_1_index:(NSInteger)searchAllLevel_1_index
             searchAllLevel_2_index:(NSInteger)searchAllLevel_2_index
                         searchValue:(NSString *)searchValue
                         completion:(void(^)(void))completion;
@end

@interface WLKTClassifySearchResult : UIView
- (instancetype)initWithSearchType:(ClassifySearchType)type
                              data:(WLKTClassifyData *)data
                             index:(NSMutableDictionary *)index
                        completion:(void(^)(void))completion;

- (instancetype)initWithSearchData:(WLKTClassifyData *)data
                        searchType:(ClassifySearchType)type
            searchAllLevel_1_index:(NSInteger)searchAllLevel_1_index
            searchAllLevel_2_index:(NSInteger)searchAllLevel_2_index
                        completion:(void(^)(void))completion;
@property (weak, nonatomic) id<WLKTClassifySearchResultDelegate> delegate;
@end

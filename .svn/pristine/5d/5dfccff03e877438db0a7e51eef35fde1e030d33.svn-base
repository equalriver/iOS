//
//  XLTBaseTableViewCell.h
//  lsg
//
//  Created by 朱琨 on 16/5/20.
//  Copyright © 2016年 Talenton. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLTBaseTableViewCell : UITableViewCell

@property (strong, nonatomic) id model;

/**
 *  子类必须实现该方法，并调用super方法
 *
 *  @param model
 */
- (void)setModel:(id)model;

/**
 *  Auto Layout时通过indexPath缓存高度
 *
 *  @param tableView tableView
 *  @param indexPath indexPath
 *  @param model     model
 *
 *  @return cell height
 */
+ (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath model:(id)model;

/**
 *  Auto Layout时通过cacheKey缓存高度
 *
 *  @param tableView tableView
 *  @param model     model
 *
 *  @return cell height
 */
+ (CGFloat)tableView:(UITableView *)tableView heightForRowWithModel:(id)model;

/**
 *  通过indexPath清除缓存
 *
 *  @param tableView tableView
 *  @param indexPath indexPath
 */
+ (void)tableView:(UITableView *)tableView invalidateHeightAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  通过cacheKey清除缓存
 *
 *  @param tableView tableView
 *  @param model     model
 */
+ (void)tableView:(UITableView *)tableView invalidateHeightWithModel:(id)model;

/**
 *  清除所有缓存高度
 *  设置了cacheKey时通过cacheKey清除缓存高度，否则用indexPath
 *
 *  @param tableView tableView
 */
+ (void)invalidateAllHeightCacheOfTableView:(UITableView *)tableView;

/**
 *  Cell identifier
 *
 *  子类必须重写该方法
 *
 *  @return cell identifier
 */
+ (NSString * __nullable)identifier;

/**
 *  用于缓存cell高度的key，设置为model的具有唯一性的属性名
 *
 *  @return key
 */
+ (NSString * __nullable)cacheKey;

@end

NS_ASSUME_NONNULL_END

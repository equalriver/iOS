//
//  WLKTSetting.m
//  wlkt
//
//  Created by slovelys on 2017/4/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSetting.h"
#import "NSFileManager+Category.h"

@implementation WLKTSetting

+ (NSString *)cacheCostString {
    unsigned long long imageCost = [YYWebImageManager sharedManager].cache.diskCache.totalCost;
    unsigned long long totalCost = imageCost;
    totalCost += [DefaultFileManager sizeOfFolderAtPath:[self URLForDocumentDirectory].path];
    
    double costInMB = totalCost / 1024.0 / 1024.0;
    if (costInMB <= 50) {
        return [NSString stringWithFormat:@"%.1f MB", costInMB];
    }
    return @"大于 50 MB";
}

+ (void)clearCacheWithCompletion:(void (^)(void))completion {
    [SVProgressHUD showInfoWithStatus:@"正在清理..."];
    YYDiskCache *cache = [YYWebImageManager sharedManager].cache.diskCache;
    [DefaultFileManager removeItemAtURL:[self URLForDocumentDirectory] error:nil];
    [cache removeAllObjectsWithBlock:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion();
                [SVProgressHUD showSuccessWithStatus:@"清理完毕"];
            }
        });
    }];
}

+ (NSURL *)URLForDocumentDirectory {
    return [[DefaultFileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask].firstObject URLByAppendingPathComponent:@"com.neimbo.wlkt.document" isDirectory:YES];
}

@end

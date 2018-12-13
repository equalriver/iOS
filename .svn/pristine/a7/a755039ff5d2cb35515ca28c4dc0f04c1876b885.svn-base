//
//  NSFileManager+Category.m
//  wlkt
//
//  Created by slovelys on 2017/4/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "NSFileManager+Category.h"

@implementation NSFileManager (Category)

- (unsigned long long)sizeOfFolderAtPath:(NSString *)path {
    NSArray *files = [self subpathsOfDirectoryAtPath:path error:nil];
    NSEnumerator *enumerator = [files objectEnumerator];
    NSString *fileName;
    unsigned long long size = 0;
    while (fileName = [enumerator nextObject]) {
        size += [[self attributesOfItemAtPath:[path stringByAppendingPathComponent:fileName] error:nil] fileSize];
    }
    return size;
}

@end

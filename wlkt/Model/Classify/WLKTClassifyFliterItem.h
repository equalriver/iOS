//
//  WLKTClassifyFliterItem.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/5.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLKTClassifyFilterSubItem.h"

@interface WLKTClassifyFliterItem : NSObject
@property (copy, nonatomic) NSString *fid;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *value;

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSArray<WLKTClassifyFilterSubItem *> *saleVo;
@end


//
//  WLKTSchoolStudentCell.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGPhoto.h"
#import "WLKTSchoolStudentList.h"

@protocol WLKTSchoolStudentDelegate <NSObject>
- (void)didSelectedStudentItem:(NSIndexPath *)indexPath type:(LGShowImageType)type;
@end

@interface WLKTSchoolStudentCell : UITableViewCell
@property (weak, nonatomic) id<WLKTSchoolStudentDelegate> delegate;
- (instancetype)initWithData:(NSArray<WLKTSchoolStudentList *> *)data;
@end

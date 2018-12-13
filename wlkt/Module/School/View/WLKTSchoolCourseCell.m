//
//  WLKTSchoolCourseCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolCourseCell.h"
#import "WLKTSchoolCourseCollectionCell.h"

@interface WLKTSchoolCourseCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *contentCV;
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;
@property (copy, nonatomic) NSArray<WLKTCourseDetailNewAbout_list *> *dataArray;
@end

@implementation WLKTSchoolCourseCell
- (instancetype)initWithData:(NSArray<WLKTCourseDetailNewAbout_list *> *)array
{
    self = [super init];
    if (self) {
        _dataArray = [NSArray arrayWithArray:array];
        [self.contentView addSubview:self.contentCV];
    }
    return self;
}

#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WLKTSchoolCourseCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WLKTSchoolCourseCollectionCell" forIndexPath:indexPath];
    [cell setCellData:self.dataArray[indexPath.item]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(didSelectedOtherCourseCollectionViewItem:)]) {
        [self.delegate didSelectedOtherCourseCollectionViewItem:indexPath];
    }
}

#pragma mark - get
- (UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        _layout.itemSize = CGSizeMake(170 * ScreenRatio_6, 150 * ScreenRatio_6);
        _layout.minimumLineSpacing = 5 *ScreenRatio_6;
        _layout.minimumInteritemSpacing = 10 * ScreenRatio_6;
        _layout.sectionInset = UIEdgeInsetsMake(0, 10 *ScreenRatio_6, 0, 10 *ScreenRatio_6);
    }
    return _layout;
}
- (UICollectionView *)contentCV{
    if (!_contentCV) {
        _contentCV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ((_dataArray.count + 1) / 2) * 155 *ScreenRatio_6) collectionViewLayout:self.layout];
        _contentCV.scrollEnabled = NO;
        _contentCV.backgroundColor = UIColorHex(ffffff);
        _contentCV.delegate = self;
        _contentCV.dataSource = self;
        [_contentCV registerClass:[WLKTSchoolCourseCollectionCell class] forCellWithReuseIdentifier:@"WLKTSchoolCourseCollectionCell"];
    }
    return _contentCV;
}

@end
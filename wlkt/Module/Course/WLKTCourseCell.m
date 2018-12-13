//
//  WLKTCourseCell.m
//  wlkt
//
//  Created by slovelys on 17/3/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseCell.h"
#import "WLKTCourseCollectionCell.h"

@interface WLKTCourseCell () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;


@end

@implementation WLKTCourseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.collectionViewFlowLayout.minimumInteritemSpacing = 5;
    self.collectionViewFlowLayout.minimumLineSpacing = 5;
    [self setupCollectionView];
//    self.backgroundColor = UIColorHex(fafafa);
}

+ (NSString *)identifier {
    return @"WLKTCourseCell";
}

- (void)setModel:(id)model {
    [super setModel:model];
    self.collectionViewFlowLayout.minimumInteritemSpacing = 5;
    self.collectionViewFlowLayout.minimumLineSpacing = 0;
    [self.dataSource removeAllObjects];
    [model enumerateObjectsUsingBlock:^(WLKTCourse * _Nonnull course, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.dataSource addObject:course];
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}

- (void)setupCollectionView {
    //[self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([WLKTCourseCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:@"WLKTCourseCollectionCell"];
    [self.collectionView registerClass:[WLKTCourseCollectionCell class] forCellWithReuseIdentifier:@"WLKTCourseCollectionCell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.scrollEnabled = NO;
    
    [self.collectionView reloadData];
    [self updateConstraintsIfNeeded];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)
collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WLKTCourseCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WLKTCourseCollectionCell" forIndexPath:indexPath];
    WLKTCourse *course = self.dataSource[indexPath.row];
    cell.course = course;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(courseCell:didSelectItem:atIndexPath:)]) {
        [self.delegate courseCell:self didSelectItem:self.dataSource[indexPath.row] atIndexPath:indexPath];
    }
}

#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(168 * ScreenRatio_6, kHomepageCellHeight);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(3, 15 * ScreenRatio_6, 2, 15 * ScreenRatio_6);
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

@end

//
//  WLKTCouponSaleHeadCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/18.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCouponSaleHeadCell.h"

@interface WLKTCouponSaleHeadCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;
@property (strong, nonatomic) NSMutableArray<WLKTSaleCourseSchoolList *> *dataArr;

@end

@implementation WLKTCouponSaleHeadCell

- (instancetype)initWithSchoolNames:(NSArray<WLKTSaleCourseSchoolList *> *)schoolNames
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (self) {
        self.dataArr = schoolNames.mutableCopy;
        self.backgroundColor = [UIColor colorWithHexString:@"fb9661"];
        [self.contentView addSubview:self.bgIV];
        [self.contentView addSubview:self.titleIV];
        [self.contentView addSubview:self.schoolItemCV];
        [self.schoolItemCV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CouponSaleHeadCell"];
        [self makeConstraints];
    }
    return self;
}

#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CouponSaleHeadCell" forIndexPath:indexPath];
    cell.backgroundColor = UIColorHex(ee402d);
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightSemibold];
    titleLabel.textColor = [UIColor colorWithHexString:@"#ffffff"];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor colorWithHexString:@"#fa5d60"];
    titleLabel.text = self.dataArr[indexPath.item].schoolname;
    [cell.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(cell.contentView);
        make.size.mas_equalTo(cell.contentView);
    }];
   
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(couponSaleDidSelectedItem:)]) {
        [self.delegate couponSaleDidSelectedItem:indexPath];
    }
}

#pragma mark - makeConstraints
- (void)makeConstraints{
    [self.bgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 300 * ScreenRatio_6));
        make.top.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView);
    }];
    [self.titleIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 25));
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.bgIV.mas_bottom).offset(20 * ScreenRatio_6);
    }];
    [self.schoolItemCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 40));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.titleIV.mas_bottom).offset(10);
    }];
}

#pragma mark - get
- (NSMutableArray<WLKTSaleCourseSchoolList *> *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (UIImageView *)bgIV{
    if (!_bgIV) {
        _bgIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"折扣课程banner"]];
    }
    return _bgIV;
}
- (UIImageView *)titleIV{
    if (!_titleIV) {
        _titleIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"折扣课程标题1"]];
    }
    return _titleIV;
}
- (UICollectionView *)schoolItemCV{
    if (!_schoolItemCV) {
        _schoolItemCV = [[UICollectionView alloc]initWithFrame:CGRectNull collectionViewLayout:self.layout];
        _schoolItemCV.backgroundColor = [UIColor colorWithHexString:@"fb9661"];
        _schoolItemCV.dataSource = self;
        _schoolItemCV.delegate = self;
    }
    return _schoolItemCV;
}
- (UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.sectionInset = UIEdgeInsetsMake(0, 5, 5, 0);
        _layout.minimumInteritemSpacing = 5;
        //_layout.minimumLineSpacing = 19;
        _layout.itemSize = CGSizeMake(100, 30);
        //_layout.headerReferenceSize = CGSizeMake(ScreenWidth - 76 * ScreenRatio_6, 45 * ScreenRatio_6);
    }
    return _layout;
}

@end

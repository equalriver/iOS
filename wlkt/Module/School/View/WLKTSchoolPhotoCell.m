//
//  WLKTSchoolPhotoCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolPhotoCell.h"

@interface WLKTSchoolPhotoCollectionCell: UICollectionViewCell
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) UILabel *titleLabel;
- (void)setCellData:(WLKTSchoolPhotoList *)data;
@end

@implementation WLKTSchoolPhotoCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imgIV];
        [self.contentView addSubview:self.titleLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellData:(WLKTSchoolPhotoList *)data{
    [self.imgIV setImageURL:[NSURL URLWithString:data.thumb_photo]];
    self.titleLabel.text = data.describe;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.imgIV.image = nil;
    self.titleLabel.text = nil;
}

- (void)makeConstraints{
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140, 90));
        make.top.mas_equalTo(self.contentView);
        make.centerX.mas_equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140, 15));
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.centerX.mas_equalTo(self.contentView);
    }];
}

- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [UIImageView new];
        _imgIV.layer.masksToBounds = YES;
    }
    return _imgIV;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _titleLabel.textColor = KMainTextColor_3;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end

//**********************************************************************
@interface WLKTSchoolPhotoCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *photoCV;
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;
//@property (strong, nonatomic) UIView *separatorView;
@property (copy, nonatomic) NSArray<WLKTSchoolPhotoList *> *dataArr;

@end

@implementation WLKTSchoolPhotoCell
- (instancetype)initWithData:(NSArray<WLKTSchoolPhotoList *> *)data
{
    self = [super init];
    if (self) {
        _dataArr = [NSArray arrayWithArray:data];
        [self.contentView addSubview:self.photoCV];
//        [self.contentView addSubview:self.separatorView];
    }
    return self;
}

#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WLKTSchoolPhotoCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WLKTSchoolPhotoCollectionCell" forIndexPath:indexPath];
    [cell setCellData:self.dataArr[indexPath.item]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(didSelectedPhotoItem:type:)]) {
        [self.delegate didSelectedPhotoItem:indexPath type:LGShowImageTypeImageBroswer];
    }
}

#pragma mark - get
- (UICollectionView *)photoCV{
    if (!_photoCV) {
        _photoCV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 115) collectionViewLayout:self.layout];
        _photoCV.showsVerticalScrollIndicator = NO;
        _photoCV.showsHorizontalScrollIndicator = NO;
        _photoCV.delegate = self;
        _photoCV.dataSource = self;
        _photoCV.backgroundColor = [UIColor whiteColor];
        [_photoCV registerClass:[WLKTSchoolPhotoCollectionCell class] forCellWithReuseIdentifier:@"WLKTSchoolPhotoCollectionCell"];
    }
    return _photoCV;
}
- (UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.itemSize = CGSizeMake(140, 115);
        _layout.minimumInteritemSpacing = 10 * ScreenRatio_6;
        _layout.sectionInset = UIEdgeInsetsMake(0, 10 * ScreenRatio_6, 0, 0);
    }
    return _layout;
}
//- (UIView *)separatorView{
//    if (!_separatorView) {
//        _separatorView = [[UIView alloc]initWithFrame:CGRectMake(0, 119 + 0.5, ScreenWidth, 0.5)];
//        _separatorView.backgroundColor = separatorView_color;
//    }
//    return _separatorView;
//}

@end

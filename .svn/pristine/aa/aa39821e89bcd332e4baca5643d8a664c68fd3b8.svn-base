//
//  WLKTCDTeacherCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/30.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDTeacherCell.h"

@interface CDTeacherCollectionCell: UICollectionViewCell
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) UILabel *nameLabel;

@end

@implementation CDTeacherCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imgIV];
        [self.contentView addSubview:self.nameLabel];
        [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70 *ScreenRatio_6, 70 *ScreenRatio_6));
            make.top.centerX.mas_equalTo(self.contentView);
        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imgIV.mas_bottom).offset(10 *ScreenRatio_6);
            make.centerX.width.mas_equalTo(self.contentView);
        }];
    }
    return self;
}


- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [UIImageView new];
        _imgIV.contentMode = UIViewContentModeScaleAspectFill;
        _imgIV.layer.masksToBounds = YES;
        _imgIV.layer.cornerRadius = 35 *ScreenRatio_6;
    }
    return _imgIV;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _nameLabel.textColor = KMainTextColor_3;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

@end

/********************************************************************************/
@interface WLKTCDTeacherCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *teacherCV;
@end

@implementation WLKTCDTeacherCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.teacherCV];
    }
    return self;
}

- (void)setData:(WLKTCDData *)data{
    _data = data;
    [self.teacherCV reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.tlist.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CDTeacherCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CDTeacherCollectionCell" forIndexPath:indexPath];
    [cell.imgIV setImageURL:[NSURL URLWithString:self.data.tlist[indexPath.item].headimg]];
    cell.nameLabel.text = self.data.tlist[indexPath.item].name;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(didClickTeacherItem)]) {
        [self.delegate didClickTeacherItem];
    }
}

- (UICollectionView *)teacherCV{
    if (!_teacherCV) {
        UICollectionViewFlowLayout *l = [UICollectionViewFlowLayout new];
        l.itemSize = CGSizeMake(100 *ScreenRatio_6, 120 *ScreenRatio_6);
        l.sectionInset = UIEdgeInsetsMake(0, 10 *ScreenRatio_6, 0, 0);
        l.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _teacherCV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 10 *ScreenRatio_6, ScreenWidth, 120 *ScreenRatio_6) collectionViewLayout:l];
        _teacherCV.backgroundColor = [UIColor whiteColor];
        _teacherCV.dataSource = self;
        _teacherCV.delegate = self;
        [_teacherCV registerClass:[CDTeacherCollectionCell class] forCellWithReuseIdentifier:@"CDTeacherCollectionCell"];
    }
    return _teacherCV;
}
@end

//
//  WLKTCDEvaluationCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/15.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDEvaluationCell.h"

@interface CDEvaluationImageCollectionCell: UICollectionViewCell
@property (strong, nonatomic) UIImageView *imgIV;
@end

@implementation CDEvaluationImageCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imgIV];
        [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.contentView);
            make.center.mas_equalTo(self.contentView);
        }];
    }
    return self;
}


- (void)prepareForReuse{
    [super prepareForReuse];
    self.imgIV.image = nil;
}

- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [UIImageView new];
        _imgIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imgIV;
}

@end


/**************************************************/
@interface WLKTCDEvaluationCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UIImageView *headerIV;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *scoreLabel;
@property (strong, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) UICollectionView *imagesCV;
@property (strong, nonatomic) UILabel *timeLabel;

@end

@implementation WLKTCDEvaluationCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.headerIV];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.scoreLabel];
        [self.contentView addSubview:self.detailLabel];
        [self.contentView addSubview:self.imagesCV];
        [self.contentView addSubview:self.timeLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)setData:(CDCommentList_item *)data{
    _data = data;
    [self.headerIV setImageURL:[NSURL URLWithString:data.headimg]];
    self.nameLabel.text = data.username;
    self.scoreLabel.text = [NSString stringWithFormat:@"效果:%@  师资:%@  环境:%@", data.effect, data.teacher, data.environment];
    self.detailLabel.text = data.content;
    self.timeLabel.text = data.create_time;
    if (data.thumb_picture.count) {
        self.imagesCV.hidden = false;
        [self.imagesCV reloadData];
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.thumb_picture.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CDEvaluationImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CDEvaluationImageCollectionCell" forIndexPath:indexPath];
    [cell.imgIV setImageURL:[NSURL URLWithString:self.data.thumb_picture[indexPath.item]]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(didSelectedImage:)]) {
        [self.delegate didSelectedImage:indexPath.item];
    }
}

#pragma mark -
- (void)makeConstraints{
    [self.headerIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30 *ScreenRatio_6, 30 *ScreenRatio_6));
        make.top.left.mas_equalTo(self.contentView).offset(15 *ScreenRatio_6);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headerIV.mas_right).offset(5);
        make.centerY.mas_equalTo(self.headerIV);
        make.right.mas_equalTo(self.scoreLabel.mas_left);
    }];
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView).offset(-15 *ScreenRatio_6);
        make.centerY.mas_equalTo(self.headerIV);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel);
        make.right.mas_equalTo(self.scoreLabel);
        make.top.mas_equalTo(self.headerIV.mas_bottom).offset(10 *ScreenRatio_6);
    }];
    [self.imagesCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel);
        make.right.mas_equalTo(self.scoreLabel);
        make.height.mas_equalTo(60 *ScreenRatio_6);
        make.top.mas_equalTo(self.detailLabel.mas_bottom).offset(10 *ScreenRatio_6);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel);
        make.right.mas_equalTo(self.scoreLabel);
        make.bottom.mas_equalTo(self.contentView).offset(-10 *ScreenRatio_6);
    }];
    
}

#pragma mark - get
- (UIImageView *)headerIV{
    if (!_headerIV) {
        _headerIV = [UIImageView new];
        _headerIV.contentMode = UIViewContentModeScaleAspectFill;
        _headerIV.layer.masksToBounds = YES;
        _headerIV.layer.cornerRadius = 15 *ScreenRatio_6;
    }
    return _headerIV;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _nameLabel.textColor = KMainTextColor_6;
    }
    return _nameLabel;
}
- (UILabel *)scoreLabel{
    if (!_scoreLabel) {
        _scoreLabel = [UILabel new];
        _scoreLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _scoreLabel.textColor = KMainTextColor_9;
        _scoreLabel.textAlignment = NSTextAlignmentRight;
    }
    return _scoreLabel;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _detailLabel.textColor = KMainTextColor_3;
        _detailLabel.numberOfLines = 2;
    }
    return _detailLabel;
}
- (UICollectionView *)imagesCV{
    if (!_imagesCV) {
        UICollectionViewFlowLayout *l = [UICollectionViewFlowLayout new];
        l.itemSize = CGSizeMake(80 *ScreenRatio_6, 60 *ScreenRatio_6);
        l.minimumLineSpacing = 5;
        l.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _imagesCV = [[UICollectionView alloc]initWithFrame:CGRectNull collectionViewLayout:l];
        _imagesCV.backgroundColor = [UIColor whiteColor];
        _imagesCV.dataSource = self;
        _imagesCV.delegate = self;
        _imagesCV.hidden = YES;
        [_imagesCV registerClass:[CDEvaluationImageCollectionCell class] forCellWithReuseIdentifier:@"CDEvaluationImageCollectionCell"];
    }
    return _imagesCV;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _timeLabel.textColor = KMainTextColor_9;
    }
    return _timeLabel;
}

@end

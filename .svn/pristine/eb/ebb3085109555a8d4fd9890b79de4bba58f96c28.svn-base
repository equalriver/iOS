//
//  WLKTNews_Q_A_replyCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/4.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTNews_Q_A_replyCell.h"
#import "MIPhotoBrowser.h"

@interface News_Q_A_replyCollectionCell: UICollectionViewCell
@property (strong, nonatomic) UIImageView *imgIV;
@end

@implementation News_Q_A_replyCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imgIV];
        [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(115 *ScreenRatio_6, 90 *ScreenRatio_6));
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
        _imgIV.layer.masksToBounds = YES;
    }
    return _imgIV;
}

@end

//**********************************************************************************************
@interface WLKTNews_Q_A_replyCell ()<UICollectionViewDelegate, UICollectionViewDataSource, MIPhotoBrowserDelegate>
@property (strong, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) UILabel *username_timeLabel;
@property (strong, nonatomic) UICollectionView *imgCV;
@property (strong, nonatomic) UIView *separatorView;

@property (strong, nonatomic) WLKTNews_Q_A_detailReplyData *data;
@end

@implementation WLKTNews_Q_A_replyCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.detailLabel];
        [self.contentView addSubview:self.username_timeLabel];
        [self.contentView addSubview:self.separatorView];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellData:(WLKTNews_Q_A_detailReplyData *)data{
    _data = data;
    self.detailLabel.text = data.answer;
    self.username_timeLabel.text = [NSString stringWithFormat:@"回答人：%@  回答时间：%@", data.username, data.create_time];
    if (data.thumb_picture.count) {
        [self.contentView addSubview:self.imgCV];
        [self.imgCV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.detailLabel.mas_bottom).offset(10 * ScreenRatio_6);
            make.left.mas_equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(ScreenWidth, (data.thumb_picture.count +2) /3 *95 *ScreenRatio_6));
        }];
        [self.username_timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.detailLabel);
            make.top.mas_equalTo(self.imgCV.mas_bottom).offset(10 * ScreenRatio_6);
        }];
    }
}

#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.thumb_picture.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    News_Q_A_replyCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"News_Q_A_replyCollectionCell" forIndexPath:indexPath];
    [cell.imgIV setImageURL:[NSURL URLWithString:self.data.thumb_picture[indexPath.item]]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    News_Q_A_replyCollectionCell *cell = (News_Q_A_replyCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    MIPhotoBrowser *photoBrowser = [[MIPhotoBrowser alloc] init];
    photoBrowser.delegate = self;
    photoBrowser.sourceImagesContainerView = cell.contentView;
    photoBrowser.imageCount = self.data.picture.count;
    photoBrowser.currentImageIndex = indexPath.item;
    [photoBrowser show];
}

#pragma mark - photo browser
- (NSString *)photoBrowser:(MIPhotoBrowser *)photoBrowser URLImageForIndex:(NSInteger)index{
    return self.data.picture[index];
}

#pragma mark -
- (void)makeConstraints{
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 * ScreenRatio_6);

    }];
    [self.username_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.detailLabel);
        make.top.mas_equalTo(self.detailLabel.mas_bottom).offset(10 * ScreenRatio_6);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.bottom.left.mas_equalTo(self.contentView);
    }];
}

#pragma mark - get
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _detailLabel.textColor = KMainTextColor_3;
        _detailLabel.numberOfLines = 0;
    }
    return _detailLabel;
}
- (UILabel *)username_timeLabel{
    if (!_username_timeLabel) {
        _username_timeLabel = [UILabel new];
        _username_timeLabel.font = [UIFont systemFontOfSize:11 * ScreenRatio_6];
        _username_timeLabel.textColor = KMainTextColor_9;
    }
    return _username_timeLabel;
}
- (UICollectionView *)imgCV{
    if (!_imgCV) {
        UICollectionViewFlowLayout *l = [UICollectionViewFlowLayout new];
        l.itemSize = CGSizeMake(115 * ScreenRatio_6, 90 *ScreenRatio_6);
        l.minimumInteritemSpacing = 2 * ScreenRatio_6;
        l.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        l.sectionInset = UIEdgeInsetsMake(0, 10 * ScreenRatio_6, 0, 0);
        _imgCV = [[UICollectionView alloc]initWithFrame:CGRectNull collectionViewLayout:l];
        _imgCV.dataSource = self;
        _imgCV.delegate = self;
        _imgCV.backgroundColor = UIColorHex(ffffff);
        _imgCV.showsHorizontalScrollIndicator = false;
        _imgCV.scrollEnabled = false;
        [_imgCV registerClass:[News_Q_A_replyCollectionCell class] forCellWithReuseIdentifier:@"News_Q_A_replyCollectionCell"];
    }
    return _imgCV;
}
-(UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}
@end



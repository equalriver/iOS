//
//  WLKTCDMoreEvaluationCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/22.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDMoreEvaluationCell.h"

@interface CDMoreEvaluationCollectionCell: UICollectionViewCell
@property (strong, nonatomic) UIImageView *imgIV;
@end

@implementation CDMoreEvaluationCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imgIV];
        [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.centerX.centerY.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [UIImageView new];
        _imgIV.contentMode = UIViewContentModeScaleAspectFill;
        _imgIV.layer.masksToBounds = YES;
    }
    return _imgIV;
}
@end

/********************************************/
@interface WLKTCDMoreEvaluationCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UIView *sepView;
@property (strong, nonatomic) UIImageView *headerIV;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *scoreLabel;
@property (strong, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) UICollectionView *imageCV;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UIImageView *replyIV;
@property (strong, nonatomic) UILabel *replyNameLabel;
@property (strong, nonatomic) UILabel *replyDetailLabel;
@end

@implementation WLKTCDMoreEvaluationCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.sepView];
        [self.contentView addSubview:self.headerIV];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.scoreLabel];
        [self.contentView addSubview:self.detailLabel];
        [self.contentView addSubview:self.imageCV];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.replyIV];
        [self.replyIV addSubview:self.replyNameLabel];
        [self.replyIV addSubview:self.replyDetailLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.headerIV.image = nil;
    self.nameLabel.text = nil;
    self.scoreLabel.text = nil;
    self.detailLabel.text = nil;
    self.imageCV.hidden = YES;
    self.replyIV.hidden = YES;
    self.replyNameLabel.text = nil;
    self.replyDetailLabel.text = nil;
}

- (void)setData:(WLKTCDCommentData *)data{
    _data = data;
    [self.headerIV setImageURL:[NSURL URLWithString:data.headimg]];
    self.nameLabel.text = data.username;
    self.scoreLabel.text = [NSString stringWithFormat:@"效果:%@  师资:%@  环境:%@", data.effect, data.teacher, data.environment];
    self.detailLabel.text = data.content;
    self.timeLabel.text = data.create_time;
    if (data.reply.count) {
        self.replyIV.hidden = false;
        self.replyNameLabel.text = [NSString stringWithFormat:@"%@回复：", data.reply.firstObject.username];
        self.replyDetailLabel.text = data.reply.firstObject.content;
    }
   
    if (data.thumb_picture.count) {
        self.imageCV.hidden = false;
        [self.imageCV reloadData];
    }
}

#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.thumb_picture.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CDMoreEvaluationCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CDMoreEvaluationCollectionCell" forIndexPath:indexPath];
    [cell.imgIV setImageURL:[NSURL URLWithString:self.data.thumb_picture[indexPath.item]]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(didSelectedPhotoItem:type:index:)]) {
        [self.delegate didSelectedPhotoItem:indexPath type:LGShowImageTypeImageBroswer index:self.index];
    }
}



#pragma mark -
- (void)makeConstraints{
    [self.headerIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30 *ScreenRatio_6, 30 *ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(15 *ScreenRatio_6);
        make.top.mas_equalTo(self.sepView.mas_bottom).offset(10 *ScreenRatio_6);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headerIV.mas_right).offset(5);
        make.centerY.mas_equalTo(self.headerIV);
        make.right.mas_equalTo(self.scoreLabel.mas_left).offset(-5);
    }];
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(160 *ScreenRatio_6, 20 *ScreenRatio_6));
        make.right.mas_equalTo(self.contentView).offset(-10 *ScreenRatio_6);
        make.bottom.mas_equalTo(self.nameLabel);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel);
        make.right.mas_equalTo(self.scoreLabel);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(10 *ScreenRatio_6);
    }];
    [self.imageCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.detailLabel);
        make.top.mas_equalTo(self.detailLabel.mas_bottom).offset(10 *ScreenRatio_6);
        make.height.mas_equalTo(55 *ScreenRatio_6);
    }];
    [self.replyIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.detailLabel);
        make.bottom.mas_equalTo(self.contentView).offset(-15 *ScreenRatio_6);
    }];
    [self.replyNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.replyIV).offset(20 *ScreenRatio_6);
        make.left.mas_equalTo(self.replyIV).offset(15 *ScreenRatio_6);
        make.right.mas_equalTo(self.replyIV).offset(-15 *ScreenRatio_6);
    }];
    [self.replyDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.replyNameLabel);
        make.top.mas_equalTo(self.replyNameLabel.mas_bottom).offset(10 *ScreenRatio_6);
        make.bottom.mas_equalTo(self.replyIV).offset(-15 *ScreenRatio_6);
    }];
}

#pragma mark - get
- (UIView *)sepView{
    if (!_sepView) {
        _sepView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 10 *ScreenRatio_6)];
        _sepView.backgroundColor = kMainBackgroundColor;
    }
    return _sepView;
}
- (UIImageView *)headerIV{
    if (!_headerIV) {
        _headerIV = [UIImageView new];
        _headerIV.layer.masksToBounds = YES;
        _headerIV.layer.cornerRadius = 15 *ScreenRatio_6;
        _headerIV.contentMode = UIViewContentModeScaleAspectFill;
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
        _detailLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        _detailLabel.textColor = KMainTextColor_3;
        _detailLabel.numberOfLines = 0;
    }
    return _detailLabel;
}
- (UICollectionView *)imageCV{
    if (!_imageCV) {
        UICollectionViewFlowLayout *l = [UICollectionViewFlowLayout new];
        l.itemSize = CGSizeMake(72 *ScreenRatio_6, 54 *ScreenRatio_6);
        l.minimumLineSpacing = 5;
        l.minimumInteritemSpacing = 5;
        l.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _imageCV = [[UICollectionView alloc]initWithFrame:CGRectNull collectionViewLayout:l];
        _imageCV.backgroundColor = [UIColor whiteColor];
        _imageCV.dataSource = self;
        _imageCV.delegate = self;
        _imageCV.scrollEnabled = false;
        _imageCV.hidden = YES;
        [_imageCV registerClass:[CDMoreEvaluationCollectionCell class] forCellWithReuseIdentifier:@"CDMoreEvaluationCollectionCell"];
    }
    return _imageCV;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _timeLabel.textColor = KMainTextColor_9;
    }
    return _timeLabel;
}
- (UIImageView *)replyIV{
    if (!_replyIV) {
        _replyIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"气泡框"]];
        _replyIV.hidden = YES;
    }
    return _replyIV;
}
- (UILabel *)replyNameLabel{
    if (!_replyNameLabel) {
        _replyNameLabel = [UILabel new];
    }
    return _replyNameLabel;
}
- (UILabel *)replyDetailLabel{
    if (!_replyDetailLabel) {
        _replyDetailLabel = [UILabel new];
        _replyDetailLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        _replyDetailLabel.textColor = KMainTextColor_6;
        _replyDetailLabel.numberOfLines = 0;
    }
    return _replyDetailLabel;
}

@end

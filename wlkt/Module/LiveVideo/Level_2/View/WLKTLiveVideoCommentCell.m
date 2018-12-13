//
//  WLKTLiveVideoCommentCell.m
//  wlkt
//
//  Created by 尹平江 on 2018/5/15.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTLiveVideoCommentCell.h"
#import "CDZStarsControl.h"

@interface LiveVideoCommentCollectionCell: UICollectionViewCell
@property (strong, nonatomic) UIImageView *imgIV;
@end

@implementation LiveVideoCommentCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imgIV];
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
        _imgIV.layer.masksToBounds = YES;
    }
    return _imgIV;
}
@end
//////////////////////////////////////////////////////////////////
@interface WLKTLiveVideoCommentCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UIView *sepView;
@property (strong, nonatomic) UIImageView *iconIV;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *scroeTagLabel;
@property (strong, nonatomic) CDZStarsControl *stars;
@property (strong, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) UICollectionView *imgCV;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UIImageView *replyBg;
@property (strong, nonatomic) UILabel *replyNameLabel;
@property (strong, nonatomic) UILabel *replyDetailLabel;
@end

@implementation WLKTLiveVideoCommentCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.sepView];
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.scroeTagLabel];
        [self.contentView addSubview:self.stars];
        [self.contentView addSubview:self.detailLabel];
        [self.contentView addSubview:self.imgCV];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.replyBg];
        [self.replyBg addSubview:self.replyNameLabel];
        [self.replyBg addSubview:self.replyDetailLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.iconIV.image = nil;
    self.nameLabel.text = nil;
    self.detailLabel.text = nil;
    self.timeLabel.text = nil;
    self.replyNameLabel.text = nil;
    self.replyDetailLabel.text = nil;
}

#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LiveVideoCommentCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LiveVideoCommentCollectionCell" forIndexPath:indexPath];
//    cell.imgIV setImageURL:[NSURL URLWithString:<#(nonnull NSString *)#>]
    return cell;
}

#pragma mark -
- (void)makeConstraints{
    [self.sepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 10 *ScreenRatio_6));
        make.top.left.mas_equalTo(self.contentView);
    }];
    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30 *ScreenRatio_6, 30 *ScreenRatio_6));
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.top.mas_equalTo(self.sepView.mas_bottom).offset(10 *ScreenRatio_6);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.iconIV);
        make.left.mas_equalTo(self.iconIV.mas_right).offset(5);
        make.right.mas_equalTo(self.scroeTagLabel.mas_left).offset(-5);
    }];
    [self.stars mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(-10 *ScreenRatio_6);
        make.centerY.mas_equalTo(self.nameLabel);
        make.size.mas_equalTo(CGSizeMake(90 *ScreenRatio_6, 20 *ScreenRatio_6));
    }];
    [self.scroeTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.stars.mas_left).offset(-5);
        make.centerY.mas_equalTo(self.nameLabel);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(10 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView).offset(-20 *ScreenRatio_6);
    }];
    [self.imgCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.detailLabel.mas_bottom).offset(10 *ScreenRatio_6);
        make.left.right.mas_equalTo(self.detailLabel);
        make.height.mas_equalTo(80 *ScreenRatio_6);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.detailLabel);
        make.top.mas_equalTo(self.imgCV.mas_bottom).offset(10 *ScreenRatio_6);
    }];
    [self.replyBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.detailLabel);
        make.top.mas_equalTo(self.timeLabel.mas_bottom).offset(5);
        make.bottom.mas_equalTo(self.contentView).offset(-10 *ScreenRatio_6);
    }];
    [self.replyNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.replyBg).offset(10 *ScreenRatio_6);
        make.top.mas_equalTo(self.replyBg).offset(15 *ScreenRatio_6);
        make.right.mas_equalTo(self.replyBg).offset(-10 *ScreenRatio_6);
    }];
    [self.replyDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.replyNameLabel);
        make.top.mas_equalTo(self.replyNameLabel.mas_bottom).offset(10 *ScreenRatio_6);
        make.bottom.mas_equalTo(self.replyBg).offset(-10 *ScreenRatio_6);
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
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [UIImageView new];
        _iconIV.layer.cornerRadius = 15 *ScreenRatio_6;
        _iconIV.layer.masksToBounds = YES;
    }
    return _iconIV;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _nameLabel.textColor = KMainTextColor_6;
    }
    return _nameLabel;
}
- (UILabel *)scroeTagLabel{
    if (!_scroeTagLabel) {
        _scroeTagLabel = [UILabel new];
        _scroeTagLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _scroeTagLabel.textColor = KMainTextColor_6;
        _scroeTagLabel.text = @"评分";
    }
    return _scroeTagLabel;
}
- (CDZStarsControl *)stars{
    if (!_stars) {
        _stars = [CDZStarsControl.alloc initWithFrame:CGRectNull stars:5 starSize:CGSizeMake(10 *ScreenRatio_6, 10 *ScreenRatio_6) noramlStarImage:[UIImage imageNamed:@"评价white_star"] highlightedStarImage:[UIImage imageNamed:@"评价star"]];
        _stars.userInteractionEnabled = false;
        
    }
    return _stars;
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
- (UICollectionView *)imgCV{
    if (!_imgCV) {
        UICollectionViewFlowLayout *l = [UICollectionViewFlowLayout new];
        l.itemSize = CGSizeMake(100 *ScreenRatio_6, 75 *ScreenRatio_6);
        l.minimumLineSpacing = 5;
        l.minimumInteritemSpacing = 5;
        l.scrollDirection = UICollectionViewScrollDirectionVertical;
        _imgCV = [[UICollectionView alloc]initWithFrame:CGRectNull collectionViewLayout:l];
        _imgCV.dataSource = self;
        _imgCV.delegate = self;
        _imgCV.backgroundColor = [UIColor whiteColor];
        _imgCV.showsVerticalScrollIndicator = false;
        [_imgCV registerClass:[LiveVideoCommentCollectionCell class] forCellWithReuseIdentifier:@"LiveVideoCommentCollectionCell"];
    }
    return _imgCV;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _timeLabel.textColor = KMainTextColor_6;
    }
    return _timeLabel;
}
- (UIImageView *)replyBg{
    if (!_replyBg) {
        _replyBg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    }
    return _replyBg;
}
- (UILabel *)replyNameLabel{
    if (!_replyNameLabel) {
        _replyNameLabel = [UILabel new];
        _replyNameLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6 weight:UIFontWeightSemibold];
        _replyNameLabel.textColor = KMainTextColor_3;
    }
    return _replyNameLabel;
}
- (UILabel *)replyDetailLabel{
    if (!_replyDetailLabel) {
        _replyDetailLabel = [UILabel new];
        _replyDetailLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        _replyDetailLabel.textColor = KMainTextColor_3;
        _replyDetailLabel.numberOfLines = 0;
    }
    return _replyDetailLabel;
}

@end

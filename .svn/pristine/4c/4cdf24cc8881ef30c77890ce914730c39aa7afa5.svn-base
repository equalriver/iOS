//
//  WLKTCDOtherCourseCell.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/16.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDOtherCourseCell.h"

@interface CDOtherCourseCollectionCell: UICollectionViewCell
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong, nonatomic) YYLabel *titleLabel;
@property (strong, nonatomic) UILabel *priceLabel;

@property (strong, nonatomic) WLKTCDDataAboutlist *data;
@end

@implementation CDOtherCourseCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.imgIV];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.priceLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)setData:(WLKTCDDataAboutlist *)data{
    _data = data;
    [self.imgIV setImageURL:[NSURL URLWithString:data.img]];
    self.priceLabel.text = data.showprice;
    if (data.youhui.count) {
        [self setTitleTag:data.youhui];
    }
    else{
        self.titleLabel.text = data.coursename;
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(13 *data.coursename.length > 180 ? 40 *ScreenRatio_6 : 20 *ScreenRatio_6);
        }];
    }
}

- (void)setTitleTag:(NSArray *)data {
    
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    
    for (NSString *obj in data) {
        
        UILabel *l = [[UILabel alloc]init];
        l.textColor = kMainTextColor_red;
        l.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        l.textAlignment = NSTextAlignmentCenter;
        l.layer.masksToBounds = YES;
        l.layer.cornerRadius = 2;
        l.layer.borderColor = kMainTextColor_red.CGColor;
        l.layer.borderWidth = 0.5;
        l.text = obj;
//        [l sizeToFit];
        [l setSize:CGSizeMake(17 *ScreenRatio_6, 17 *ScreenRatio_6)];
        
        NSMutableAttributedString *attachment = [NSMutableAttributedString attachmentStringWithContent:l contentMode:UIViewContentModeBottom attachmentSize:l.size alignToFont:[UIFont systemFontOfSize:12 *ScreenRatio_6] alignment:YYTextVerticalAlignmentCenter];
        [text appendAttributedString:attachment];
        [text appendString:@" "];
    }
    NSMutableAttributedString *coursename = [[NSMutableAttributedString alloc]initWithString:self.data.coursename attributes:@{NSForegroundColorAttributeName: KMainTextColor_3, NSFontAttributeName: [UIFont systemFontOfSize:16 *ScreenRatio_6]}];
    [text appendAttributedString:coursename];

    self.titleLabel.attributedText = text;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(13 *text.length > 180 ? 40 *ScreenRatio_6 : 20 *ScreenRatio_6);
    }];
}


- (void)prepareForReuse{
    [super prepareForReuse];
    self.imgIV.image = nil;
    self.titleLabel.attributedText = nil;
    self.priceLabel.text = nil;
    self.titleLabel.text = nil;
}


- (void)makeConstraints{
    [self.imgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(180 *ScreenRatio_6, 120 *ScreenRatio_6));
        make.centerX.top.mas_equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.imgIV.mas_bottom).offset(10 *ScreenRatio_6);
        make.height.mas_equalTo(20 *ScreenRatio_6);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.mas_equalTo(self.contentView);
        make.height.mas_equalTo(25 *ScreenRatio_6);
        make.bottom.mas_equalTo(self.contentView).offset(-10 *ScreenRatio_6);
    }];
}

#pragma mark - get
- (UIImageView *)imgIV{
    if (!_imgIV) {
        _imgIV = [UIImageView new];
        _imgIV.contentMode = UIViewContentModeScaleAspectFill;
        _imgIV.layer.masksToBounds = YES;
    }
    return _imgIV;
}
- (YYLabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [YYLabel new];
        _titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        _titleLabel.textColor = KMainTextColor_3;
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        _priceLabel.textColor = kMainTextColor_red;
    }
    return _priceLabel;
}

@end

/**************************************************/

@interface WLKTCDOtherCourseCell()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *courseCV;
@end

@implementation WLKTCDOtherCourseCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.courseCV];
        [self.courseCV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.contentView);
            make.center.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setData:(WLKTCDData *)data{
    _data = data;
    if (data.aboutlist.count) {
        [self.courseCV reloadData];
    }
}

#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.aboutlist.count > 4 ? 4 : self.data.aboutlist.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CDOtherCourseCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CDOtherCourseCollectionCell" forIndexPath:indexPath];
    cell.data = self.data.aboutlist[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(didSelectedCourseItem:)]) {
        [self.delegate didSelectedCourseItem:indexPath.item];
    }
}

- (UICollectionView *)courseCV{
    if (!_courseCV) {
        UICollectionViewFlowLayout *l = [UICollectionViewFlowLayout new];
        l.itemSize = CGSizeMake(180 *ScreenRatio_6, 200 *ScreenRatio_6);
        l.sectionInset = UIEdgeInsetsMake(0, 5, 30 *ScreenRatio_6, 5);
        l.minimumLineSpacing = 2.5;
        l.minimumInteritemSpacing = 2.5;
        _courseCV = [[UICollectionView alloc]initWithFrame:CGRectNull collectionViewLayout:l];
        _courseCV.backgroundColor = [UIColor whiteColor];
        _courseCV.dataSource = self;
        _courseCV.delegate = self;
        _courseCV.scrollEnabled = false;
        [_courseCV registerClass:[CDOtherCourseCollectionCell class] forCellWithReuseIdentifier:@"CDOtherCourseCollectionCell"];
    }
    return _courseCV;
}

@end

//
//  WLKTHPFliterView.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/2.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTHPFilterView.h"

@interface HPFilterViewCollectionCell: UICollectionViewCell
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *tagIV;
@end

@implementation HPFilterViewCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.tagIV];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.centerX.centerY.mas_equalTo(self.contentView);
        }];
        [self.tagIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.titleLabel.text = nil;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _titleLabel.textColor = UIColorHex(666666);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.layer.masksToBounds = YES;
        _titleLabel.layer.cornerRadius = 3 *ScreenRatio_6;
        _titleLabel.layer.borderColor = KMainTextColor_9.CGColor;
        _titleLabel.layer.borderWidth = 0.5;
    }
    return _titleLabel;
}
- (UIImageView *)tagIV{
    if (!_tagIV) {
        _tagIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CourseList选中"]];
        _tagIV.hidden = YES;
    }
    return _tagIV;
}
@end

//*******************************************************************
@interface WLKTHPFilterView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UIView *tapView;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UIButton *resetBtn;
@property (strong, nonatomic) UIButton *confirmBtn;

@property (strong, nonatomic) NSMutableDictionary *conditionsDic;
@property (strong, nonatomic) WLKTClassifyData *data;
@property (copy, nonatomic) NSMutableArray<NSIndexPath *> *indexPathsArr;

@end

@implementation WLKTHPFilterView
- (instancetype)initWithFrame:(CGRect)frame data:(WLKTClassifyData *)data indexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
    self = [super initWithFrame:frame];
    if (self) {
        _data = data;
        _indexPathsArr = [NSMutableArray arrayWithArray:indexPaths];
        for (NSIndexPath *obj in _indexPathsArr) {
            self.conditionsDic[@(obj.section)] = obj;
        }
        
        self.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.5];
        [self addSubview:self.tapView];
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.collectionView];
        [self.contentView addSubview:self.resetBtn];
        [self.contentView addSubview:self.confirmBtn];
        
        [self.tapView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.mas_equalTo(self);
            make.width.mas_equalTo(70 *ScreenRatio_6);
        }];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(frame.size.width - 70 *ScreenRatio_6, frame.size.height - 50 *ScreenRatio_6));
            make.right.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.contentView).offset(15);
        }];
        [self.resetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake((frame.size.width - 70 *ScreenRatio_6) /2, 50 *ScreenRatio_6));
            make.left.bottom.mas_equalTo(self.contentView);
        }];
        [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake((frame.size.width - 70 *ScreenRatio_6) /2, 50 *ScreenRatio_6));
            make.right.bottom.mas_equalTo(self.contentView);
        }];
        [self contentViewAnimate];
    }
    return self;
}


#pragma mark - action
- (void)contentViewAnimate{
    [UIView animateWithDuration:0.3 animations:^{
        CGPoint center = self.contentView.center;
        center.x -= self.contentView.size.width;
        [self.contentView setCenter:center];
    }];
}

- (void)filterHandlerButtonAct:(UIButton *)sender{
    
    if (sender.tag == FilterViewHandleButtonTypeReset) {//reset
        [self.indexPathsArr removeAllObjects];
        [self.collectionView reloadData];
        [self.conditionsDic removeAllObjects];
        if ([self.delegate respondsToSelector:@selector(didClickFilterViewHandleButton:conditions:)]) {
            [self.delegate didClickFilterViewHandleButton:FilterViewHandleButtonTypeReset conditions:nil];
        }
    }
    
    if (sender.tag == FilterViewHandleButtonTypeConfirm) {//confirm
        
        if (!self.conditionsDic.count) {
            if ([self.delegate respondsToSelector:@selector(didClickFilterViewHandleButton:conditions:)]) {
                [self.delegate didClickFilterViewHandleButton:FilterViewHandleButtonTypeReset conditions:nil];
            }
            [self removeFromSuperview];
            return;
        }
        
        NSArray *keys = [self.conditionsDic keysSortedByValueUsingComparator:^NSComparisonResult(NSIndexPath   * _Nonnull obj1, NSIndexPath   * _Nonnull obj2) {
            return obj1.section > obj2.section;
        }];
        NSMutableArray *conditionsArr = [NSMutableArray arrayWithCapacity:3];
        for (int i = 0; i < keys.count; i++) {
            [conditionsArr addObject:self.conditionsDic[keys[i]]];
        }
        if ([self.delegate respondsToSelector:@selector(didClickFilterViewHandleButton:conditions:)]) {
            [self.delegate didClickFilterViewHandleButton:FilterViewHandleButtonTypeConfirm conditions:conditionsArr];
        }
        [self removeFromSuperview];
    }
    
}

#pragma mark - colleciton view
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.data.filter.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.filter[section].saleVo.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HPFilterViewCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HPFilterViewCollectionCell" forIndexPath:indexPath];
    cell.tagIV.hidden = YES;
    cell.titleLabel.layer.borderColor = KMainTextColor_9.CGColor;
    
    for (NSIndexPath *obj in self.conditionsDic.allValues) {
        if (indexPath == obj) {
            cell.tagIV.hidden = false;
            cell.titleLabel.layer.borderColor = kMainTextColor_red.CGColor;
        }
    }
    
    cell.titleLabel.text = self.data.filter[indexPath.section].saleVo[indexPath.item].title;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HPFilterViewCollectionHeadView" forIndexPath:indexPath];
        [v removeAllSubviews];
        UILabel *l = [UILabel new];
        l.font = [UIFont systemFontOfSize:15 * ScreenRatio_6 weight:UIFontWeightSemibold];
        l.textColor = KMainTextColor_3;
        [v addSubview:l];
        [l mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(v).offset(10 * ScreenRatio_6);
            make.height.centerY.mas_equalTo(v);
        }];
        ////////////
        l.text = self.data.filter[indexPath.section].name;
        
        reusableview = v;
    }
    return reusableview;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.conditionsDic containsObjectForKey:@(indexPath.section)]) {
        
        NSIndexPath *index = self.conditionsDic[@(indexPath.section)];
        if (index.item == indexPath.item) {
            [self.conditionsDic removeObjectForKey:@(indexPath.section)];
        }
        else{
            [self.conditionsDic setObject:indexPath forKey:@(indexPath.section)];
        }
        
    }
    else{
        [self.conditionsDic setObject:indexPath forKey:@(indexPath.section)];
    }

    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]];
}

#pragma mark - get
- (UIView *)tapView{
    if (!_tapView) {
        _tapView = [UIView new];
        _tapView.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            [self removeFromSuperview];
        }];
        [_tapView addGestureRecognizer:tap];
    }
    return _tapView;
}
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth - 70 *ScreenRatio_6, ScreenHeight -IphoneXBottomInsetHeight)];
        _contentView.backgroundColor = [UIColor whiteColor];

    }
    return _contentView;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *l = [UICollectionViewFlowLayout new];
        l.itemSize = CGSizeMake(80 *ScreenRatio_6, 30 *ScreenRatio_6);
        l.sectionInset = UIEdgeInsetsMake(10 *ScreenRatio_6, 12 *ScreenRatio_6, 15 *ScreenRatio_6, 15 *ScreenRatio_6);
//        l.minimumLineSpacing = 8 *ScreenRatio_6;
        l.scrollDirection = UICollectionViewScrollDirectionVertical;
        l.headerReferenceSize = CGSizeMake(ScreenWidth, 40 *ScreenRatio_6);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectNull collectionViewLayout:l];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = UIColorHex(ffffff);
        [_collectionView registerClass:[HPFilterViewCollectionCell class] forCellWithReuseIdentifier:@"HPFilterViewCollectionCell"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HPFilterViewCollectionHeadView"];
    }
    return _collectionView;
}
- (UIButton *)resetBtn{
    if (!_resetBtn) {
        _resetBtn = [UIButton new];
        [_resetBtn setTitle:@"重置" forState:UIControlStateNormal];
        _resetBtn.titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6 weight:UIFontWeightSemibold];
        [_resetBtn setTitleColor:KMainTextColor_3 forState:UIControlStateNormal];
        _resetBtn.tag = FilterViewHandleButtonTypeReset;
        [_resetBtn addTarget:self action:@selector(filterHandlerButtonAct:) forControlEvents:UIControlEventTouchUpInside];
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, (ScreenWidth - 50 *ScreenRatio_6) /2, 0.5)];
        v.backgroundColor = separatorView_color;
        [_resetBtn addSubview:v];
    }
    return _resetBtn;
}
- (UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton new];
        [_confirmBtn setTitle:@"完成" forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6 weight:UIFontWeightSemibold];
        [_confirmBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        _confirmBtn.tag = FilterViewHandleButtonTypeConfirm;
        _confirmBtn.backgroundColor = kMainTextColor_red;
        [_confirmBtn addTarget:self action:@selector(filterHandlerButtonAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}
- (NSMutableDictionary *)conditionsDic{
    if (!_conditionsDic) {
        _conditionsDic = [NSMutableDictionary dictionaryWithCapacity:3];
    }
    return _conditionsDic;
}
@end

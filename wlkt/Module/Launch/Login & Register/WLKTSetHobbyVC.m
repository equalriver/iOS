//
//  WLKTSetHobbyVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/16.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTSetHobbyVC.h"
#import "WLKTGetHobbyApi.h"
#import "WLKTLoginHobbyData.h"
#import "UIViewController+State.h"
#import "WLKTUserinfoChangeApi.h"
#import "WLKTLogin.h"

@interface WLKTSetHobbyLayout: UICollectionViewLayout
@property (strong, nonatomic) NSMutableArray<UICollectionViewLayoutAttributes *> *layoutAttributes;
@property (nonatomic) CGPoint center;
@property (nonatomic) CGFloat radius;
@property (nonatomic) NSInteger totalNum;
@property (strong, nonatomic) NSIndexPath *indexPath;
@end

@implementation WLKTSetHobbyLayout

- (void)prepareLayout{
    [super prepareLayout];
    // 初始化需要的数据
    self.totalNum = [self.collectionView numberOfItemsInSection:0];
    // 每次计算前需要清零
    [self.layoutAttributes removeAllObjects];
    self.center = CGPointMake(self.collectionView.size.width *0.5, self.collectionView.size.height *0.5);
    self.radius = MIN(self.collectionView.size.width, self.collectionView.size.height)/ 2.2;

    for (NSInteger i = 0; i < self.totalNum; i++) {
        self.indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:self.indexPath];
        att.size = CGSizeMake(60, 60);
        float x = self.center.x + cosf(2 * M_PI / self.totalNum * i) * (self.radius - 30);
        float y = self.center.y + sinf(2 * M_PI / self.totalNum * i) * (self.radius - 30);
        att.center = CGPointMake(x, y);
        [self.layoutAttributes addObject:att];
    }

}

// 因为返回的collectionViewContentSize使得collectionView不能滚动, 所以当旋转的时候才会触发, 故返回为true便于重新计算布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.layoutAttributes;
}

- (CGSize)collectionViewContentSize{
    return self.collectionView.frame.size;
}

#pragma mark -
- (NSMutableArray<UICollectionViewLayoutAttributes *> *)layoutAttributes{
    if (!_layoutAttributes) {
        _layoutAttributes = [NSMutableArray arrayWithCapacity:10];
    }
    return _layoutAttributes;
}
@end

///////////////////////////////////////////////////////////////////////
@interface WLKTSetHobbyCell: UICollectionViewCell
@property (strong, nonatomic) UILabel *titleLabel;
@property (nonatomic) BOOL isHobbySelected;
@end

@implementation WLKTSetHobbyCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60 *ScreenRatio_6, 60 *ScreenRatio_6));
            make.center.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.layer.cornerRadius = 30 *ScreenRatio_6;
        _titleLabel.layer.masksToBounds = YES;
        _titleLabel.layer.borderWidth = 0.5;
        _titleLabel.layer.borderColor = UIColorHex(33c4da).CGColor;
        _titleLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _titleLabel.textColor = KMainTextColor_3;
        _titleLabel.backgroundColor = UIColorHex(ffffff);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
@end

///////////////////////////////////////////////////////////////////////
@interface WLKTSetHobbyVC ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UIImageView *bgImageView;
@property (strong, nonatomic) UIButton *cancelBtn;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *bottomLabel;
@property (strong, nonatomic) UIButton *confirmBtn;

@property (strong, nonatomic) NSMutableArray<WLKTLoginHobbyData *> *dataArr;
@property (strong, nonatomic) NSMutableArray *hobby;
@property (copy, nonatomic) void(^handle)(void);
@end

@implementation WLKTSetHobbyVC
- (instancetype)initWithHandle:(void(^)(void))handle
{
    self = [super init];
    if (self) {
        _handle = handle;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setSubView{
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.cancelBtn];
//    [self.view addSubview:self.titleLabel];
//    [self.view addSubview:self.bottomLabel];
    [self.view addSubview:self.confirmBtn];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view.frame.size);
        make.center.mas_equalTo(self.view);
    }];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
        make.top.mas_equalTo(self.view).offset(20);
        make.right.mas_equalTo(self.view.mas_right);
    }];
//    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 50));
//        make.top.mas_equalTo(self.view).offset(30);
//        make.centerX.mas_equalTo(self.view);
//    }];
//    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 40));
//        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-50);
//        make.centerX.mas_equalTo(self.view);
//    }];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 40));
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
}

- (void)addNoLoginButton{
    UIButton *b = [[UIButton alloc]init];
    b.titleLabel.font = [UIFont systemFontOfSize:16];
    [b setTitle:@"返  回" forState:UIControlStateNormal];
    [b setTitleColor:KMainTextColor_9 forState:UIControlStateNormal];
    [b addTarget:self action:@selector(cancelBtnAct) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    [b mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.center.mas_equalTo(self.view);
    }];
}

- (void)loadData{
    WLKTGetHobbyApi *api = [[WLKTGetHobbyApi alloc]init];
    self.state = WLKTViewStateLoading;
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        self.state = WLKTViewStateNormal;
        if ([request.responseJSONObject[@"message"] isEqualToString:@"未登录"]) {
            [SVProgressHUD showInfoWithStatus:@"未登录"];
            [self addNoLoginButton];
            return;
        }
        NSArray *arr = [NSArray modelArrayWithClass:[WLKTLoginHobbyData class] json:request.responseJSONObject[@"result"][@"list"]];
        if (arr.count) {
            [self setSubView];
            [self.dataArr addObjectsFromArray:arr];
            [self.view addSubview:self.collectionView];
            [self.collectionView reloadData];
            
        }
    } failure:^(__kindof YTKBaseRequest *request) {
        self.state = WLKTViewStateError;
        WS(weakSelf);
        self.loadingBlock = ^{
            [weakSelf loadData];
        };
    }];
}

#pragma mark - action
- (void)cancelBtnAct{
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.handle) {
            self.handle();
        }
    }];
}

- (void)confirmBtnAct{
    if (!self.hobby.count) {
        [SVProgressHUD showInfoWithStatus:@"未选择兴趣分类"];
        return;
    }
    NSString *s = @"";
    for (int i = 0; i < self.hobby.count; i++) {
        if (i == self.hobby.count - 1) {
            s = [s stringByAppendingFormat:@"%@", self.hobby[i]];
        }
        else{
            s = [s stringByAppendingFormat:@"%@,", self.hobby[i]];
        }
        
    }
    
    WLKTUserinfoChangeApi *api = [[WLKTUserinfoChangeApi alloc]initWithUsername:TheCurUser.truename sex:TheCurUser.sex phone:TheCurUser.phone hobby:s];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSString *s = request.responseJSONObject[@"message"];
        if (s) {
            [SVProgressHUD showInfoWithStatus:s];
            sleep(1.5);
            [self dismissViewControllerAnimated:YES completion:^{
                if (self.handle) {
                    self.handle();
                }
            }];
        }
    } failure:^(__kindof YTKBaseRequest *request) {
        
    }];
}

#pragma mark - collection view
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WLKTSetHobbyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLabel.text = self.dataArr[indexPath.item].title;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    WLKTSetHobbyCell *cell = (WLKTSetHobbyCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.isHobbySelected = !cell.isHobbySelected;
    if (!cell.isHobbySelected) {
        cell.titleLabel.backgroundColor = UIColorHex(ffffff);
        [self.hobby removeObject:self.dataArr[indexPath.item].hid];
    }
    else{
        cell.titleLabel.backgroundColor = UIColorHex(33c4da);
        [self.hobby addObject:self.dataArr[indexPath.item].hid];
    }
}

#pragma mark - get
- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"interest_selecte_bg"]];
    }
    return _bgImageView;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        WLKTSetHobbyLayout *layout = [[WLKTSetHobbyLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 150 *ScreenRatio_6, ScreenWidth, 350 *ScreenRatio_6) collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[WLKTSetHobbyCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}
- (UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [UIButton new];
        [_cancelBtn setTitle:@"跳过" forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_cancelBtn setTitleColor:KMainTextColor_9 forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelBtnAct) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:22 weight:UIFontWeightHeavy];
        _titleLabel.textColor = KMainTextColor_3;
        _titleLabel.text = @"选择你感兴趣的分类?";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
- (UILabel *)bottomLabel{
    if (!_bottomLabel) {
        _bottomLabel = [UILabel new];
        _bottomLabel.font = [UIFont systemFontOfSize:12];
        _bottomLabel.textColor = KMainTextColor_9;
        _bottomLabel.text = @"选择你感兴趣的分类，让我们给你最精准的推荐";
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _bottomLabel;
}
- (UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton new];
        [_confirmBtn setTitle:@"完成" forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _confirmBtn.backgroundColor = separatorView_color;
        [_confirmBtn setTitleColor:KMainTextColor_9 forState:UIControlStateNormal];
        [_confirmBtn addTarget:self action:@selector(confirmBtnAct) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}
- (NSMutableArray<WLKTLoginHobbyData *> *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArr;
}
- (NSMutableArray *)hobby{
    if (!_hobby) {
        _hobby = [NSMutableArray arrayWithCapacity:10];
    }
    return _hobby;
}
@end

//
//  WLKTSchoolGoReportVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolCommentGoReportVC.h"
#import "PlaceholderTextView.h"
#import "WLKTSchoolCommentReportApi.h"
#import "WLKTSchoolReportTypeApi.h"

@protocol SchoolCommentReportTypeDelegate <NSObject>
- (void)didSelectedReportType:(UIButton *)sender;
@end

@interface SchoolCommentReportTypeCell: UICollectionViewCell
@property (strong, nonatomic) UIButton *typeBtn;
@property (assign) NSInteger index;
@property (weak, nonatomic) id<SchoolCommentReportTypeDelegate> delegate;
- (void)setCellData:(NSString *)data index:(NSInteger)index;
@end

@implementation SchoolCommentReportTypeCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.typeBtn];
        [self.typeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 25));
            make.centerY.mas_equalTo(self.contentView);
            make.left.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setCellData:(NSString *)data index:(NSInteger)index{
    self.index = index;
    self.typeBtn.tag = index;
    [self.typeBtn setTitle:[NSString stringWithFormat:@" %@", data] forState:UIControlStateNormal];
}

- (void)ReportTypeAct:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(didSelectedReportType:)]) {
        [self.delegate didSelectedReportType:sender];
    }
}

- (void)prepareForReuse{
    [super prepareForReuse];
    [self.typeBtn setTitle:nil forState:UIControlStateNormal];
    self.typeBtn.selected = false;
}

- (UIButton *)typeBtn{
    if (!_typeBtn) {
        _typeBtn = [UIButton new];
        _typeBtn.titleLabel.font = [UIFont systemFontOfSize:10 * ScreenRatio_6];
        _typeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_typeBtn setImage:[UIImage imageNamed:@"举报选中"] forState:UIControlStateSelected];
        [_typeBtn setImage:[UIImage imageNamed:@"举报未选中"] forState:UIControlStateNormal];
        [_typeBtn setTitleColor:KMainTextColor_3 forState:UIControlStateNormal];
        [_typeBtn addTarget:self action:@selector(ReportTypeAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _typeBtn;
}
@end

@interface SchoolCommentRequestModel: NSObject
@property (copy, nonatomic) NSString *message;
@property (copy, nonatomic) NSArray *result;
@end

@implementation SchoolCommentRequestModel
@end

@interface WLKTSchoolCommentGoReportVC ()<UICollectionViewDelegate, UICollectionViewDataSource, SchoolCommentReportTypeDelegate>
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UILabel *usernameLabel;
@property (strong, nonatomic) UILabel *commentLabel;
@property (strong, nonatomic) UIView *separatorView;
@property (strong, nonatomic) UILabel *reportFixLabel;
@property (strong, nonatomic) PlaceholderTextView *reportTV;
@property (strong, nonatomic) UILabel *reportTypeFixLabel;
@property (strong, nonatomic) UIButton *confirmBtn;
@property (strong, nonatomic) UICollectionView *typeCV;

@property (strong, nonatomic) WLKTSchoolNewsDetailComment *comment;
@property (strong, nonatomic) WLKTNewsDetailReplyList *newsComment;
@property (copy, nonatomic) NSString *reportType;
@property (copy, nonatomic) NSArray *dataArr;
@property (strong, nonatomic) NSMutableArray *typeBtnArr;
@property (copy, nonatomic) void(^success)(void);
@end

@implementation WLKTSchoolCommentGoReportVC
- (instancetype)initWithComment:(WLKTSchoolNewsDetailComment *)comment success:(void (^)(void))success
{
    self = [super init];
    if (self) {
        _comment = comment;
        _success = success;
        self.usernameLabel.text = comment.username;
        self.commentLabel.text = comment.content;
    }
    return self;
}

- (instancetype)initWithNewsComment:(WLKTNewsDetailReplyList *)comment success:(void (^)(void))success
{
    self = [super init];
    if (self) {
        _newsComment = comment;
        _success = success;
        self.usernameLabel.text = comment.username;
        self.commentLabel.text = comment.content;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我要举报";
    self.view.backgroundColor = separatorView_color;
    [self addViews];
    [self loadReportType];
}

- (void)addViews{
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.usernameLabel];
    [self.contentView addSubview:self.commentLabel];
    [self.contentView addSubview:self.separatorView];
    [self.contentView addSubview:self.reportFixLabel];
    [self.contentView addSubview:self.reportTV];
    [self.contentView addSubview:self.reportTypeFixLabel];
    [self.contentView addSubview:self.typeCV];
    [self.view addSubview:self.confirmBtn];
    [self makeConstraints];
}

#pragma mark - network
- (void)loadReportType{
    WLKTSchoolReportTypeApi *api = [[WLKTSchoolReportTypeApi alloc]init];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        SchoolCommentRequestModel *arr = [SchoolCommentRequestModel modelWithJSON:request.responseJSONObject];
        self.dataArr = [NSArray arrayWithArray:arr.result];
        [self.typeBtnArr addObjectsFromArray:arr.result];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.typeCV reloadData];
            [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(ScreenWidth, 200 + ((self.dataArr.count + 3) /4) * 27));
            }];
        });
        
    } failure:^(__kindof YTKBaseRequest *request) {
        ShowApiError
    }];
}

#pragma mark - action
- (void)confirmBtnAct{
    if (self.reportTV.text.length < 5) {
        [SVProgressHUD showInfoWithStatus:@"描述字数不够"];
        return;
    }
    if (!self.reportType) {
        [SVProgressHUD showInfoWithStatus:@"请选择举报类型"];
        return;
    }
    if (self.reportTV.text.length > 200) {
        [SVProgressHUD showInfoWithStatus:@"超过字数限制"];
        return;
    }
    if (self.comment) {
        WLKTSchoolCommentReportApi *api = [[WLKTSchoolCommentReportApi alloc]initWithCommentId:self.comment.cid content:self.reportTV.text type:self.reportType];
        [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            [SVProgressHUD showSuccessWithStatus:@"提交成功"];
            self.success();
            sleep(1.5);
            [self.navigationController popViewControllerAnimated:YES];
        } failure:^(__kindof YTKBaseRequest *request) {
            ShowApiError
        }];
    }
    else if (self.newsComment){
        WLKTSchoolCommentReportApi *api = [[WLKTSchoolCommentReportApi alloc]initWithCommentId:self.newsComment.cid content:self.reportTV.text type:self.reportType];
        [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            [SVProgressHUD showSuccessWithStatus:@"提交成功"];
            self.success();
            sleep(1.5);
            [self.navigationController popViewControllerAnimated:YES];
        } failure:^(__kindof YTKBaseRequest *request) {
            ShowApiError
        }];
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

#pragma mark - report type delegate
- (void)didSelectedReportType:(UIButton *)sender{
    for (UIButton *obj in self.typeBtnArr) {
        if (obj.tag == sender.tag) {
            obj.selected = YES;
        }
        else{
            obj.selected = false;
        }
    }
    self.reportType = self.dataArr[sender.tag];
}

#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SchoolCommentReportTypeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SchoolCommentReportTypeCell" forIndexPath:indexPath];
    cell.delegate = self;
    if (self.typeBtnArr.count == self.dataArr.count) {
        [self.typeBtnArr replaceObjectAtIndex:indexPath.item withObject:cell.typeBtn];
    }
    [cell setCellData:self.dataArr[indexPath.item] index:indexPath.item];
    return cell;
}

#pragma mark -
- (void)makeConstraints{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 290));
        make.top.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view);
    }];
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
    }];
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.usernameLabel.mas_bottom).offset(10 * ScreenRatio_6);
        make.left.mas_equalTo(self.contentView).offset(40);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 * ScreenRatio_6);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.commentLabel.mas_bottom).offset(10 * ScreenRatio_6);
    }];
    [self.reportFixLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView).offset(30);
    }];
    [self.reportTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(275 * ScreenRatio_6, 100));
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView).offset(15 * ScreenRatio_6);
    }];
    [self.reportTypeFixLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.reportFixLabel.mas_bottom).offset(100);
    }];
    [self.typeCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.reportTV);
        make.top.mas_equalTo(self.reportTypeFixLabel).offset(-5);
        make.right.mas_equalTo(self.view.mas_right).offset(-10 * ScreenRatio_6);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10 * ScreenRatio_6);
    }];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth - 20, 40));
        make.left.mas_equalTo(self.view).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.contentView.mas_bottom).offset(10 * ScreenRatio_6);
    }];
}

#pragma mark - get
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = UIColorHex(ffffff);
    }
    return _contentView;
}
- (UILabel *)usernameLabel{
    if (!_usernameLabel) {
        _usernameLabel = [UILabel new];
    }
    return _usernameLabel;
}
- (UILabel *)commentLabel{
    if (!_commentLabel) {
        _commentLabel = [UILabel new];
        _commentLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
        _commentLabel.textColor = KMainTextColor_3;
    }
    return _commentLabel;
}
- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}
- (UILabel *)reportFixLabel{
    if (!_reportFixLabel) {
        _reportFixLabel = [UILabel new];
        _reportFixLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
        _reportFixLabel.textColor = KMainTextColor_3;
        _reportFixLabel.text = @"举报描述： ";
    }
    return _reportFixLabel;
}
- (PlaceholderTextView *)reportTV{
    if (!_reportTV) {
        _reportTV = [[PlaceholderTextView alloc]initWithPlaceholderColor:KMainTextColor_9 font:11 * ScreenRatio_6];
        _reportTV.myPlaceholder = @"评论内容不符合？虚假信息？(5~200个字)";
        _reportTV.layer.borderColor = KMainTextColor_9.CGColor;
        _reportTV.layer.borderWidth = 0.5;
        _reportTV.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _reportTV.textColor = KMainTextColor_3;
    }
    return _reportTV;
}
- (UILabel *)reportTypeFixLabel{
    if (!_reportTypeFixLabel) {
        _reportTypeFixLabel = [UILabel new];
        NSString *s = @"举报类型：*";
        NSMutableAttributedString *ats = [[NSMutableAttributedString alloc]initWithString:s];
        [ats setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14 * ScreenRatio_6], NSForegroundColorAttributeName: KMainTextColor_3} range:NSMakeRange(0, 5)];
        [ats setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14 * ScreenRatio_6], NSForegroundColorAttributeName: kMainTextColor_red} range:NSMakeRange(5, 1)];
        _reportTypeFixLabel.attributedText = ats;
    }
    return _reportTypeFixLabel;
}
- (UICollectionView *)typeCV{
    if (!_typeCV) {
        UICollectionViewFlowLayout *l = [UICollectionViewFlowLayout new];
        l.itemSize = CGSizeMake(60, 25);
        l.minimumInteritemSpacing = 5 * ScreenRatio_6;
        l.minimumLineSpacing = 5 * ScreenRatio_6;
        l.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _typeCV = [[UICollectionView alloc]initWithFrame:CGRectNull collectionViewLayout:l];
        _typeCV.backgroundColor = [UIColor whiteColor];
        _typeCV.dataSource = self;
        _typeCV.delegate = self;
        _typeCV.scrollEnabled = false;
        [_typeCV registerClass:[SchoolCommentReportTypeCell class] forCellWithReuseIdentifier:@"SchoolCommentReportTypeCell"];
    }
    return _typeCV;
}
- (UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton new];
        [_confirmBtn setTitle:@"提交反馈" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        _confirmBtn.backgroundColor = UIColorHex(33c4da);
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:16 * ScreenRatio_6];
        _confirmBtn.layer.cornerRadius = 3;
        _confirmBtn.layer.masksToBounds = YES;
        [_confirmBtn addTarget:self action:@selector(confirmBtnAct) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}
- (NSMutableArray *)typeBtnArr{
    if (!_typeBtnArr) {
        _typeBtnArr = [NSMutableArray arrayWithCapacity:6];
    }
    return _typeBtnArr;
}
@end

//
//  WLKTLiveVideoSchoolVC.m
//  wlkt
//
//  Created by 尹平江 on 2018/5/14.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTLiveVideoSchoolVC.h"

@interface WLKTLiveVideoSchoolVC ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIButton *consultBtn;
@end

@implementation WLKTLiveVideoSchoolVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

#pragma mark -
- (void)setupUI{
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.consultBtn];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.consultBtn.mas_top);
    }];
    [self.consultBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 45 *ScreenRatio_6));
        make.bottom.centerX.mas_equalTo(self.view);
    }];
}

#pragma mark - table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 100 *ScreenRatio_6)];
    v.backgroundColor = [UIColor whiteColor];
    
    UIImageView *icon = [[UIImageView alloc]init];
    icon.layer.masksToBounds = YES;
    icon.layer.cornerRadius = 25 *ScreenRatio_6;
    [v addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(v);
        make.left.mas_equalTo(v).offset(15 *ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(50 *ScreenRatio_6, 50 *ScreenRatio_6));
    }];
    
    UIButton *attention = [UIButton new];
    attention.titleLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
    [attention setTitle:@"关注" forState:UIControlStateNormal];
    [attention setTitleColor:UIColorHex(f6c447) forState:UIControlStateNormal];
    attention.layer.masksToBounds = YES;
    attention.layer.cornerRadius = 12 *ScreenRatio_6;
    attention.layer.borderColor = UIColorHex(f6c447).CGColor;
    attention.layer.borderWidth = 0.5;
    [attention addTarget:self action:@selector(attentionBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    [v addSubview:attention];
    [attention mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60 *ScreenRatio_6, 30 *ScreenRatio_6));
        make.right.mas_equalTo(v).offset(-10 *ScreenRatio_6);
        make.centerY.mas_equalTo(v);
    }];
    
    UILabel *name = [UILabel new];
    name.font = [UIFont systemFontOfSize:16 *ScreenRatio_6 weight:UIFontWeightSemibold];
    name.textColor = KMainTextColor_3;
    [v addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(icon.mas_right).offset(10 *ScreenRatio_6);
        make.top.mas_equalTo(icon);
    }];
    
    UIImageView *tagIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    [v addSubview:tagIV];
    [tagIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(name.mas_right).offset(5);
        make.top.mas_equalTo(name);
    }];
    
    UILabel *room = [UILabel new];
    room.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
    room.textColor = KMainTextColor_9;
    [v addSubview:room];
    [room mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(name);
        make.top.mas_equalTo(name.mas_bottom).offset(5);
    }];
    
    UIView *sep = [UIView new];
    sep.backgroundColor = kMainBackgroundColor;
    [v addSubview:sep];
    [sep mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.centerX.bottom.mas_equalTo(v);
    }];
    
    return v;
}

#pragma mark - action
- (void)attentionBtnAct:(UIButton *)sender{
    
}

- (void)consultBtnAct:(UIButton *)sender{
    
}

#pragma mark - get
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectNull style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = kMainBackgroundColor;
    }
    return _tableView;
}
- (UIButton *)consultBtn{
    if (!_consultBtn) {
        _consultBtn = [UIButton new];
        _consultBtn.titleLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        [_consultBtn setTitleColor:KMainTextColor_6 forState:UIControlStateNormal];
        [_consultBtn setTitle:@"课程咨询" forState:UIControlStateNormal];
        [_consultBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_consultBtn addTarget:self action:@selector(consultBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _consultBtn;
}

@end

//
//  WLKTLiveVideoCourseVC.m
//  wlkt
//
//  Created by 尹平江 on 2018/5/14.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTLiveVideoCourseVC.h"
#import "WLKTLiveVideoCourseCell.h"

@interface WLKTLiveVideoCourseVC ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView *headView;
@property (strong, nonatomic) UIButton *appointmentBtn;
@property (strong, nonatomic) UILabel *bottomLabel;
@end

@implementation WLKTLiveVideoCourseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark -
- (void)setupUI{
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.appointmentBtn];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.left.top.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.appointmentBtn.mas_top);
    }];
    [self.appointmentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.left.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(45 *ScreenRatio_6);
    }];
}

- (void)setTableHeaderView{
    [self.headView removeAllSubviews];
    
    UILabel *name = [UILabel new];
    name.font = [UIFont systemFontOfSize:16 *ScreenRatio_6 weight:UIFontWeightSemibold];
    name.textColor = KMainTextColor_3;
    name.numberOfLines = 0;
    [self.headView addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headView).offset(20 *ScreenRatio_6);
        make.left.mas_equalTo(self.headView).offset(15 *ScreenRatio_6);
        make.right.mas_equalTo(self.headView).offset(-15 *ScreenRatio_6);
    }];
    
    UILabel *detail = [UILabel new];
    detail.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
    detail.textColor = KMainTextColor_9;
    detail.numberOfLines = 0;
    [self.headView addSubview:detail];
    [detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.mas_equalTo(name);
        make.top.mas_equalTo(name.mas_bottom).offset(15 *ScreenRatio_6);
    }];
    
    UILabel *content = [UILabel new];
    content.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
    content.textColor = KMainTextColor_9;
    content.numberOfLines = 0;
    [self.headView addSubview:content];
    content.hidden = YES;
    [content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.mas_equalTo(name);
        make.top.mas_equalTo(detail.mas_bottom).offset(15 *ScreenRatio_6);
    }];
    
    UIView *sep = [UIView new];
    sep.backgroundColor = kMainBackgroundColor;
    [self.headView addSubview:sep];
    [sep mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.bottom.mas_equalTo(self.headView);
        make.height.mas_equalTo(10 *ScreenRatio_6);
    }];
    
    UIButton *btn = [UIButton new];
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    [self.headView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.mas_equalTo(self.headView);
        make.bottom.mas_equalTo(sep.mas_top);
        make.height.mas_equalTo(40 *ScreenRatio_6);
    }];
    [btn addBlockForControlEvents:UIControlEventTouchUpInside block:^(UIButton *sender) {
        sender.selected = !sender.isSelected;
        content.hidden = !sender.selected;
        self.headView.height = sender.selected ? 0 : 0;///////////////////fix me
    }];
    
    
}

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80 *ScreenRatio_6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLKTLiveVideoCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLKTLiveVideoCourseCell"];
    if (cell == nil) {
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 80 *ScreenRatio_6)];
    v.backgroundColor = [UIColor whiteColor];
    
    UIView *sep_1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 5)];
    sep_1.backgroundColor = kMainBackgroundColor;
    [v addSubview:sep_1];
    
    UILabel *sec_1 = [UILabel new];
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc]initWithString:@""];
    [attStr addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14 *ScreenRatio_6], NSForegroundColorAttributeName: KMainTextColor_3} range:NSMakeRange(0, 0)];
    [attStr addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14 *ScreenRatio_6 weight:UIFontWeightSemibold], NSForegroundColorAttributeName: KMainTextColor_3} range:NSMakeRange(0, 0)];
    
    [v addSubview:sec_1];
    [sec_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(v).offset(15 *ScreenRatio_6);
        make.top.mas_equalTo(sep_1.mas_bottom).offset(15 *ScreenRatio_6);
        make.right.mas_equalTo(v).offset(-15 *ScreenRatio_6);
    }];
    
    UIView *sep_2 = [[UIView alloc]init];
    sep_2.backgroundColor = kMainBackgroundColor;
    [v addSubview:sep_2];
    [sep_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(v);
        make.top.mas_equalTo(sec_1.mas_bottom).offset(10 *ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
    }];
    
    return v;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark - action
- (void)appointmentBtnAct:(UIButton *)sender{
    
}

#pragma mark - get
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectNull style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = kMainBackgroundColor;
    }
    return _tableView;
}
- (UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 120 *ScreenRatio_6)];
        _headView.backgroundColor = [UIColor whiteColor];
    }
    return _headView;
}
- (UIButton *)appointmentBtn{
    if (!_appointmentBtn) {
        _appointmentBtn = [UIButton new];
        _appointmentBtn.titleLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        [_appointmentBtn setTitle:@"预约提醒" forState:UIControlStateNormal];
        [_appointmentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_appointmentBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _appointmentBtn.backgroundColor = UIColorHex(33c4da);
        [_appointmentBtn addTarget:self action:@selector(appointmentBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _appointmentBtn;
}
- (UILabel *)bottomLabel{
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
        _bottomLabel.backgroundColor = kMainBackgroundColor;
        _bottomLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _bottomLabel.textColor = KMainTextColor_6;
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
        _bottomLabel.text = @"我是有底线的～";
    }
    return _bottomLabel;
}

@end

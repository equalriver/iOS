//
//  WLKTActivityDetailPopoverVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/13.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityDetailPopoverVC.h"

@interface ActivityDetailPopoverCell: UITableViewCell
@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UILabel *titleLabel;
- (void)setCellDataWithImage:(NSString *)image title:(NSString *)title;

@end

@implementation ActivityDetailPopoverCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.titleLabel];
        [self makeConstraints];
    }
    return self;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.icon.image = nil;
    self.titleLabel.text = nil;
}

- (void)setCellDataWithImage:(NSString *)image title:(NSString *)title{
    self.icon.image = [UIImage imageNamed:image];
    self.titleLabel.text = title;
}

- (void)makeConstraints{
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.left.mas_equalTo(self.contentView).offset(10);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.icon.mas_right).offset(10);
        make.centerY.mas_equalTo(self.contentView);
    }];
}

- (UIImageView *)icon{
    if (!_icon) {
        _icon = [UIImageView new];
    }
    return _icon;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = KMainTextColor_3;
    }
    return _titleLabel;
}

@end

@interface WLKTActivityDetailPopoverVC () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) NSArray *images;
@end

@implementation WLKTActivityDetailPopoverVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ActivityDetailPopoverCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityDetailPopoverCell"];
    if (cell == nil) {
        cell = [[ActivityDetailPopoverCell alloc]init];
    }
    [cell setCellDataWithImage:self.images[indexPath.row] title:self.titles[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(popoverDidSelected:)]) {
        [self.delegate popoverDidSelected:indexPath.row];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

#pragma mark - get
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (NSArray *)titles{
    if (!_titles) {
        _titles = @[@"首页", @"报错", @"附近"];
    }
    return _titles;
}
- (NSArray *)images{
    if (!_images) {
        _images = @[@"首页", @"报错", @"附近"];
    }
    return _images;
}

@end


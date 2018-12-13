//
//  WLKTLiveVideoCommentVC.m
//  wlkt
//
//  Created by 尹平江 on 2018/5/14.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTLiveVideoCommentVC.h"
#import "WLKTLiveVideoCommentCell.h"
#import "CDZStarsControl.h"

@interface WLKTLiveVideoCommentVC ()

@end

@implementation WLKTLiveVideoCommentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[WLKTLiveVideoCommentCell class] forCellReuseIdentifier:@"WLKTLiveVideoCommentCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"WLKTLiveVideoCommentCell" cacheByIndexPath:indexPath configuration:^(WLKTLiveVideoCommentCell *cell) {
        
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WLKTLiveVideoCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLKTLiveVideoCommentCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    v.backgroundColor = [UIColor whiteColor];
    
    UILabel *tagLabel = [UILabel new];
    tagLabel.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
    tagLabel.textColor = KMainTextColor_6;
    tagLabel.text = @"评分";
    [v addSubview:tagLabel];
    [tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(v);
        make.left.mas_equalTo(v).offset(10 *ScreenRatio_6);
    }];
    
    CDZStarsControl *star = [CDZStarsControl.alloc initWithFrame:CGRectNull stars:5 starSize:CGSizeMake(10 *ScreenRatio_6, 10 *ScreenRatio_6) noramlStarImage:[UIImage imageNamed:@"评价white_star"] highlightedStarImage:[UIImage imageNamed:@"评价star"]];
    [v addSubview:star];
    [star mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(tagLabel.mas_right).offset(10 *ScreenRatio_6);
        make.centerY.mas_equalTo(v);
        make.size.mas_equalTo(CGSizeMake(90 *ScreenRatio_6, 20 *ScreenRatio_6));
    }];
    
    UILabel *scroe = [UILabel new];
    scroe.font = [UIFont systemFontOfSize:14 *ScreenRatio_6 weight:UIFontWeightSemibold];
    scroe.textColor = UIColorHex(33c4da);
    [v addSubview:scroe];
    [scroe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(star.mas_right).offset(10 *ScreenRatio_6);
        make.centerY.mas_equalTo(v);
    }];
    
    UILabel *count = [UILabel new];
    count.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
    count.textColor = KMainTextColor_6;
    [v addSubview:count];
    [count mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(v);
        make.right.mas_equalTo(v).offset(-10 *ScreenRatio_6);
    }];
    return v;
}


@end

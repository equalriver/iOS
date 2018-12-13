//
//  WLKTActivityPopupController.m
//  wlkt
//
//  Created by slovelys on 2017/7/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityPopupController.h"

#import "WLKTActivityConditionPickerView.h"

@interface WLKTActivityPopupController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) WLKTActivityConditionPickerView *pickerView;
@property (strong, nonatomic) NSMutableArray *primaryDataSource;
@property (strong, nonatomic) NSMutableArray *secondDataSource;
@property (copy, nonatomic) NSArray *secondConditionAry;

@end

@implementation WLKTActivityPopupController

- (instancetype)init {
    if (self = [super initWithContents:@[self.pickerView]]) {
        self.theme.popupContentInsets = UIEdgeInsetsZero;
        self.theme.maxPopupWidth = kScreenWidth;
        self.theme.popupStyle = CNPPopupStyleActionSheet;
//        self.theme.presentationStyle = CNPPopupPresentationStyleSlideInFromTop;
        
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.pickerView.primaryTableView) {
        return self.primaryDataSource.count;
    }
    return self.secondDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.pickerView.primaryTableView) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        cell.textLabel.text = self.primaryDataSource[indexPath.row];
        return cell;
    }
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
    cell.textLabel.text = self.secondDataSource[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.pickerView.primaryTableView) {
        [self.secondDataSource removeAllObjects];
        [self.secondDataSource addObjectsFromArray:self.secondConditionAry[indexPath.row]];
        [self.pickerView.secondTableView reloadData];
    }
}

#pragma mark - Setters & Getters

- (NSMutableArray *)primaryDataSource {
    if (!_primaryDataSource ) {
        _primaryDataSource = [@[@"时间范围", @"距离范围", @"价格显示"] mutableCopy];
    }
    return _primaryDataSource;
}

- (NSMutableArray *)secondDataSource {
    if (!_secondDataSource ) {
        _secondDataSource = [ @[@"全部时间", @"今天", @"明天", @"一周内", @"一个月内"] mutableCopy];
    }
    return _secondDataSource;
}

- (NSArray *)secondConditionAry {
    if (!_secondConditionAry) {
        _secondConditionAry = @[ @[@"全部时间", @"今天", @"明天", @"一周内", @"一个月内"],
                                 @[@"默认", @"离我最近"],
                                 @[@"全价位", @"收费", @"免费"] ];
    }
    return _secondConditionAry;
}

- (WLKTActivityConditionPickerView *)pickerView {
    if (!_pickerView) {
        _pickerView = [[[NSBundle mainBundle] loadNibNamed:@"WLKTActivityConditionPickerView" owner:nil options:nil] firstObject];
        _pickerView.primaryTableView.delegate = self;
        _pickerView.primaryTableView.dataSource = self;
        _pickerView.secondTableView.delegate = self;
        _pickerView.secondTableView.dataSource = self;
    }
    return _pickerView;
}


@end

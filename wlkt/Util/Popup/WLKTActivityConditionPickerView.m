//
//  WLKTActivityConditionPickerView.m
//  wlkt
//
//  Created by slovelys on 2017/7/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityConditionPickerView.h"

#import "WLKTActivityConditionPickerCell.h"

@interface WLKTActivityConditionPickerView ()

@property (strong, nonatomic) NSMutableArray *primaryDataSource;
@property (strong, nonatomic) NSMutableArray *secondDataSource;
@property (copy, nonatomic) NSArray *secondConditionAry;
@property (assign, nonatomic) NSInteger section;

@property (copy, nonatomic) NSString *time;
@property (copy, nonatomic) NSString *distance;
@property (copy, nonatomic) NSString *price;
@property (copy, nonatomic) NSString *state;

@end

@implementation WLKTActivityConditionPickerView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.height = 262;
    self.width = kScreenWidth;
    self.primaryTableView.delegate = self;
    self.primaryTableView.dataSource = self;
    self.secondTableView.delegate = self;
    self.secondTableView.dataSource = self;
    self.primaryTableView.tableFooterView = [UIView new];
    self.secondTableView.tableFooterView = [UIView new];
    
    self.secondTableView.backgroundColor = UIColorHex(f3f5f6);
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _primaryTableView) {
        return self.primaryDataSource.count;
    }
    return self.secondDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _primaryTableView) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        cell.textLabel.text = self.primaryDataSource[indexPath.row];
        cell.textLabel.textColor = [UIColor blackColor];
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if (indexPath.row == 0) {
                cell.textLabel.textColor = kNavBarBackgroundColor;
                cell.backgroundColor = UIColorHex(f3f5f6);
            }
        });
        return cell;
    }
    WLKTActivityConditionPickerCell *cell = [[NSBundle mainBundle] loadNibNamed:@"WLKTActivityConditionPickerCell" owner:nil options:nil].firstObject;
    cell.titleLabel.text = self.secondDataSource[indexPath.row];
    if ([self.time isEqualToString:self.secondDataSource[indexPath.row]]) {
        [_secondTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    if ([self.distance isEqualToString:self.secondDataSource[indexPath.row]]) {
        [_secondTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    if ([self.price isEqualToString:self.secondDataSource[indexPath.row]]) {
        [_secondTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    if ([self.state isEqualToString:self.secondDataSource[indexPath.row]]) {
        [_secondTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _primaryTableView) {
        [self.primaryTableView reloadData];
        [self.secondDataSource removeAllObjects];
        [self.secondDataSource addObjectsFromArray:self.secondConditionAry[indexPath.row]];
        [self.secondTableView reloadData];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.textLabel.textColor = kNavBarBackgroundColor;
        cell.backgroundColor = UIColorHex(f3f5f6);
        _section = indexPath.row;
    }
    if (tableView == _secondTableView) {
        [self.secondTableView reloadData];
        WLKTActivityConditionPickerCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        cell.selectedImage.image = [UIImage imageNamed:@"condition_selected"];
//        [cell.selectedImage setHighlightedImage:[UIImage imageNamed:@"condition_selected"]];
        
        switch (_section) {
            case 0:
                self.time = self.secondDataSource[indexPath.row];
                break;
            case 1:
                self.distance = self.secondDataSource[indexPath.row];
                break;
            case 2:
                self.price = self.secondDataSource[indexPath.row];
                break;
            case 3:
                self.state = self.secondDataSource[indexPath.row];
                break;
                
            default:
                break;
        }
        cell.selected = YES;
        cell.selectedImage.highlighted = YES;
        [self.secondTableView reloadData];
        if ([self.delegate respondsToSelector:@selector(activityConditionPickerViewDidSelectedAtIndex:condition:)]) {
            [self.delegate activityConditionPickerViewDidSelectedAtIndex:_section condition:self.secondDataSource[indexPath.row]];
        }
    }
}

#pragma mark - Setters & Getters

- (NSMutableArray *)primaryDataSource {
    if (!_primaryDataSource ) {
        _primaryDataSource = [@[@"时间范围", @"距离范围", @"价格显示", @"活动状态"] mutableCopy];
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
        _secondConditionAry = @[
                                 @[@"全部时间", @"今天", @"明天", @"一周内", @"一个月内"],
                                 @[@"默认", @"离我最近"],
                                 @[@"全价位", @"收费", @"免费"],
                                 @[@"进行中", @"即将开始", @"已结束"]
                                ];
    }
    return _secondConditionAry;
}

@end

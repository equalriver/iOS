//
//  WLKTUserSettingVC.m
//  wlkt
//
//  Created by 尹平江 on 2017/8/10.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUserSettingVC.h"
#import "WLKTLoginCoordinator.h"
#import "WLKTLogin.h"
#import "WLKTSetting.h"
#import <SCLAlertView.h>
#import "WLKTLoginOutAlertView.h"
#import "WLKTPasswordChangeVC.h"
#import "WLKTLoginLogTVC.h"
#import "WLKTUserSNSBinding.h"

@interface WLKTUserSettingVC ()<UITableViewDelegate,UITableViewDataSource, WLKTLoginCoordinatorDelegate>
@property (strong, nonatomic) UITableView *settingTableView;
@property (strong, nonatomic) SCLAlertView *successAlertView;
@property (strong, nonatomic) WLKTLoginOutAlertView *loginOutAlertView;

@property (strong, nonatomic) NSArray *dataArr;
@property (strong, nonatomic) NSMutableArray *childCoordinator;
@property (copy, nonatomic) void (^loginBlock)(void);

@end

@implementation WLKTUserSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self.view addSubview:self.settingTableView];

}

#pragma mark - tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 4) {
        //退出登录
        UITableViewCell *quitCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"quitCell"];
        if (!TheCurUser.username) {
            quitCell.textLabel.text = self.dataArr[indexPath.section];
        } else {
            quitCell.textLabel.text = @"安全退出";
        }
        quitCell.textLabel.textColor = kMainTextColor_red;
        quitCell.textLabel.textAlignment = NSTextAlignmentCenter;
        quitCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return quitCell;
    }
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArr[indexPath.section];
    //passwordChange
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"修改密码"];
    }
    //loginLog
    if (indexPath.section == 1) {
        cell.imageView.image = [UIImage imageNamed:@"登录日志"];
    }
    //binding
    if (indexPath.section == 2) {
        
    }
    //cache
    if (indexPath.section == 3) {
        cell.detailTextLabel.text = [WLKTSetting cacheCostString];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.textColor = userLabelColor;
    cell.textLabel.font = [UIFont systemFontOfSize:15 * ScreenRatio_6];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 15.0 * ScreenRatio_6;
    }
    if (section == 1 || section == 2 || section == 3){
        return 10.0 * ScreenRatio_6;
    }
    if (section == 4){
        return 20.0 * ScreenRatio_6;
    }
    return 0.0f * ScreenRatio_6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0f * ScreenRatio_6;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 15 * ScreenRatio_6)];
    v1.backgroundColor = fillViewColor;
    v1.layer.borderWidth = 0.5;
    v1.layer.borderColor = [[UIColor alloc]initWithWhite:230/255.0 alpha:1.0].CGColor;
    if (section == 0) {
        return v1;
    }
    
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 10 * ScreenRatio_6)];
    v.backgroundColor = fillViewColor;
    v.layer.borderWidth = 0.5;
    v.layer.borderColor = [[UIColor alloc]initWithWhite:230/255.0 alpha:1.0].CGColor;
    if (section == 1 || section == 2 || section == 3) {
        return v;
    }
    UIView *v2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 20 * ScreenRatio_6)];
    v1.backgroundColor = fillViewColor;
    v1.layer.borderWidth = 0.5;
    v1.layer.borderColor = [[UIColor alloc]initWithWhite:230/255.0 alpha:1.0].CGColor;
    if (section == 4) {
        return v2;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WS(weakSelf);
    if (!TheCurUser && (indexPath.section == 0 || indexPath.section == 1 || indexPath.section == 2)) {
        [self loginWithComepletion:^{
            [weakSelf.navigationController dismissViewControllerAnimated:YES completion:nil];
            [weakSelf.settingTableView reloadData];
        }];
        return;
    }
    if (indexPath.section == 0) {//passwordChange
        WLKTPasswordChangeVC *psdVC = [[WLKTPasswordChangeVC alloc]init];
        [self.navigationController pushViewController:psdVC animated:YES];
    }
    if (indexPath.section == 1) {//loginLog
        WLKTLoginLogTVC *LoginLogTVC = [[WLKTLoginLogTVC alloc]init];
        [self.navigationController pushViewController:LoginLogTVC animated:YES];
    }
    if (indexPath.section == 2) {//binding
        WLKTUserSNSBinding *vc = [[WLKTUserSNSBinding alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 3) {//cache
        [WLKTSetting clearCacheWithCompletion:^{
            [weakSelf.settingTableView reloadData];
        }];
    }
    if (indexPath.section == 4) {
        //quitCell
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if ([cell.textLabel.text isEqualToString:@"登录"]) {
            [self loginWithComepletion:^{
                [weakSelf.navigationController dismissViewControllerAnimated:YES completion:nil];
                [weakSelf.settingTableView reloadData];
            }];
        } else {
            [self loginOutAct];
        }
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44 *ScreenRatio_6;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - alert

- (void)discardLoginOutAct{
    [self.successAlertView hideView];
    
}
- (void)loginOutAct{
    if (_successAlertView) {
        [_successAlertView hideView];
        _successAlertView = nil;
        _loginOutAlertView = nil;
    }
    self.successAlertView = [[SCLAlertView alloc]init];
    [self.loginOutAlertView.commitChangeBtn addTarget:self action:@selector(didLoginOutAct:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginOutAlertView.discardBtn addTarget:self action:@selector(discardLoginOutAct) forControlEvents:UIControlEventTouchUpInside];
    [self setSuccessCheckView:self.successAlertView withCheckView:self.loginOutAlertView];
    
}
- (void)didLoginOutAct:(UIButton *)sender{
    WS(weakSelf);
    [WLKTLogin logoutWithCompletion:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.successAlertView hideView];
            [weakSelf.settingTableView reloadData];
        });
    }];
}

- (void)setSuccessCheckView:(SCLAlertView *)alertView withCheckView:(WLKTLoginOutAlertView *)checkView{
    checkView.iconIV.image = [UIImage imageNamed:@"blueWaring"];
    [alertView removeTopCircle];
    [alertView addCustomView:checkView];
    alertView.cornerRadius = 15;
    alertView.showAnimationType = SCLAlertViewShowAnimationSlideInToCenter;
    alertView.backgroundViewColor = [UIColor whiteColor];
    alertView.backgroundType = SCLAlertViewBackgroundShadow;
    [alertView showCustom:self image:nil color:nil title:nil subTitle:nil closeButtonTitle:nil duration:0];
}

#pragma mark - LSGLoginCoordinatorDelegate
- (void)loginCoordinatorDidFinishLogin:(WLKTLoginCoordinator *)loginCoordinator {
    if (_loginBlock) {
        _loginBlock();
    }
    
    [_childCoordinator removeObject:loginCoordinator];
}

- (void)loginCoordinatorDidFinishLogin:(WLKTLoginCoordinator *)coordinator handler:(void (^)(UIViewController *))handler{
    if (_loginBlock) {
        _loginBlock();
        handler(self);
    }
    
    [_childCoordinator removeObject:coordinator];
}

- (void)loginCoordinatorDidRequestDismissal:(WLKTLoginCoordinator *)loginCoordinator {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        [self.childCoordinator removeObject:loginCoordinator];
    }];
}

- (void)loginWithComepletion:(void (^)(void))completion {
    WLKTLoginCoordinator *cr = [WLKTLoginCoordinator new];
    cr.delegate = self;
    [self.childCoordinator addObject:cr];
    self.loginBlock = completion;
    [self.navigationController presentViewController:cr.navigationController animated:YES completion:nil];
}

#pragma mark - get
- (UITableView *)settingTableView{
    if (!_settingTableView) {
        _settingTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _settingTableView.backgroundColor = fillViewColor;
        _settingTableView.scrollEnabled = NO;
        _settingTableView.separatorColor = [UIColor lightGrayColor];
        _settingTableView.tableFooterView = [[UIView alloc] init];
        [_settingTableView setSeparatorColor:[[UIColor alloc]initWithWhite:230/255.0 alpha:1.0]];
        _settingTableView.dataSource = self;
        _settingTableView.delegate = self;
    }
    return _settingTableView;
}
- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@"修改密码", @"登录日志", @"绑定账号", @"清理本地缓存", @"登录"];
    }
    return _dataArr;
}
- (NSMutableArray *)childCoordinator {
    if (!_childCoordinator) {
        _childCoordinator = [NSMutableArray array];
    }
    return _childCoordinator;
}
- (WLKTLoginOutAlertView *)loginOutAlertView{
    if (!_loginOutAlertView) {
        _loginOutAlertView = [[WLKTLoginOutAlertView alloc]initWithFrame:CGRectMake(0, 0, 240, 110)];
    }
    return _loginOutAlertView;
}

@end

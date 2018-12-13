//
//  WLKTUserSNSBinding.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/28.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUserSNSBinding.h"
#import "WLKTSNSBindingApi.h"
#import "WLKTSNSBindingCancelApi.h"
#import "WLKTUserSNSBindingData.h"
#import "WLKTLogin.h"
#import "WLKTSNSLoginApi.h"
#import "AppDelegate.h"

@interface WLKTUserSNSBindingCell: UITableViewCell
@property (strong, nonatomic) UIImageView *iconIV;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *usernameLabel;
@property (strong, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) UIImageView *arrowIV;
@property (strong, nonatomic) UIView *separatorView;
- (void)setCellTitle:(NSString *)title username:(NSString *)username detail:(NSString *)detail image:(NSString *)image;
@end

@implementation WLKTUserSNSBindingCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColorHex(ffffff);
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.usernameLabel];
        [self.contentView addSubview:self.detailLabel];
        [self.contentView addSubview:self.arrowIV];
        [self.contentView addSubview:self.separatorView];
        [self makeConstraints];
    }
    return self;
}

- (void)setCellTitle:(NSString *)title username:(NSString *)username detail:(NSString *)detail image:(NSString *)image{
    self.iconIV.image = [UIImage imageNamed:image];
    self.titleLabel.text = title;
    self.detailLabel.text = detail;
    if (username.length > 0) {
        self.usernameLabel.text = [NSString stringWithFormat:@"(%@)", username];
    }
}

- (void)makeConstraints{
    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.left.mas_equalTo(self.contentView).offset(15);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconIV.mas_right).offset(10);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).offset(5);
        make.centerY.mas_equalTo(self.titleLabel);
    }];
    [self.arrowIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.arrowIV.mas_left).offset(-10);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 0.5));
        make.left.bottom.mas_equalTo(self.contentView);
    }];
}

#pragma mark - get
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc]init];
    }
    return _iconIV;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = KMainTextColor_3;
    }
    return _titleLabel;
}
- (UILabel *)usernameLabel{
    if (!_usernameLabel) {
        _usernameLabel = [UILabel new];
        _usernameLabel.font = [UIFont systemFontOfSize:13];
        _usernameLabel.textColor = KMainTextColor_9;
    }
    return _usernameLabel;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.textColor = KMainTextColor_9;
    }
    return _detailLabel;
}
- (UIImageView *)arrowIV{
    if (!_arrowIV) {
        _arrowIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"进入-拷贝"]];
    }
    return _arrowIV;
}
- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}
@end

@interface WLKTUserSNSBinding ()
@property (copy, nonatomic) NSArray *imageArr;
@property (copy, nonatomic) NSArray *titleArr;
@property (strong, nonatomic) NSMutableArray *usernameArr;
@property (strong, nonatomic) NSMutableArray *detailArr;
@end

@implementation WLKTUserSNSBinding

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绑定设置";
    self.view.backgroundColor = fillViewColor;
    self.tableView.bounces = false;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self requestBinding];
}

- (void)setUsername:(NSString *)name binding:(NSString *)binding index:(NSInteger)index{
    [self.usernameArr replaceObjectAtIndex:index withObject:name];
    [self.detailArr replaceObjectAtIndex:index withObject:binding];
}

#pragma mark - network
- (void)requestBinding{
    WLKTSNSBindingApi *api = [[WLKTSNSBindingApi alloc]init];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        WLKTUserSNSBindingData *data = [WLKTUserSNSBindingData modelWithJSON:request.responseJSONObject[@"result"]];
        if (data.qqname.length > 0) {
            [self setUsername:data.qqname binding:@"已绑定" index:0];
        }
        else{
            [self setUsername:@"" binding:@"未绑定" index:0];
        }
        
        if (data.weixinname.length > 0) {
            [self setUsername:data.weixinname binding:@"已绑定" index:1];
        }
        else{
            [self setUsername:@"" binding:@"未绑定" index:1];
        }
        
        if (data.sinaname.length > 0) {
            [self setUsername:data.sinaname binding:@"已绑定" index:2];
        }
        else{
            [self setUsername:@"" binding:@"未绑定" index:2];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(__kindof YTKBaseRequest *request) {
        ShowApiError
    }];
}

#pragma mark - noti
- (void)thirdPlatformAuthoNoti{
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WLKTUserSNSBindingCell *cell = [[WLKTUserSNSBindingCell alloc]init];
    [cell setCellTitle:self.titleArr[indexPath.row] username:self.usernameArr[indexPath.row] detail:self.detailArr[indexPath.row] image:self.imageArr[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *type = @"";
    SSDKPlatformType shareType = 0;
    switch (indexPath.row) {
        case 0:
            type = @"qq";
            shareType = SSDKPlatformTypeQQ;
            break;
        case 1:
            type = @"weixin";
            shareType = SSDKPlatformTypeWechat;
            break;
        case 2:
            type = @"sina";
            shareType = SSDKPlatformTypeSinaWeibo;
            break;
        default:
            break;
    }
    WLKTUserSNSBindingCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell.detailLabel.text isEqualToString:@"未绑定"]) {
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isSNSPush"];
        
        if (shareType == SSDKPlatformTypeSinaWeibo) {
            WBAuthorizeRequest *request = [WBAuthorizeRequest request];
            request.redirectURI = @"http://sns.whalecloud.com/sina2/callback";
            [WeiboSDK sendRequest:request];
            AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
            del.weiboAuthoHandler = ^(NSDictionary *dic) {
                if (![dic valueForKey:@"screen_name"]) {
                    return;
                }
                [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"isSNSPush"];
                
                WLKTSNSLoginApi *api = [[WLKTSNSLoginApi alloc]initWithType:type snsuserid:[dic valueForKey:@"idstr"] name:[dic valueForKey:@"screen_name"] head:[dic valueForKey:@"avatar_hd"]];
                [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
                    NSString *errorCode = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"errorCode"]];
                    if ([errorCode isEqualToString:@"0"]) {//绑定成功
                        [SVProgressHUD showSuccessWithStatus:@"绑定成功"];
                        [self setUsername:[dic valueForKey:@"screen_name"] binding:@"已绑定" index:indexPath.row];
                        [self.tableView reloadData];
                    }
                    
                } failure:^(__kindof YTKBaseRequest *request) {
                    ShowApiError
                }];
            };
        }
        else{
            [ShareSDK authorize:shareType settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                if (error) {
                    if ([error.localizedDescription containsString:@"202"]) {
                        [SVProgressHUD showInfoWithStatus:@"未安装应用"];
                        return;
                    }
                    [SVProgressHUD showErrorWithStatus:error.localizedDescription];
                } else {
                    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"isSNSPush"];
                    if (!user.nickname) {
                        return;
                    }
                    WLKTSNSLoginApi *api = [[WLKTSNSLoginApi alloc]initWithType:type snsuserid:user.uid name:user.nickname head:user.icon];
                    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
                        NSString *errorCode = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"errorCode"]];
                        if ([errorCode isEqualToString:@"0"]) {//绑定成功
                            [SVProgressHUD showSuccessWithStatus:@"绑定成功"];
                            [self setUsername:user.nickname binding:@"已绑定" index:indexPath.row];
                            [self.tableView reloadData];
                        }
                        
                    } failure:^(__kindof YTKBaseRequest *request) {
                        ShowApiError
                    }];
                }
            }];
        }
        

//        [[UMSocialManager defaultManager] getUserInfoWithPlatform:shareType currentViewController:nil completion:^(id result, NSError *error) {
//            if (error) {
//                [SVProgressHUD showErrorWithStatus:error.localizedDescription];
//            } else {
//                UMSocialUserInfoResponse *resp = result;
//                NSString *uid = [type isEqualToString:@"qq"] ? resp.unionId : resp.uid;
//                WLKTSNSLoginApi *api = [[WLKTSNSLoginApi alloc]initWithType:type snsuserid:uid name:resp.name head:resp.iconurl];
//                [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
//                    NSString *errorCode = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"errorCode"]];
//                    if ([errorCode isEqualToString:@"0"]) {//绑定成功
//                        [SVProgressHUD showSuccessWithStatus:@"绑定成功"];
//                        [self setUsername:resp.name binding:@"已绑定" index:indexPath.row];
//                        [self.tableView reloadData];
//                    }
//
//                } failure:^(__kindof YTKBaseRequest *request) {
//                    ShowApiError
//                }];
//            }
//        }];
    }
    else{
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"确定解除绑定吗？" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *act = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            WLKTSNSBindingCancelApi *api = [[WLKTSNSBindingCancelApi alloc]initWithType:type];
            [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
                [SVProgressHUD showSuccessWithStatus:@"解除绑定成功"];
                [self setUsername:@"" binding:@"未绑定" index:indexPath.row];
                [self.tableView reloadData];
            } failure:^(__kindof YTKBaseRequest *request) {
                ShowApiError
            }];
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:nil];
        [ac addAction:act];
        [ac addAction:cancel];
        [self presentViewController:ac animated:YES completion:nil];
    }
}

#pragma mark - get
- (NSArray *)imageArr{
    if (!_imageArr) {
        _imageArr = @[@"课程详情QQ", @"课程详情微信", @"课程详情新浪"];
    }
    return _imageArr;
}
- (NSArray *)titleArr{
    if (!_titleArr) {
        _titleArr = @[@"QQ", @"微信", @"微博"];
    }
    return _titleArr;
}
- (NSMutableArray *)usernameArr{
    if (!_usernameArr) {
        _usernameArr = [NSMutableArray arrayWithArray:@[@"", @"", @""]];
    }
    return _usernameArr;
}
- (NSMutableArray *)detailArr{
    if (!_detailArr) {
        _detailArr = [NSMutableArray arrayWithArray:@[@"未绑定", @"未绑定", @"未绑定"]];
    }
    return _detailArr;
}
@end

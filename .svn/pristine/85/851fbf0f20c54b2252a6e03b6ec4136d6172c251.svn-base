//
//  WLKTUserAboutVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUserAboutVC.h"

@interface WLKTUserAboutVC ()
@property (strong, nonatomic) UIImageView *logoIV;
@property (strong, nonatomic) UILabel *versionLabel;
@property (strong, nonatomic) UILabel *bottomCRLabel;
@property (strong, nonatomic) UILabel *hotlineLabel;
@property (strong, nonatomic) UILabel *hotlineLabel_2;
@end

@implementation WLKTUserAboutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.logoIV];
    [self.view addSubview:self.versionLabel];
    [self.view addSubview:self.bottomCRLabel];
    [self.view addSubview:self.hotlineLabel];
    [self.view addSubview:self.hotlineLabel_2];
    [self makeConstraints];
    
}

- (void)hotlineAct{
    NSString* str = [NSString stringWithFormat:@"telprompt://%@", @"4000283996"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

- (void)hotline_2_Act{
    NSString* str = [NSString stringWithFormat:@"telprompt://%@", @"02866286868"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

- (void)makeConstraints{
    [self.logoIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(190 * ScreenRatio_6);
    }];
    [self.versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 20));
        make.left.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-70 *ScreenRatio_6);
    }];
    [self.bottomCRLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 15));
        make.top.mas_equalTo(self.versionLabel.mas_bottom).offset(10 *ScreenRatio_6);
        make.left.mas_equalTo(self.view);
    }];
    [self.hotlineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomCRLabel.mas_bottom).offset(10 *ScreenRatio_6);
        make.left.mas_equalTo(self.view).offset(20 *ScreenRatio_6);
    }];
    [self.hotlineLabel_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomCRLabel.mas_bottom).offset(10 *ScreenRatio_6);
        make.left.mas_equalTo(self.hotlineLabel.mas_right).offset(20 *ScreenRatio_6);
    }];
}

#pragma mark - get
- (UIImageView *)logoIV{
    if (!_logoIV) {
        _logoIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    }
    return _logoIV;
}
- (UILabel *)versionLabel{
    if (!_versionLabel) {
        _versionLabel = [UILabel new];
        _versionLabel.font = [UIFont systemFontOfSize:15 *ScreenRatio_6 weight:UIFontWeightSemibold];
        _versionLabel.textColor = KMainTextColor_9;
        _versionLabel.textAlignment = NSTextAlignmentCenter;
        NSString *version = [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        _versionLabel.text = [NSString stringWithFormat:@"版本号V%@", version];
    }
    return _versionLabel;
}
- (UILabel *)bottomCRLabel{
    if (!_bottomCRLabel) {
        _bottomCRLabel = [UILabel new];
        _bottomCRLabel.font = [UIFont systemFontOfSize:12 *ScreenRatio_6];
        _bottomCRLabel.textColor = KMainTextColor_9;
        _bottomCRLabel.textAlignment = NSTextAlignmentCenter;
        _bottomCRLabel.text = @"©️2011-2018 成都南博教育咨询有限公司所有";
    }
    return _bottomCRLabel;
}
- (UILabel *)hotlineLabel{
    if (!_hotlineLabel) {
        _hotlineLabel = [UILabel new];
        _hotlineLabel.font = [UIFont systemFontOfSize:15 *ScreenRatio_6 weight:UIFontWeightSemibold];
        _hotlineLabel.textColor = KMainTextColor_9;
        _hotlineLabel.userInteractionEnabled = YES;
        _hotlineLabel.text = @"咨询热线：400-028-3996";
        [_hotlineLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hotlineAct)]];
    }
    return _hotlineLabel;
}
- (UILabel *)hotlineLabel_2{
    if (!_hotlineLabel_2) {
        _hotlineLabel_2 = [UILabel new];
        _hotlineLabel_2.font = [UIFont systemFontOfSize:15 *ScreenRatio_6 weight:UIFontWeightSemibold];
        _hotlineLabel_2.textColor = KMainTextColor_9;
        _hotlineLabel_2.userInteractionEnabled = YES;
        _hotlineLabel_2.text = @"028-66286868";
        [_hotlineLabel_2 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hotline_2_Act)]];
    }
    return _hotlineLabel_2;
}

@end

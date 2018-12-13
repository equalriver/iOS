
//
//  WLKTPolicyPhone.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/2/27.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTPolicyPhone.h"

@interface WLKTPolicyPhone ()
@property (strong, nonatomic) UIView *bgView;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UITextField *phoneTF;
@property (strong, nonatomic) UIView *sepView;
@property (strong, nonatomic) UIImageView *checkIcon_1;
@property (strong, nonatomic) UIImageView *checkIcon_2;
@property (strong, nonatomic) UILabel *checkDetail_1;
@property (strong, nonatomic) UILabel *checkDetail_2;
@property (strong, nonatomic) UIButton *callButton;

@property (copy, nonatomic) void (^callback)(NSString *phone);

@end

@implementation WLKTPolicyPhone
+ (void)policyPhoneWithType:(WLKTPolicyPhoneType)type typeId:(NSString *)typeId{
    
    WLKTPolicyPhone *obj = [[WLKTPolicyPhone alloc]initWithType:type handle:^(NSString *phone) {
        
        WLKTPolicyPhoneApi *api = [[WLKTPolicyPhoneApi alloc]initWithType:type typeId:typeId phone:phone];
        [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            NSString *code = [NSString stringWithFormat:@"%@", request.responseJSONObject[@"errorCode"]];
            if ([code isEqualToString:@"0"]) {
                NSString* str = [NSString stringWithFormat:@"telprompt://%@", request.responseJSONObject[@"result"][@"phone"]];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
            }
            else{
                [SVProgressHUD showInfoWithStatus:request.responseJSONObject[@"message"]];
            }
            
            for (UIView *v in [UIApplication sharedApplication].keyWindow.subviews) {
                if (v.tag == 1548) {
                    [v removeFromSuperview];
                    break;
                }
            }
            
        } failure:^(__kindof YTKBaseRequest *request) {
            
        }];
    }];

    [[UIApplication sharedApplication].keyWindow addSubview:obj.bgView];
}

- (instancetype)initWithType:(WLKTPolicyPhoneType)type handle:(void(^)(NSString *phone))handle
{
    self = [super init];
    if (self) {
        _callback = handle;
        [self.bgView addSubview:self.contentView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.phoneTF];
        [self.contentView addSubview:self.sepView];
        [self.contentView addSubview:self.checkIcon_1];
        [self.contentView addSubview:self.checkIcon_2];
        [self.contentView addSubview:self.checkDetail_1];
        [self.contentView addSubview:self.checkDetail_2];
        [self.contentView addSubview:self.callButton];
        [self makeConstraints];
        [self shakeToShow:self.contentView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            [self.bgView removeFromSuperview];
        }];
        [self.bgView addGestureRecognizer:tap];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
        
        if (type == WLKTPolicyPhoneTypeCourse) {
            [_callButton setTitle:@"拨打隐私电话(咨询课程)" forState:UIControlStateNormal];
        }
        else if (type == WLKTPolicyPhoneTypeActivity) {
            [_callButton setTitle:@"拨打隐私电话(咨询活动)" forState:UIControlStateNormal];
        }
        else {
            [_callButton setTitle:@"拨打隐私电话咨询" forState:UIControlStateNormal];
        }
    }
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - keyboard
- (void)keyboardFrameChange:(NSNotification *)noti{
    CGRect keyboardFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat off = self.contentView.origin.y + self.contentView.size.height;
    CGFloat keyboardOffset = off > keyboardFrame.origin.y ? keyboardFrame.origin.y - off : 0;
    
    self.contentView.transform = CGAffineTransformMakeTranslation(0, keyboardOffset);
    
}
#pragma mark -
- (void)callButtonAct{
    if ([self.phoneTF.text isValidPhoneNumber]) {
        [[UIApplication sharedApplication].keyWindow endEditing:YES];
        !_callback ?: _callback(self.phoneTF.text);
    }
    else{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD showInfoWithStatus:@"未输入或输入不正确"];
        });
    }
}

- (void) shakeToShow:(UIView *)aView{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}

#pragma mark -
- (void)makeConstraints{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(270 *ScreenRatio_6, 290 *ScreenRatio_6));
        make.centerX.mas_equalTo(self.bgView);
        make.top.mas_equalTo(self.bgView).offset(160 *ScreenRatio_6);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.mas_equalTo(self.contentView);
        make.height.mas_equalTo(20 *ScreenRatio_6);
        make.top.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
    }];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(30 *ScreenRatio_6);
        make.right.mas_equalTo(self.contentView).offset(-30 *ScreenRatio_6);
        make.height.mas_equalTo(25 *ScreenRatio_6);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(40 *ScreenRatio_6);
    }];
    [self.sepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.phoneTF);
        make.height.mas_equalTo(0.5);
    }];
    [self.checkIcon_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(15 *ScreenRatio_6, 15 *ScreenRatio_6));
        make.top.mas_equalTo(self.sepView).offset(10 *ScreenRatio_6);
    }];
    [self.checkDetail_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.phoneTF);
        make.top.mas_equalTo(self.checkIcon_1).offset(-5);
        make.height.mas_equalTo(40 *ScreenRatio_6);
    }];
    [self.checkIcon_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10 *ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(15 *ScreenRatio_6, 15 *ScreenRatio_6));
        make.top.mas_equalTo(self.checkDetail_1.mas_bottom).offset(10 *ScreenRatio_6);
    }];
    [self.checkDetail_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.phoneTF);
        make.top.mas_equalTo(self.checkIcon_2).offset(-5);
        make.height.mas_equalTo(40 *ScreenRatio_6);
    }];
    [self.callButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.bottom.mas_equalTo(self.contentView);
        make.height.mas_equalTo(45 *ScreenRatio_6);
    }];
}

#pragma mark - get
- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _bgView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];
        _bgView.tag = 1548;
    }
    return _bgView;
}
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 6 *ScreenRatio_6;
        [_contentView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            
        }]];
    }
    return _contentView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:18 *ScreenRatio_6 weight:UIFontWeightSemibold];
        _titleLabel.textColor = KMainTextColor_3;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"隐私电话";
    }
    return _titleLabel;
}
- (UITextField *)phoneTF{
    if (!_phoneTF) {
        _phoneTF = [UITextField new];
        _phoneTF.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        _phoneTF.textColor = KMainTextColor_6;
        _phoneTF.placeholder = @"输入当前手机号码";
        _phoneTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _phoneTF;
}
- (UIView *)sepView{
    if (!_sepView) {
        _sepView = [UIView new];
        _sepView.backgroundColor = kMainBackgroundColor;
    }
    return _sepView;
}
- (UIImageView *)checkIcon_1{
    if (!_checkIcon_1) {
        _checkIcon_1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"认证选中"]];
    }
    return _checkIcon_1;
}
- (UIImageView *)checkIcon_2{
    if (!_checkIcon_2) {
        _checkIcon_2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"认证选中"]];
    }
    return _checkIcon_2;
}
- (UILabel *)checkDetail_1{
    if (!_checkDetail_1) {
        _checkDetail_1 = [UILabel new];
        _checkDetail_1.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _checkDetail_1.textColor = KMainTextColor_9;
        _checkDetail_1.numberOfLines = 0;
        _checkDetail_1.text = @"请输入你的当前手机号码，便于接通，否则提示为空号";
    }
    return _checkDetail_1;
}
- (UILabel *)checkDetail_2{
    if (!_checkDetail_2) {
        _checkDetail_2 = [UILabel new];
        _checkDetail_2.font = [UIFont systemFontOfSize:14 *ScreenRatio_6];
        _checkDetail_2.textColor = KMainTextColor_9;
        _checkDetail_2.numberOfLines = 0;
        _checkDetail_2.text = @"请放心使用该功能，你的电话不会被泄露";
    }
    return _checkDetail_2;
}
- (UIButton *)callButton{
    if (!_callButton) {
        _callButton = [UIButton new];
        _callButton.titleLabel.font = [UIFont systemFontOfSize:16 *ScreenRatio_6];
        _callButton.backgroundColor = kMainTextColor_red;
        [_callButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_callButton addTarget:self action:@selector(callButtonAct) forControlEvents:UIControlEventTouchUpInside];
    }
    return _callButton;
}

@end

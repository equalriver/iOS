//
//  WLKTCDBottomButtons.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/16.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDBottomButtons.h"

@interface WLKTCDBottomButtons ()
@property (strong, nonatomic) ZFButton *phoneBtn;
@property (strong, nonatomic) ZFButton *serviceBtn;
@property (strong, nonatomic) UIButton *appointmentBtn;
@property (strong, nonatomic) UIButton *payButton;
@property (strong, nonatomic) UIView *sepView;
@end

@implementation WLKTCDBottomButtons
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.phoneBtn];
        [self addSubview:self.serviceBtn];
        [self addSubview:self.appointmentBtn];
        [self addSubview:self.payButton];
        [self addSubview:self.sepView];
    }
    return self;
}

- (void)setData:(WLKTCDData *)data{
    _data = data;
    if (data.courseinfo.have_pg.intValue == 1) {//有拼购
        if (data.courseinfo.pg_status.intValue == 1) {//开始拼购
            NSString *appointment = [NSString stringWithFormat:@"¥%@\n单独购", data.courseinfo.pg_oldprice];
            NSString *pay = [NSString stringWithFormat:@"¥%@\n拼购", data.courseinfo.pg_showprice];
            self.appointmentBtn.titleLabel.numberOfLines = 2;
            self.payButton.titleLabel.numberOfLines = 2;
            [self.appointmentBtn setTitle:appointment forState:UIControlStateNormal];
            [self.payButton setTitle:pay forState:UIControlStateNormal];
        }

    }
    
}

- (void)btnDidClick:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(CourseDetailBottomButtonDidSelectedButton:)]) {
        [self.delegate CourseDetailBottomButtonDidSelectedButton:sender];
    }
}

//图片在上  文字在下
- (ZFButton *)createZFButton:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag {
    ZFButton *btn = [ZFButton new];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:10 *ScreenRatio_6];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:KMainTextColor_6 forState:UIControlStateNormal];
    btn.tag = tag;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    btn.frame = CGRectMake(tag * 78 * ScreenRatio_6, 0, 75 * ScreenRatio_6, 50);
    if (tag == 0) {
        btn.imageRect = CGRectMake(27 * ScreenRatio_6, 5, 24, 22);
    }
    else{
        btn.imageRect = CGRectMake(27 * ScreenRatio_6, 5, 28, 22);
    }

    btn.titleRect = CGRectMake(0, 35, 75 * ScreenRatio_6, 15);
    [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

#pragma mark - get
- (ZFButton *)phoneBtn{
    if (!_phoneBtn) {
        _phoneBtn = [self createZFButton:@"隐私电话" image:[UIImage imageNamed:@"隐私电话"] tag:0];
    }
    return _phoneBtn;
}
- (ZFButton *)serviceBtn{
    if (!_serviceBtn) {
        _serviceBtn = [self createZFButton:@"在线客服" image:[UIImage imageNamed:@"在线咨询"] tag:1];
    }
    return _serviceBtn;
}
- (UIButton *)appointmentBtn{
    if (!_appointmentBtn) {
        _appointmentBtn = [[UIButton alloc]initWithFrame:CGRectMake(150 * ScreenRatio_6, 0, 110 * ScreenRatio_6, 50)];
        _appointmentBtn.titleLabel.font = [UIFont systemFontOfSize:16 * ScreenRatio_6 weight:UIFontWeightSemibold];
        _appointmentBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_appointmentBtn setTitle:@"预约试听" forState:UIControlStateNormal];
        _appointmentBtn.backgroundColor = UIColorHex(f6c447);
        _appointmentBtn.tag = 2;
        [_appointmentBtn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _appointmentBtn;
}
- (UIButton *)payButton{
    if (!_payButton) {
        _payButton = [[UIButton alloc]initWithFrame:CGRectMake(260 * ScreenRatio_6, 0, ScreenWidth - 260 * ScreenRatio_6, 50)];
        _payButton.titleLabel.font = [UIFont systemFontOfSize:16 * ScreenRatio_6 weight:UIFontWeightSemibold];
        _payButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_payButton setTitle:@"立即购买" forState:UIControlStateNormal];
        _payButton.backgroundColor = kMainTextColor_red;
        _payButton.tag = 3;
        [_payButton addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payButton;
}
- (UIView *)sepView{
    if (!_sepView) {
        _sepView = [[UIView alloc]initWithFrame:CGRectMake(78 *ScreenRatio_6, 0, 0.5, 50)];
        _sepView.backgroundColor = kMainBackgroundColor;
    }
    return _sepView;
}

@end

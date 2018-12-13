//
//  WLKTScreenshotsPopView.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

static const float RealSrceenHight =  667.0;
static const float RealSrceenWidth =  375.0;
#define DPRGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define DPSCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define DPSCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define DPSCREEN_BOUNDS         [UIScreen mainScreen].bounds
#define DPAdaptationH(x) x/RealSrceenHight*[[UIScreen mainScreen]bounds].size.height
#define DPAdaptationW(x) x/RealSrceenWidth*[[UIScreen mainScreen]bounds].size.width
//适配iOS10字体变大的缘故
#define IOS_VERSION_10_OR_LATER (([[[UIDevice currentDevice]systemVersion]floatValue]>=10.0)? (YES):(NO))

#define DPAdapationLabelFont(n) (IOS_VERSION_10_OR_LATER?((n-1)*([[UIScreen mainScreen]bounds].size.width/375.0f)):(n*([[UIScreen mainScreen]bounds].size.width/375.0f)))
#import "WLKTScreenshotsPopView.h"
#import "ZFButton.h"
@interface WLKTScreenshotsPopView ()
@property (nonatomic, copy) ActionSheetDidSelectSheetBlock selectSheetBlock;
@property (nonatomic,strong) UIImage *shotsImage;
@property (nonatomic,strong) UIButton *maskView;
@property (nonatomic,strong) UIImageView *shotsImageView;
@property (nonatomic,strong) UIView *bottomView;
@end

@implementation WLKTScreenshotsPopView
-(UIView *)maskView{
    if (_maskView == nil) {
        _maskView = [UIButton buttonWithType:UIButtonTypeCustom];
        _maskView.frame = [UIScreen mainScreen].bounds;
        _maskView.backgroundColor = [UIColor blackColor];
        [_maskView addTarget:self action:@selector(hiddenView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _maskView;
}

-(UIImageView *)shotsImageView{
    if (_shotsImageView == nil) {
        _shotsImageView = [[UIImageView alloc]initWithFrame:CGRectMake((DPSCREEN_WIDTH - DPAdaptationW(274))/2, DPAdaptationH(22), DPAdaptationW(274), DPAdaptationH(474))];
        
    }
    return _shotsImageView;
}

-(UIView *)bottomView{
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, DPSCREEN_HEIGHT, DPSCREEN_WIDTH, DPAdaptationH(160))];
        _bottomView.backgroundColor = DPRGBCOLOR(235, 235, 235);
        
    }
    return _bottomView;
}

+(instancetype)initWithScreenShots:(UIImage *)shotsImage selectSheetBlock:(ActionSheetDidSelectSheetBlock)selectSheetBlock{
    
    return [[self alloc]initWithScreenShots:shotsImage selectSheetBlock:selectSheetBlock];
}

-(instancetype)initWithScreenShots:(UIImage *)shotsImage selectSheetBlock:(ActionSheetDidSelectSheetBlock)selectSheetBlock{
    if (self = [super initWithFrame:DPSCREEN_BOUNDS]) {
        _selectSheetBlock = selectSheetBlock;
        _shotsImage = shotsImage;
    }
    return self;
}

-(void)show{
    [self addSubview:self.maskView];
    self.shotsImageView.image = _shotsImage;
    [self addSubview:self.shotsImageView];
    [self addSubview:self.bottomView];
    [self layoutBottomSubViews];
    [self animationWithView:self duration:0.3];
    
    self.maskView.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        self.maskView.alpha = 0.5;
    }];
    
    [UIView animateWithDuration:0.6 animations:^{
        self.bottomView.frame = CGRectMake(0, DPSCREEN_HEIGHT-DPAdaptationH(160), DPSCREEN_WIDTH, DPAdaptationH(160));
    }];
}

-(void)hiddenView{
    [UIView animateWithDuration:0.5 animations:^{
        self.shotsImageView.frame = CGRectMake((DPSCREEN_WIDTH-DPAdaptationW(274))/2, DPAdaptationH(120), DPAdaptationW(274), DPAdaptationH(474));
        self.maskView.alpha = 0.0;
        self.bottomView.alpha = 0.0;
        self.shotsImageView.alpha = 0.0;
        
        
    }];
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5/*延迟执行时间*/ * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [self.maskView removeFromSuperview];
        [self removeFromSuperview];
        if (self.hiddenBlock) {
            self.hiddenBlock();
        }
    });
}

#pragma mark-添加底部视图的子视图
-(void)layoutBottomSubViews{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, DPSCREEN_WIDTH, DPAdaptationH(40))];
    titleLabel.text = @"截图分享到";
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:DPAdapationLabelFont(16)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.bottomView addSubview:titleLabel];
    
    ZFButton *weixinBtn = [self createZFButton:@"微信好友" image:[UIImage imageNamed:@"课程详情微信"] type:WeiXinSelectSheetType];
    ZFButton *weixinCircleBtn = [self createZFButton:@"朋友圈" image:[UIImage imageNamed:@"课程详情朋友圈"] type:WeiXinCircleSelectSheetType];
    ZFButton *QQBtn = [self createZFButton:@"QQ" image:[UIImage imageNamed:@"课程详情QQ"] type:QQSelectSheetType];
    ZFButton *sinaBtn = [self createZFButton:@"新浪微博" image:[UIImage imageNamed:@"课程详情新浪"] type:SinaSelectSheetType];
    [self.bottomView addSubview:weixinBtn];
    [self.bottomView addSubview:weixinCircleBtn];
    [self.bottomView addSubview:QQBtn];
    [self.bottomView addSubview:sinaBtn];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, DPAdaptationH(120), DPSCREEN_WIDTH, DPAdaptationH(40))];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(hiddenView) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor whiteColor];
    [self.bottomView addSubview:btn];
    
}
//图片在上  文字在下
- (ZFButton *)createZFButton:(NSString *)title image:(UIImage *)image type:(SelectSheetType)type {
    ZFButton *btn = [ZFButton new];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:10];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.tag = type;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    btn.frame = CGRectMake(15 * ScreenRatio_6 + type * 95 * ScreenRatio_6, 40 * ScreenRatio_6, 55 * ScreenRatio_6, 70 * ScreenRatio_6);
    btn.imageRect = CGRectMake(4 * ScreenRatio_6, 4 * ScreenRatio_6, 50 * ScreenRatio_6, 50 * ScreenRatio_6);
    btn.titleRect = CGRectMake(0, 54 * ScreenRatio_6, 55 * ScreenRatio_6, 15);
    [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

-(void)btnDidClick:(ZFButton *)sender{
    if (_selectSheetBlock) {
        _selectSheetBlock(sender.tag);
    }
    [self hiddenView];
}

- (void)animationWithView:(UIView *)view duration:(CFTimeInterval)duration{
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    //    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    
    [view.layer addAnimation:animation forKey:nil];
}

@end


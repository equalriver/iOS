//
//  WLKTQRScanVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/25.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTQRScanVC.h"
#import <AVFoundation/AVFoundation.h>
#import "WLKTCDPageController.h"
#import "WLKTNewsVideoDetailVC.h"
#import "WLKTSchoolVC.h"
/**
 *  屏幕 高 宽 边界
 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_BOUNDS  [UIScreen mainScreen].bounds

#define TOP (SCREEN_HEIGHT-220)/2 - 64
#define LEFT (SCREEN_WIDTH-220)/2

#define kScanRect CGRectMake(LEFT, TOP, 220, 220)

@interface WLKTQRScanVC ()<AVCaptureMetadataOutputObjectsDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    int num;
    BOOL upOrdown;
    NSTimer * timer;
    CAShapeLayer *cropLayer;
    BOOL LightOn;
}
@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;
@property (strong, nonatomic) UIButton *lightButton;
@property (nonatomic, strong) UIImageView * line;

@end

@implementation WLKTQRScanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
    self.title = @"扫一扫";
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    UIBarButtonItem *photo = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(photoPickAct)];
    self.navigationItem.rightBarButtonItem = photo;

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            dispatch_async_on_main_queue(^{
                if (granted) {
                    //第一次用户接受
                    
                }else{
                    //用户拒绝
                    [self.navigationController popViewControllerAnimated:YES];
                }
            });
        }];
    }
    [self setCropRect:kScanRect];
    [self performSelector:@selector(setupCamera) withObject:nil afterDelay:0.0];
    
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_session stopRunning];
    [timer invalidate];
    timer = nil;
}

- (void)dealloc{
    [timer invalidate];
    timer = nil;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)configView{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:kScanRect];
    imageView.image = [UIImage imageNamed:@"pick_bg"];
    [self.view addSubview:imageView];
    
    upOrdown = NO;
    num = 0;
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(LEFT, TOP+10, 220, 2)];
    _line.image = [UIImage imageNamed:@"line.png"];
    [self.view addSubview:_line];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
}

- (void)setCropRect:(CGRect)cropRect{
    cropLayer = [[CAShapeLayer alloc] init];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, nil, cropRect);
    CGPathAddRect(path, nil, self.view.bounds);
    
    [cropLayer setFillRule:kCAFillRuleEvenOdd];
    [cropLayer setPath:path];
    [cropLayer setFillColor:[UIColor blackColor].CGColor];
    [cropLayer setOpacity:0.65];
    
    [cropLayer setNeedsDisplay];
    
    [self.view.layer addSublayer:cropLayer];
    UILabel *l = [[UILabel alloc]initWithFrame:CGRectMake(LEFT, TOP +230, 220, 15)];
    l.textColor = UIColorHex(ffffff);
    l.textAlignment = NSTextAlignmentCenter;
    l.font = [UIFont systemFontOfSize:14];
    l.text = @"对准二维码到框内即可扫描";
    [self.view addSubview:l];
    
    [self.view addSubview:self.lightButton];
    [self.lightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(-100 *ScreenRatio_6);
    }];
}

- (void)setupCamera{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device == nil) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"设备没有摄像头" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }

    // Device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //设置扫描区域
//    CGFloat top = 0.2 * TOP/SCREEN_HEIGHT;
//    CGFloat left = 0.2 * LEFT/SCREEN_WIDTH;
//    CGFloat width = 300/SCREEN_WIDTH;
//    CGFloat height = 450/SCREEN_HEIGHT;
    ///top 与 left 互换  width 与 height 互换
//    [_output setRectOfInterest:CGRectMake(top,left, height, width)];
    
    
    // Session
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    [_output setMetadataObjectTypes:[NSArray arrayWithObjects:AVMetadataObjectTypeQRCode, nil]];
    
    // Preview
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:_session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _preview.frame = self.view.layer.bounds;
    [self.view.layer insertSublayer:_preview atIndex:0];
    
    // Start
    [_session startRunning];
}

#pragma mark - action
- (void)lightButtonAct:(UIButton *)sender{
    LightOn = !LightOn;
    sender.selected = !sender.isSelected;
    
    if (LightOn) {
        [_device lockForConfiguration:nil];
        [_device setTorchMode:AVCaptureTorchModeOn];
        [_device unlockForConfiguration];
        
    }else{
        [_device lockForConfiguration:nil];
        [_device setTorchMode: AVCaptureTorchModeOff];
        [_device unlockForConfiguration];
        
    }
}

-(void)animation1{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake(LEFT, TOP +10 +2 *num, 220, 2);
        if (2*num == 200) {
            upOrdown = YES;
        }
    }
    else {
        num --;
        _line.frame = CGRectMake(LEFT, TOP +10 +2 *num, 220, 2);
        if (num == 0) {
            upOrdown = NO;
        }
    }
    
}

- (void)photoPickAct{
    //调用系统相册的类
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    
    //设置选取的照片是否可编辑
    pickerController.allowsEditing = false;
    //设置相册呈现的样式
    pickerController.sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;//图片分组列表样式
    //照片的选取样式还有以下两种
    //UIImagePickerControllerSourceTypePhotoLibrary,直接全部呈现系统相册
    //UIImagePickerControllerSourceTypeCamera//调取摄像头
    
    //选择完成图片或者点击取消按钮都是通过代理来操作我们所需要的逻辑过程
    pickerController.delegate = self;
    //使用模态呈现相册
    [self.navigationController presentViewController:pickerController animated:YES completion:^{
        
    }];

}

- (void)openURL:(NSString *)url{
    if (![[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:url]]){
        [SVProgressHUD showInfoWithStatus:@"无效的二维码"];
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    if (![url containsString:@"www.wlktang.com"] && ![url containsString:@"www.zhijiaobang.com"]) {
        [SVProgressHUD showInfoWithStatus:@"无法打开外部链接"];
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:url]]) {
        //停止扫描
        [_session stopRunning];
        [timer setFireDate:[NSDate distantFuture]];
        
        if ([url containsString:@"www.wlktang.com"]) {
            [self goDetailPageWithURL:url];
            return;
        }
        
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:url]];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        //停止扫描
        [_session stopRunning];
        [timer setFireDate:[NSDate distantFuture]];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"无效的二维码" message:@"无法打开该二维码地址" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (self.session != nil && timer != nil) {
                [self.session startRunning];
                [timer setFireDate:[NSDate date]];
            }
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)goDetailPageWithURL:(NSString *)url{
    
    NSString *shareId = [[url componentsSeparatedByString:@"?"].lastObject componentsSeparatedByString:@"="].lastObject;
    UIViewController *vc;
    
    if ([url containsString:@"course"]) {
        vc = [[WLKTCDPageController alloc]initWithCourseId:shareId];
        
    }
    if ([url containsString:@"news"]) {
        vc = [[WLKTNewsVideoDetailVC alloc]initWithNewsId:shareId];
        
    }
    if ([url containsString:@"school"]) {
        vc = [[WLKTSchoolVC alloc]initWithSchoolId:shareId];
        
    }
    if (vc) {
        //停止扫描
        [_session stopRunning];
        [timer setFireDate:[NSDate distantFuture]];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"无效的二维码" message:@"无法打开该二维码地址" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (self.session != nil && timer != nil) {
                [self.session startRunning];
                [timer setFireDate:[NSDate date]];
            }
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

#pragma mark - image picker delegate
//选择照片完成之后的代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    //info是所选择照片的信息
    //    UIImagePickerControllerEditedImage//编辑过的图片
    //    UIImagePickerControllerOriginalImage//原图
    
    NSLog(@"%@",info);
    UIImage *resultImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];

    //使用模态返回到软件界面
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
        CIContext *context = [CIContext contextWithOptions:nil];
        CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:context options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
        CIImage *image = [CIImage imageWithCGImage:resultImage.CGImage];
        NSArray *features = [detector featuresInImage:image];
        CIQRCodeFeature *feature = [features firstObject];
        NSString *result = feature.messageString;
        [self openURL:result];
    }];
    
}

//点击取消按钮所执行的方法
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    //这是捕获点击右上角cancel按钮所触发的事件，如果我们需要在点击cancel按钮的时候做一些其他逻辑操作。就需要实现该代理方法，如果不做任何逻辑操作，就可以不实现
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        [self.navigationController popToRootViewControllerAnimated:false];
    }];
    
}

#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue;
    
    if ([metadataObjects count] > 0){
//        //停止扫描
//        [_session stopRunning];
//        [timer setFireDate:[NSDate distantFuture]];
        
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
        NSLog(@"扫描结果：%@",stringValue);
        [self openURL:stringValue];
        
    }
    else {
        NSLog(@"无扫描信息");
        return;
    }
    
}

#pragma mark - get
- (UIButton *)lightButton{
    if (!_lightButton) {
        _lightButton = [[UIButton alloc]init];
        [_lightButton setImage:[UIImage imageNamed:@"电筒未点亮"] forState:UIControlStateNormal];
        [_lightButton setImage:[UIImage imageNamed:@"电筒点亮"] forState:UIControlStateSelected];
        [_lightButton addTarget:self action:@selector(lightButtonAct:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lightButton;
}

@end

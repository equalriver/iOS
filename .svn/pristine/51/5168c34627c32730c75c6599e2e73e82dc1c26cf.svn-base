//
//  WLKTNews_Q_A_goAnswerVC.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/5.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTNews_Q_A_goAnswerVC.h"
#import "PlaceholderTextView.h"
#import <AFNetworking.h>
#import "WLKTLogin.h"
#import "WLKTLoginCoordinator.h"
#import "WLKTCourseDetailUploadcollectionCell.h"
#import "TZImagePickerController.h"

@interface WLKTNews_Q_A_goAnswerVC ()<TZImagePickerControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, WLKTLoginCoordinatorDelegate>
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIImageView *questionIV;
@property (strong, nonatomic) UILabel *questionLabel;
@property (strong, nonatomic) UIView *separatorView;
@property (strong, nonatomic) UILabel *answerFixLabel;
@property (strong, nonatomic) PlaceholderTextView *answerTV;
@property (strong, nonatomic) UILabel *uploadLabel;
@property (strong, nonatomic) UICollectionView *uploadCV;
@property (strong, nonatomic) UIView *uploadContentView;

@property (nonatomic ,strong) NSMutableArray<UIImage *> *photosArray;
@property (nonatomic ,strong) NSMutableArray<UIImage *> *assestArray;
@property (nonatomic) BOOL isSelectOriginalPhoto;
@property (strong, nonatomic) WLKTNews_Q_A_detailData *data;
@property (strong, nonatomic) NSMutableArray *childCoordinator;
@property (copy, nonatomic) void (^loginBlock)(void);
@property (copy, nonatomic) void (^completion)(void);
@end

@implementation WLKTNews_Q_A_goAnswerVC
- (instancetype)initWithQuestionData:(WLKTNews_Q_A_detailData *)data answerCompletion:(void(^)(void))completion
{
    self = [super init];
    if (self) {
        _data = data;
        _completion = completion;
        [self addViews];
        self.questionLabel.text = data.question;
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(ScreenWidth, [data.question getSizeWithWidth:ScreenWidth Font:15].height +170));
        }];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我来回答";
    self.view.backgroundColor = separatorView_color;
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(confirmBtnAct)];
    self.navigationItem.rightBarButtonItem = right;

}

- (void)addViews{
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.questionIV];
    [self.contentView addSubview:self.questionLabel];
    [self.contentView addSubview:self.separatorView];
    [self.contentView addSubview:self.answerFixLabel];
    [self.contentView addSubview:self.answerTV];
    [self.view addSubview:self.uploadContentView];
    [self.uploadContentView addSubview:self.uploadLabel];
    [self.uploadContentView addSubview:self.uploadCV];
    [self makeConstraints];
}

#pragma mark - network
- (void)uploadCommentWithPhotos:(NSArray<NSData *> *)photos{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =
    [NSSet setWithObjects:@"application/json", @"text/json",
     @"text/javascript", @"text/html", nil];
    NSDictionary *param = @{
                            @"user_id": TheCurUser.token ? TheCurUser.token : @"",
                            @"question_id": self.data.qid ? self.data.qid : @"",
                            @"answer": self.answerTV.text ? self.answerTV.text : @"",
                            RequestMD5String
                            };
    //发出请求
    NSString *url = [NSString stringWithFormat:@"%@ask/reply", kBaseURL];
    [manager POST:url parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //利用时间戳当做图片名字
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *imageName = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg",imageName];
        if (photos.count) {
            for (int i = 0; i < photos.count; i++) {
                [formData appendPartWithFileData:photos[i] name:[NSString stringWithFormat:@"picture%d", i] fileName:fileName mimeType:@"image/jpeg"];
            }
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (TheCurUser) {
            [SVProgressHUD showProgress:uploadProgress.fractionCompleted status:@"正在上传..."];
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:nil];
        if ([dic containsObjectForKey:@"message"]) {
            [SVProgressHUD showInfoWithStatus:dic[@"message"]];
            if ([dic[@"message"] isEqualToString:@"未登录"]) {
                WS(weakSelf);
                if (!TheCurUser) {
                    [self loginWithComepletion:^{
                        [weakSelf.navigationController dismissViewControllerAnimated:NO completion:nil];
                    }];
                }
            }
        }
        if ([dic containsObjectForKey:@"errorCode"] && [dic[@"errorCode"] isEqual: @0]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                !self.completion ?: self.completion();
                [self.navigationController popViewControllerAnimated:YES];
            });
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
    
}

#pragma mark - action
- (void)confirmBtnAct{
    if (self.answerTV.text.length < 5) {
        [SVProgressHUD showInfoWithStatus:@"描述字数不够"];
        return;
    }
    if (self.answerTV.text.length > 200) {
        [SVProgressHUD showInfoWithStatus:@"超过字数限制"];
        return;
    }
    if (self.photosArray.count) {
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:3];
        for (UIImage *obj in self.photosArray) {
            NSData *data = UIImageJPEGRepresentation(obj, 0.7f);
            [arr addObject:data];
        }
        [self uploadCommentWithPhotos:arr];
        return;
    }
    else if (self.assestArray.count){
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:3];
        for (UIImage *obj in self.assestArray) {
            NSData *data = UIImageJPEGRepresentation(obj, 0.1f);
            [arr addObject:data];
        }
        [self uploadCommentWithPhotos:arr];
    }
    else{
        [self uploadCommentWithPhotos:nil];
    }
}

- (void)deletePhotos:(UIButton *)sender{
    [_photosArray removeObjectAtIndex:sender.tag - 100];
    [_assestArray removeObjectAtIndex:sender.tag - 100];
    [self.uploadCV performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag - 100 inSection:0];
        [self.uploadCV deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [self.uploadCV reloadData];
    }];
}

#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.photosArray.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WLKTCourseDetailUploadcollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WLKTCourseDetailUploadcollectionCell" forIndexPath:indexPath];
    
    if (indexPath.row == _photosArray.count) {
        cell.imagev.image = [UIImage imageNamed:@"图片"];
        cell.deleteButton.hidden = YES;
        
    }else{
        cell.imagev.image = _photosArray[indexPath.row];
        cell.deleteButton.hidden = NO;
    }
    cell.deleteButton.tag = 100 + indexPath.row;
    [cell.deleteButton addTarget:self action:@selector(deletePhotos:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == _photosArray.count) {
        [self checkLocalPhoto];
    }else{
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_assestArray selectedPhotos:_photosArray index:indexPath.row];
        imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            self.photosArray = [NSMutableArray arrayWithArray:photos];
            self.assestArray = [NSMutableArray arrayWithArray:assets];
            self.isSelectOriginalPhoto = isSelectOriginalPhoto;
            [self.uploadCV reloadData];
            
        }];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
    }
}

#pragma mark - image picker
- (void)checkLocalPhoto{
    TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    [imagePicker setSortAscendingByModificationDate:NO];
    imagePicker.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    imagePicker.selectedAssets = _assestArray;
    imagePicker.allowPickingVideo = NO;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto{
    self.photosArray = [NSMutableArray arrayWithArray:photos];
    self.assestArray = [NSMutableArray arrayWithArray:assets];
    _isSelectOriginalPhoto = isSelectOriginalPhoto;
    [self.uploadCV reloadData];
    
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

#pragma mark -
- (void)makeConstraints{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 190));
        make.top.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view);
    }];
    [self.questionIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(15 * ScreenRatio_6);
        make.left.mas_equalTo(self.contentView).offset(10 * ScreenRatio_6);
        make.size.mas_equalTo(CGSizeMake(12, 12));
    }];
    [self.questionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.questionIV);
        make.left.mas_equalTo(self.questionIV.mas_right).offset(10 * ScreenRatio_6);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 * ScreenRatio_6);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 5));
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.questionLabel.mas_bottom).offset(10 * ScreenRatio_6);
    }];
    [self.answerFixLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.top.mas_equalTo(self.separatorView).offset(30);
    }];
    [self.answerTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(275 * ScreenRatio_6, 100));
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 * ScreenRatio_6);
        make.top.mas_equalTo(self.separatorView).offset(15 * ScreenRatio_6);
    }];
    [self.uploadContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 135 * ScreenRatio_6));
        make.top.mas_equalTo(self.contentView.mas_bottom).offset(5);
        make.left.mas_equalTo(self.view);
    }];
    [self.uploadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.uploadContentView).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.uploadContentView).offset(15 * ScreenRatio_6);
    }];
    [self.uploadCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth - 10, 90));
        make.left.mas_equalTo(self.uploadContentView).offset(10 * ScreenRatio_6);
        make.top.mas_equalTo(self.uploadLabel.mas_bottom).offset(15 * ScreenRatio_6);
    }];
}

#pragma mark - get
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = UIColorHex(ffffff);
    }
    return _contentView;
}
- (UIImageView *)questionIV{
    if (!_questionIV) {
        _questionIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"问"]];
    }
    return _questionIV;
}
- (UILabel *)questionLabel{
    if (!_questionLabel) {
        _questionLabel = [UILabel new];
        _questionLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
        _questionLabel.textColor = KMainTextColor_3;
        _questionLabel.numberOfLines = 0;
    }
    return _questionLabel;
}
- (UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = separatorView_color;
    }
    return _separatorView;
}
- (UILabel *)answerFixLabel{
    if (!_answerFixLabel) {
        _answerFixLabel = [UILabel new];
        _answerFixLabel.font = [UIFont systemFontOfSize:14 * ScreenRatio_6];
        _answerFixLabel.textColor = KMainTextColor_3;
        _answerFixLabel.text = @"我的回答： ";
    }
    return _answerFixLabel;
}
- (PlaceholderTextView *)answerTV{
    if (!_answerTV) {
        _answerTV = [[PlaceholderTextView alloc]initWithPlaceholderColor:KMainTextColor_9 font:11 * ScreenRatio_6];
        _answerTV.myPlaceholder = @"请输入具体描述(5~200个字)";
        _answerTV.layer.borderColor = KMainTextColor_9.CGColor;
        _answerTV.layer.borderWidth = 0.5;
        _answerTV.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _answerTV.textColor = KMainTextColor_3;
    }
    return _answerTV;
}
- (UIView *)uploadContentView{
    if (!_uploadContentView) {
        _uploadContentView = [UIView new];
        _uploadContentView.backgroundColor = [UIColor whiteColor];
    }
    return _uploadContentView;
}
- (UILabel *)uploadLabel{
    if (!_uploadLabel) {
        _uploadLabel = [UILabel new];
        _uploadLabel.font = [UIFont systemFontOfSize:12 * ScreenRatio_6];
        _uploadLabel.textColor = KMainTextColor_3;
        _uploadLabel.text = @"上传图片";
    }
    return _uploadLabel;
}
-(UICollectionView *)uploadCV{
    if (!_uploadCV) {
        UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
        flowLayOut.itemSize = CGSizeMake(80, 80);
        flowLayOut.sectionInset = UIEdgeInsetsMake(0, 10 * ScreenRatio_6, 0, 0);
        flowLayOut.minimumInteritemSpacing = 10 * ScreenRatio_6;
        flowLayOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _uploadCV = [[UICollectionView alloc] initWithFrame:CGRectNull collectionViewLayout:flowLayOut];
        _uploadCV.delegate = self;
        _uploadCV.dataSource = self;
        _uploadCV.backgroundColor = [UIColor whiteColor];
        [_uploadCV registerClass:[WLKTCourseDetailUploadcollectionCell class] forCellWithReuseIdentifier:@"WLKTCourseDetailUploadcollectionCell"];
    }
    return _uploadCV;
}
- (NSMutableArray *)photosArray{
    if (!_photosArray) {
        self.photosArray = [NSMutableArray array];
    }
    return _photosArray;
}
- (NSMutableArray *)assestArray{
    if (!_assestArray) {
        self.assestArray = [NSMutableArray array];
    }
    return _assestArray;
}
- (NSMutableArray *)childCoordinator {
    if (!_childCoordinator) {
        _childCoordinator = [NSMutableArray array];
    }
    return _childCoordinator;
}
@end



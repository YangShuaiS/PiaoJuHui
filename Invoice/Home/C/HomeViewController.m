//
//  HomeViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeViewController.h"
#import "WCQRCodeScanningVC.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

#import "QrcodeView.h"
#import "HomeTopView.h"
#import "HomeCenterView.h"
#import "BoLangView.h"
#import "PersonalViewController.h"
#import "MyInvoiceViewController.h"
#import "PiaoJuChaYanViewController.h"
#import "FaPiaoTaiTouViewController.h"
#import "ChongzhiViewController.h"

#import "HWWaveView.h"
@interface HomeViewController ()<HomeCenterDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    HomeTopView * homeTopView;
    HomeCenterView* homeCenterView;
    BoLangView * bolang;
    BOOL xiangce;
    UIImagePickerController *pickerCon;
    
    HWWaveView  * hwview;
    BaseLabel * jindu;
    
    UIView * backview;
}
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HomeViewController

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
//    [self endAnimation];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self stareAnimation];
    [self loadRequestData];

}
- (void)endAnimation{
    if (!bolang) {
        bolang.stare = NO;
    }
}
- (void)stareAnimation{
//    if (!bolang) {
        bolang.stare = YES;
//    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    xiangce = NO;
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = RGB(0xff, 0xff, 0xff);

    [self install];
    [self addTopView];  //添加首页上面视图
    [self addbolang];
    [self addCenterView];
    [self addQrcode];//添加二维码视图
}
- (void)install{
    UIView *statusBar = STAUBARHEIGHT;
    NavHeight = statusBar.frame.size.height+NAVIGATIONHeight;
    TabBarHeight = TABBARHeight;
    StatusBar = statusBar.frame.size.height;
}
- (void)addTopView{
    WS(ws);
    homeTopView = [HomeTopView new];
    homeTopView.delegate = self;
    [self.view addSubview:homeTopView];
    [homeTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
//        make.height.mas_equalTo(217+StatusBar+100);
    }];
}

- (void)addbolang{
    WS(ws);

    bolang = [BoLangView new];
    [self.view addSubview:bolang];
    UIImage * backimage = UIIMAGE("波浪1");

    [bolang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(homeTopView.mas_bottom).with.offset(0);
        make.height.mas_equalTo(backimage.size.height);
    }];

}

- (void)addCenterView{
    WS(ws);
    homeCenterView = [HomeCenterView new];
    if ([Me.user_type isEqualToString:@"1"]) {
        homeCenterView.centers = HomeCenterthree;

    }else{
        homeCenterView.centers = HomeCentertwo;

    }
    homeCenterView.delegate = self;
    [self.view addSubview:homeCenterView];
    [homeCenterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
    make.top.equalTo(homeTopView.mas_bottom).with.offset(0);
        make.height.mas_equalTo(132);
    }];
}
#pragma mark -------------homeCenterViewDeleate
- (void)oneButtonClick{
 
    MyInvoiceViewController * vc = [[MyInvoiceViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)timerAction
{

    hwview.progress += 0.01;
    jindu.text = [NSString stringWithFormat:@"正在上传:%.2f",hwview.progress];
    if (hwview.progress >= 1) {
        hwview.progress = 0.5;
        jindu.text = @"正在识别照片";
        [pickerCon dismissViewControllerAnimated:YES completion:nil];
        [_timer invalidate];
        _timer = nil;
    }
}
- (void)twoButtonClick{
    PiaoJuChaYanViewController * vc = [[PiaoJuChaYanViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)threeButtonClick{
    FaPiaoTaiTouViewController * vc = [[FaPiaoTaiTouViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)fourButtonClick{
    pickerCon = [[UIImagePickerController alloc]init];
    pickerCon.sourceType = UIImagePickerControllerSourceTypeCamera;
    pickerCon.allowsEditing = NO;//是否可编辑
    pickerCon.delegate = self;
    [self xiangcequanxian];
    [self QRCodeScanVC:pickerCon];

}
- (void)xiangcequanxian{
    // 1、 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        // 判断授权状态
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if (status == PHAuthorizationStatusNotDetermined) { // 用户还没有做出选择
            // 弹框请求用户授权
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (status == PHAuthorizationStatusAuthorized) { // 用户第一次同意了访问相册权限
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        [self enterImagePickerController];
                        xiangce = YES;
                    });

                } else { // 用户第一次拒绝了访问相机权限
                    xiangce = NO;

                }
            }];
            
        } else if (status == PHAuthorizationStatusAuthorized) { // 用户允许当前应用访问相册
            xiangce = YES;

            [self enterImagePickerController];
        } else if (status == PHAuthorizationStatusDenied) { // 用户拒绝当前应用访问相册
            xiangce = NO;

            [self enterImagePickerController];
        } else if (status == PHAuthorizationStatusRestricted) {
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"由于系统原因, 无法访问相册" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
        }
    }
}
- (void)enterImagePickerController {

}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.image"]) {//如果是拍照
        UIImage *image;
        //如果允许编辑则获得编辑后的照片，否则获取原始照片
        if (picker.allowsEditing) {
            image=[info objectForKey:UIImagePickerControllerEditedImage];//获取编辑后的照片
        }else{
            image=[info objectForKey:UIImagePickerControllerOriginalImage];//获取原始照片
        }
        [self upImageView:image];
//        self.resultImgView.image = image;
        if (xiangce == YES) {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);//保存到相簿

        }
    }else if([mediaType isEqualToString:@"public.movie"]){//如果是录制视频
        NSURL *url=[info objectForKey:UIImagePickerControllerMediaURL];//视频路径
        NSString *urlStr=[url path];
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlStr)) {
            //保存视频到相簿，注意也可以使用ALAssetsLibrary来保存
//            UISaveVideoAtPathToSavedPhotosAlbum(urlStr, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);//保存视频到相簿
        }
        
    }
    
//    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)upImageView:(UIImage *)image{
    WS(ws);
    backview = [UIView new];
    [pickerCon.view.window addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(pickerCon.view.window);
    }];
    UIView * topview = [UIView new];
    topview.backgroundColor = RGB(0x0e, 0x06, 0x00);
    topview.alpha = 0.7;
    [backview addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(pickerCon.view.window);
    }];

    hwview = [[HWWaveView alloc] initWithFrame:CGRectMake(WIDTH/2-25, HEIGHT/2-25, 50, 50)];
    [backview addSubview:hwview];
    jindu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@""];
    jindu.text = @"正在上传";
    [backview addSubview:jindu];
    [jindu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hwview.mas_bottom).with.offset(5);
        make.centerX.equalTo(backview);
    }];
//
//    NSData * imageDatass = UIImageJPEGRepresentation(image,1);
    NSData * imageData = UIImageJPEGRepresentation(image, 0.5);

    [self updataImage:imageData];
//    [self updataImage:imageData];

}

- (void)updataImage:(NSData *)data{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_SCTP];
    NSDictionary * dic = @{@"image":data};
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //2.上传文件
    [manager POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSString * str = [BaseObject getCurrentTimes];
        str = [NSString stringWithFormat:@"%@.png",str];
        //上传文件参数
        [formData appendPartWithFileData:data name:@"image" fileName:str mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //打印上传进度
        CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        dispatch_async(dispatch_get_main_queue(), ^{
            hwview.progress = progress/100.0;
            jindu.text = [NSString stringWithFormat:@"正在上传:%.2lf%%",progress];
            if (progress>=100) {
                hwview.progress = hwview.progress/2;
                jindu.text = @"正在识别照片";
            }
            
        });


        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [backview removeFromSuperview];
        [pickerCon dismissViewControllerAnimated:NO completion:nil];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //请求失败
        MJExtensionLog(@"请求失败：%@",error);
        
    }];

}
#pragma mark -------------PushDeleate
-(void)ClickModel:(ALlModel *)model Style:(Click)style{
    switch (style) {
        case ClickPushQrcode:
            [self PushQrcode:model];
            break;
        case ClickPushPerson:
            [self PushPerson:model];
            break;
        case ClickancZhiFu:
            [self PushZhiFu:model];
            break;
        default:
            break;
    }
}
- (void)PushZhiFu:(ALlModel *)model{
    ChongzhiViewController * vc = [ChongzhiViewController new];
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)PushQrcode:(ALlModel *)model{
    WCQRCodeScanningVC *WCVC = [[WCQRCodeScanningVC alloc] init];
    [self QRCodeScanVC:WCVC];
}
- (void)PushPerson:(ALlModel *)model{
    PersonalViewController *VC = [[PersonalViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}


- (void)addQrcode{
    WS(ws);
    QrcodeView * qrcode = [QrcodeView new];
    qrcode.delegate = self;
    [self.view addSubview:qrcode];
    [qrcode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
make.top.equalTo(homeCenterView.mas_bottom).with.offset(0);
        make.height.mas_equalTo(214);
        make.width.mas_equalTo(214);

    }];
}

- (void)QRCodeScanVC:(UIViewController *)scanVC {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        switch (status) {
            case AVAuthorizationStatusNotDetermined: {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted) {
                        dispatch_sync(dispatch_get_main_queue(), ^{
//                            if ([scanVC.class isEqual:UIImagePickerController]) {
//
//                            }
                            if ([scanVC.class isEqual:UIImagePickerController.class]) {
                                [self presentViewController:scanVC animated:YES completion:nil];
                                
                            }else{
                                [self.navigationController pushViewController:scanVC animated:YES];
                            }                        });
                        MJExtensionLog(@"用户第一次同意了访问相机权限 - - %@", [NSThread currentThread]);
                    } else {
                        MJExtensionLog(@"用户第一次拒绝了访问相机权限 - - %@", [NSThread currentThread]);
                    }
                }];
                break;
            }
            case AVAuthorizationStatusAuthorized: {
                if ([scanVC.class isEqual:UIImagePickerController.class]) {
                    [self presentViewController:scanVC animated:YES completion:nil];
                }else{
                    [self.navigationController pushViewController:scanVC animated:YES];
                }
                break;
            }
            case AVAuthorizationStatusDenied: {
                UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请去-> [设置 - 隐私 - 相机 - SGQRCodeExample] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                [alertC addAction:alertA];
                [self presentViewController:alertC animated:YES completion:nil];
                break;
            }
            case AVAuthorizationStatusRestricted: {
                MJExtensionLog(@"因为系统原因, 无法访问相册");
                break;
            }
                
            default:
                break;
        }
        return;
    }
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertC addAction:alertA];
    [self presentViewController:alertC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)loadRequestData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_HOME];
    NSDictionary * dic = @{@"token":Me.token};
    //
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomeModel * model = [HomeModel mj_objectWithKeyValues:responseObject];
            homeTopView.model = model;
        }else{
            
        }
    }];
}

@end

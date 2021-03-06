//
//  WCQRCodeScanningVC.m
//  SGQRCodeExample
//
//  Created by kingsic on 17/3/20.
//  Copyright © 2017年 kingsic. All rights reserved.
//

#import "WCQRCodeScanningVC.h"
#import "SGQRCode.h"
#import "ScanSuccessJumpVC.h"
#import "FaPiaoXQViewController.h"
@interface WCQRCodeScanningVC () <SGQRCodeScanManagerDelegate, SGQRCodeAlbumManagerDelegate>
@property (nonatomic, strong) SGQRCodeScanManager *manager;
@property (nonatomic, strong) SGQRCodeScanningView *scanningView;
@property (nonatomic, strong) UIButton *flashlightBtn;
@property (nonatomic, strong) UILabel *promptLabel;
@property (nonatomic, assign) BOOL isSelectedFlashlightBtn;
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation WCQRCodeScanningVC

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.scanningView addTimer];
    [_manager resetSampleBufferDelegate];
    [self.manager startRunning];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.scanningView removeTimer];
    [self removeFlashlightBtn];
    [_manager cancelSampleBufferDelegate];
}

- (void)dealloc {
    [self removeScanningView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor clearColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.scanningView];
    [self setupNavigationBar];
    [self setupQRCodeScanning];
    [self.view addSubview:self.promptLabel];
    /// 为了 UI 效果
    [self.view addSubview:self.bottomView];
}

- (void)setupNavigationBar {
//    UIView * nav = [UIView new];
//    nav.backgroundColor = [UIColor redColor];
//    [self.view addSubview:nav];
    WS(ws);
//    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws.view).with.offset(0);
//        make.right.equalTo(ws.view).with.offset(0);
//        make.top.equalTo(ws.view).with.offset(0);
//        make.height.mas_equalTo(64);
//    }];
    BaseButton * left = [BaseButton buttonWithType:UIButtonTypeCustom];
    [left addTarget:self action:@selector(leftBarButtonItenAction) forControlEvents:UIControlEventTouchUpInside];
    [left setImage:UIIMAGE("返回-黑") forState:UIControlStateNormal];
    [self.view addSubview:left];
    [left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(StatusBar+4);
        make.left.equalTo(ws.view).with.offset(12);
        make.height.mas_equalTo(@35);
    }];
    
    
    BaseButton * right = [BaseButton buttonWithType:UIButtonTypeCustom];
    [right addTarget:self action:@selector(rightBarButtonItenAction) forControlEvents:UIControlEventTouchUpInside];
    [right setTitle:@"相册" forState:UIControlStateNormal];
    [self.view addSubview:right];
    [right mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(ws.view).with.offset(StatusBar+12);
        make.right.equalTo(ws.view).with.offset(-12);
        make.height.mas_equalTo(@20);
    }];
}

- (SGQRCodeScanningView *)scanningView {
    if (!_scanningView) {
        _scanningView = [[SGQRCodeScanningView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.9 * self.view.frame.size.height)];
    }
    return _scanningView;
}
- (void)removeScanningView {
    [self.scanningView removeTimer];
    [self.scanningView removeFromSuperview];
    self.scanningView = nil;
}

- (void)rightBarButtonItenAction {
    SGQRCodeAlbumManager *manager = [SGQRCodeAlbumManager sharedManager];
    [manager readQRCodeFromAlbumWithCurrentController:self];
    manager.delegate = self;

    if (manager.isPHAuthorization == YES) {
        [self.scanningView removeTimer];
    }
}
- (void)leftBarButtonItenAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setupQRCodeScanning {
    self.manager = [SGQRCodeScanManager sharedManager];
    NSArray *arr = @[AVMetadataObjectTypeDataMatrixCode, AVMetadataObjectTypeAztecCode, AVMetadataObjectTypeQRCode, AVMetadataObjectTypePDF417Code,
                     AVMetadataObjectTypeEAN13Code,
                     AVMetadataObjectTypeEAN8Code,
                     AVMetadataObjectTypeCode128Code];
    // AVCaptureSessionPreset1920x1080 推荐使用，对于小型的二维码读取率较高
    [_manager setupSessionPreset:AVCaptureSessionPreset1920x1080 metadataObjectTypes:arr currentController:self];
    _manager.delegate = self;
}

#pragma mark - - - SGQRCodeAlbumManagerDelegate
- (void)QRCodeAlbumManagerDidCancelWithImagePickerController:(SGQRCodeAlbumManager *)albumManager {
    [self.view addSubview:self.scanningView];
}
- (void)QRCodeAlbumManager:(SGQRCodeAlbumManager *)albumManager didFinishPickingMediaWithResult:(NSString *)result {
    
    if ([result hasPrefix:@"http"]) {
        ScanSuccessJumpVC *jumpVC = [[ScanSuccessJumpVC alloc] init];
        jumpVC.comeFromVC = ScanSuccessJumpComeFromWC;
        jumpVC.jump_URL = result;
        [self.navigationController pushViewController:jumpVC animated:YES];
        
    } else {
        ScanSuccessJumpVC *jumpVC = [[ScanSuccessJumpVC alloc] init];
        jumpVC.comeFromVC = ScanSuccessJumpComeFromWC;
        jumpVC.jump_URL = result;
        [self loadRequestData:result];

//        ScanSuccessJumpVC *jumpVC = [[ScanSuccessJumpVC alloc] init];
//        jumpVC.comeFromVC = ScanSuccessJumpComeFromWC;
//        jumpVC.jump_bar_code = result;
//
//        [self.navigationController pushViewController:jumpVC animated:YES];
    }
}

- (void)loadRequestData:(NSString*)str{
    
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在查验...";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.view.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view.window);
    }];
    
    NSString * url = [NSString stringWithFormat:@"%@%@",FPZY,JK_FPCY];
    NSDictionary * dic = @{@"token":Me.token,@"data":str};
//
//    NSString * url = @"http://192.168.1.200:9000/checkticket?token=ba106bec3d2926eaaed90cde3e67bcafacca8fc0&num=1&data=01,01,1100153130,51785479,75.68,20170112,,13CF";
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            FPModel * fpModel = [FPModel mj_objectWithKeyValues:responseObject];
            if ([fpModel.code isEqualToString:@"200"]) {
                [mb hideAnimated:NO afterDelay:1];
                
                NSDictionary * dic = responseObject[@"data"];
                FaPiaoXQViewController * vc = [FaPiaoXQViewController new];
                
                if ([dic[@"re_type"] isEqualToString:@"02"]) {
                }
                if ([dic[@"re_type"] isEqualToString:@"03"]) {
                    FPXQModel * fpxqmodel = [FPXQModel mj_objectWithKeyValues:responseObject[@"data"]];
                    vc.fptype =dic[@"re_type"];
                    vc.jdcmodel = fpxqmodel;
                }
                if ([dic[@"re_type"] isEqualToString:@"04"]||[dic[@"re_type"] isEqualToString:@"01"]||[dic[@"re_type"] isEqualToString:@"10"]||[dic[@"re_type"] isEqualToString:@"11"]||[dic[@"re_type"] isEqualToString:@"14"]) {
                    ZZPTModel * zzptmodel = [ZZPTModel mj_objectWithKeyValues:responseObject[@"data"]];
                    vc.fptype =dic[@"re_type"];
                    vc.zzptmodel = zzptmodel;
                }else{
                    ZZPTModel * zzptmodel = [ZZPTModel mj_objectWithKeyValues:responseObject[@"data"]];
                    vc.fptype =dic[@"re_type"];
                    vc.zzptmodel = zzptmodel;
                }
                [self.navigationController pushViewController:vc animated:YES];
            }else{
                mb.label.text = fpModel.message;
                [mb hideAnimated:NO afterDelay:1];
                
            }
        }else{
            mb.label.text = @"网络连接失败";
            [mb hideAnimated:NO afterDelay:1];
            
        }
    }];
}
- (void)QRCodeAlbumManagerDidReadQRCodeFailure:(SGQRCodeAlbumManager *)albumManager {
    MJExtensionLog(@"暂未识别出二维码");
}

#pragma mark - - - SGQRCodeScanManagerDelegate
- (void)QRCodeScanManager:(SGQRCodeScanManager *)scanManager didOutputMetadataObjects:(NSArray *)metadataObjects {
    MJExtensionLog(@"metadataObjects - - %@", metadataObjects);
    if (metadataObjects != nil && metadataObjects.count > 0) {
        [scanManager playSoundName:@"SGQRCode.bundle/sound.caf"];
        [scanManager stopRunning];

//        [scanManager videoPreviewLayerRemoveFromSuperlayer];
        
        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
//        ScanSuccessJumpVC *jumpVC = [[ScanSuccessJumpVC alloc] init];
//        jumpVC.comeFromVC = ScanSuccessJumpComeFromWC;
//        jumpVC.jump_URL = [obj stringValue];

            [self loadRequestData:[obj stringValue]];

//        [self.navigationController pushViewController:jumpVC animated:YES];
    } else {
        MJExtensionLog(@"暂未识别出扫描的二维码");
    }
}
- (void)QRCodeScanManager:(SGQRCodeScanManager *)scanManager brightnessValue:(CGFloat)brightnessValue {
    if (brightnessValue < - 1) {
        [self.view addSubview:self.flashlightBtn];
    } else {
        if (self.isSelectedFlashlightBtn == NO) {
            [self removeFlashlightBtn];
        }
    }
}

- (UILabel *)promptLabel {
    if (!_promptLabel) {
        _promptLabel = [[UILabel alloc] init];
        _promptLabel.backgroundColor = [UIColor clearColor];
        CGFloat promptLabelX = 0;
        CGFloat promptLabelY = 0.73 * self.view.frame.size.height;
        CGFloat promptLabelW = self.view.frame.size.width;
        CGFloat promptLabelH = 25;
        _promptLabel.frame = CGRectMake(promptLabelX, promptLabelY, promptLabelW, promptLabelH);
        _promptLabel.textAlignment = NSTextAlignmentCenter;
        _promptLabel.font = [UIFont boldSystemFontOfSize:13.0];
        _promptLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        _promptLabel.text = @"将二维码/条码放入框内, 即可自动扫描";
    }
    return _promptLabel;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scanningView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(self.scanningView.frame))];
        _bottomView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    return _bottomView;
}

#pragma mark - - - 闪光灯按钮
- (UIButton *)flashlightBtn {
    if (!_flashlightBtn) {
        // 添加闪光灯按钮
        _flashlightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        CGFloat flashlightBtnW = 30;
        CGFloat flashlightBtnH = 30;
        CGFloat flashlightBtnX = 0.5 * (self.view.frame.size.width - flashlightBtnW);
        CGFloat flashlightBtnY = 0.55 * self.view.frame.size.height;
        _flashlightBtn.frame = CGRectMake(flashlightBtnX, flashlightBtnY, flashlightBtnW, flashlightBtnH);
        [_flashlightBtn setBackgroundImage:[UIImage imageNamed:@"SGQRCodeFlashlightOpenImage"] forState:(UIControlStateNormal)];
        [_flashlightBtn setBackgroundImage:[UIImage imageNamed:@"SGQRCodeFlashlightCloseImage"] forState:(UIControlStateSelected)];
        [_flashlightBtn addTarget:self action:@selector(flashlightBtn_action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _flashlightBtn;
}

- (void)flashlightBtn_action:(UIButton *)button {
    if (button.selected == NO) {
        [SGQRCodeHelperTool SG_openFlashlight];
        self.isSelectedFlashlightBtn = YES;
        button.selected = YES;
    } else {
        [self removeFlashlightBtn];
    }
}

- (void)removeFlashlightBtn {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SGQRCodeHelperTool SG_CloseFlashlight];
        self.isSelectedFlashlightBtn = NO;
        self.flashlightBtn.selected = NO;
        [self.flashlightBtn removeFromSuperview];
    });
}



@end


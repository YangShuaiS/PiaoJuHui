//
//  FaPiaoTaiTouViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FaPiaoTaiTouViewController.h"
#import "ShuRuView.h"
#import "SGQRCode.h"
@interface FaPiaoTaiTouViewController ()<UIScrollViewDelegate>{
    UIView * nav;
    UIScrollView * scrollView;
    ShuRuView * DanWei;
    ShuRuView * NaShuiRen;
    ShuRuView * GongSiDiZhi;
    ShuRuView * GongSiDianHua;
    ShuRuView * KaiHuHang;
    ShuRuView * kaiZhangHao;
}

@end

@implementation FaPiaoTaiTouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    [self addnav];
    [self addscrollView];
    [self loadRequestData];
}

- (void)loadRequestData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FPTT];
    NSDictionary * dic = @{@"token":Me.token};
    //
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomeModel * model = [HomeModel mj_objectWithKeyValues:responseObject];

            if ([model.code isEqual:@200]) {
                FPTTModel * fptt = [FPTTModel mj_objectWithKeyValues:responseObject[@"data"]];

                DanWei.textField.text = fptt.enter_name;
                NaShuiRen.textField.text = fptt.enter_taxpayerNum;
                GongSiDiZhi.textField.text = fptt.enter_priseAddress;
                GongSiDianHua.textField.text = fptt.enter_prisePhone;
                KaiHuHang.textField.text = fptt.enter_bankAccount;
                kaiZhangHao.textField.text = fptt.enter_bankNumber;
            }
        }else{
            
        }
    }];
}

- (void)addnav{
    nav = [UIView new];
    nav.backgroundColor = RGB(0xff, 0xff, 0xff);
    [self.view addSubview:nav];
    WS(ws);
    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(44+StatusBar);
    }];
    
    BaseButton * left = [BaseButton buttonWithType:UIButtonTypeCustom];
    [left addTarget:self action:@selector(leftBarButtonItenAction) forControlEvents:UIControlEventTouchUpInside];
    [left setImage:UIIMAGE("返回icon") forState:UIControlStateNormal];
    [self.view addSubview:left];
    [left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(StatusBar+4);
        make.left.equalTo(nav.mas_left).with.offset(12);
        make.height.mas_equalTo(@35);
    }];
    
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"发票抬头"];
    [self.view addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(nav.mas_bottom).with.offset(-10);
        make.centerX.mas_equalTo(nav.mas_centerX);
        
    }];
}
- (void)leftBarButtonItenAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addscrollView{
    WS(ws);
    static NSString * linshi = @"";
    scrollView = [UIScrollView new];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
        
    }];
    DanWei = [ShuRuView new];
    DanWei.style = TextFieldTime;
    DanWei.names = @"单位名称";
    DanWei.textField.text = linshi;
    [scrollView addSubview:DanWei];
    [DanWei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
    make.top.equalTo(scrollView.mas_top).with.offset(0);
    }];
    
    NaShuiRen = [ShuRuView new];
    NaShuiRen.style = TextFieldTime;
    NaShuiRen.names = @"纳税人识别号";
    NaShuiRen.textField.text = linshi;
    [scrollView addSubview:NaShuiRen];
    [NaShuiRen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(DanWei.mas_bottom).with.offset(0);
    }];
    
    GongSiDiZhi = [ShuRuView new];
    GongSiDiZhi.style = TextFieldTime;
    GongSiDiZhi.names = @"公司地址";
    GongSiDiZhi.textField.text = linshi;
    [scrollView addSubview:GongSiDiZhi];
    [GongSiDiZhi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(NaShuiRen.mas_bottom).with.offset(0);
    }];
    
    GongSiDianHua = [ShuRuView new];
    GongSiDianHua.style = TextFieldTime;
    GongSiDianHua.names = @"公司电话";
    GongSiDianHua.textField.text = linshi;
    [scrollView addSubview:GongSiDianHua];
    [GongSiDianHua mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(GongSiDiZhi.mas_bottom).with.offset(0);
    }];
    
    KaiHuHang = [ShuRuView new];
    KaiHuHang.style = TextFieldTime;
    KaiHuHang.names = @"开户行";
    KaiHuHang.textField.text = linshi;
    [scrollView addSubview:KaiHuHang];
    [KaiHuHang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(GongSiDianHua.mas_bottom).with.offset(0);
    }];
    
    kaiZhangHao = [ShuRuView new];
    kaiZhangHao.style = TextFieldTime;
    kaiZhangHao.names = @"开户行账号";
    kaiZhangHao.textField.text = linshi;
    [scrollView addSubview:kaiZhangHao];
    [kaiZhangHao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(KaiHuHang.mas_bottom).with.offset(0);
    }];
    
    // 生成二维码(Default)
//    [self setupGenerateQRCode];

}
#pragma mark ------- 生成二维码
// 生成二维码
- (void)setupGenerateQRCode {
    WS(ws);
    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 150;
    CGFloat imageViewH = imageViewW;
//    CGFloat imageViewX = (self.view.frame.size.width - imageViewW) / 2;
//    CGFloat imageViewY = 80;
//    imageView.frame =CGRectMake(imageViewX, 300, imageViewW, imageViewH);
    [scrollView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(kaiZhangHao.mas_bottom).with.offset(30);
        make.centerX.equalTo(ws.view);
        make.width.mas_equalTo(imageViewW);
        make.height.mas_equalTo(imageViewH);
    make.bottom.equalTo(scrollView.mas_bottom).with.offset(-100);

        
    }];
    // 2、将CIImage转换成UIImage，并放大显示
    imageView.image = [SGQRCodeGenerateManager generateWithDefaultQRCodeData:@"阿斯加德就按实际大厦将颠按时间段来看记录卡聚少离多卡离开多久啊来得及案例是可敬的按理说空间大老实交代阿里看见的阿拉基德拉科将拉开几点啦建档立卡几点啦家里看到拉开几点啦看" imageViewWidth:imageViewW];
    
#pragma mark - - - 模仿支付宝二维码样式（添加用户头像）
    CGFloat scale = 0.22;
    CGFloat borderW = 5;
    UIView *borderView = [[UIView alloc] init];
    CGFloat borderViewW = imageViewW * scale;
    CGFloat borderViewH = imageViewH * scale;
    CGFloat borderViewX = 0.5 * (imageViewW - borderViewW);
    CGFloat borderViewY = 0.5 * (imageViewH - borderViewH);
    borderView.frame = CGRectMake(borderViewX, borderViewY, borderViewW, borderViewH);
    borderView.layer.borderWidth = borderW;
    borderView.layer.borderColor = [UIColor purpleColor].CGColor;
    borderView.layer.cornerRadius = 10;
    borderView.layer.masksToBounds = YES;
    borderView.layer.contents = (id)[UIImage imageNamed:@"logo"].CGImage;
    
//    [imageView addSubview:borderView];
}


- (void)ClickModel:(ALlModel *)model Style:(Click)style{
    switch (style) {
        case ClickancTime:
            [self time];
            break;
            
        default:
            break;
    }
}
- (void)time{

    [DanWei.textField resignFirstResponder];
    [NaShuiRen.textField resignFirstResponder];
    [GongSiDiZhi.textField resignFirstResponder];
    [GongSiDianHua.textField resignFirstResponder];
    [KaiHuHang.textField resignFirstResponder];
    [kaiZhangHao.textField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

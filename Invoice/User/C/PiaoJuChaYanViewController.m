//
//  PiaoJuChaYanViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/16.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PiaoJuChaYanViewController.h"
#import "ShuRuView.h"
#import "DatePickerView.h"
#import "FaPiaoXQViewController.h"
@interface PiaoJuChaYanViewController ()<UIScrollViewDelegate>{
    UIView * nav;
    UIScrollView * scrollView;
    NSMutableArray * Viewarray;
    ShuRuView * kaipiantime;
    ShuRuView * buhanshuijine;
    ShuRuView * fapiaodaima;
    ShuRuView * fapiaohaoma;
    ShuRuView * xiaoyanma;

    
}
@property (nonatomic,strong) DatePickerView *datePicker;

@end

@implementation PiaoJuChaYanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    [self addnav];
    [self addscrollView];
    
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
    
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"票据查验"];
    [self.view addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(nav.mas_bottom).with.offset(-10);
        make.centerX.mas_equalTo(nav.mas_centerX);
        
    }];
}
- (void)leftBarButtonItenAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonItenAction{
    NSMutableArray * NeiRongarray = [NSMutableArray array];
    for (ShuRuView * view in Viewarray) {
        NSString * str = view.textField.text;
        [NeiRongarray addObject:str];
    }
    MJExtensionLog(@"%@",NeiRongarray);
}
- (void)addscrollView{
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
        
    }];
    //    UIView * vi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    //    [scrollView addSubview:vi];
    
    
    Viewarray = [NSMutableArray array];
    fapiaodaima = [ShuRuView new];
    fapiaodaima.style = TextFieldShuZi;
    fapiaodaima.title = @"请输入发票代码";
    fapiaodaima.names = @"发票代码";
    [scrollView addSubview:fapiaodaima];
    [fapiaodaima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(scrollView.mas_top).with.offset(0);
    }];
    [Viewarray addObject:fapiaodaima];
    
    fapiaohaoma = [ShuRuView new];
    fapiaohaoma.style = TextFieldShuZi;
    fapiaohaoma.title = @"请输入发票号码";
    fapiaohaoma.names = @"发票号码";
    [scrollView addSubview:fapiaohaoma];
    [fapiaohaoma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(fapiaodaima.mas_bottom).with.offset(0);
    }];
    [Viewarray addObject:fapiaohaoma];
    
    
    kaipiantime = [ShuRuView new];
    kaipiantime.style = TextFieldTime;
    kaipiantime.title = @"请选择开票时间";
    kaipiantime.names = @"开票时间";
    kaipiantime.delegate = self;
    [scrollView addSubview:kaipiantime];
    [kaipiantime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(fapiaohaoma.mas_bottom).with.offset(0);
    }];
    [Viewarray addObject:kaipiantime];
    
    buhanshuijine = [ShuRuView new];
    buhanshuijine.style = TextFieldShuZi;
    buhanshuijine.title = @"请输入不含税金额";
    buhanshuijine.names = @"不含税金额";
    [scrollView addSubview:buhanshuijine];
    [buhanshuijine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(kaipiantime.mas_bottom).with.offset(0);
    }];
    [Viewarray addObject:buhanshuijine];
    
    xiaoyanma = [ShuRuView new];
    xiaoyanma.style = TextFieldShuZi;
    xiaoyanma.title = @"请输入校验码后6位,如无可不填";
    xiaoyanma.names = @"校验码";
    [scrollView addSubview:xiaoyanma];
    [xiaoyanma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(buhanshuijine.mas_bottom).with.offset(0);
        make.bottom.equalTo(scrollView.mas_bottom).with.offset(-500);
    }];
    [Viewarray addObject:kaipiantime];
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(huishoujianpan)];
    //将手势添加到需要相应的view中去
    scrollView.userInteractionEnabled = YES;
    [scrollView addGestureRecognizer:tapGesture1];
    BaseLabel * ChongZhi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"重置"];
    ChongZhi.backgroundColor = RGB(0xf9, 0x71, 0x2c);
    ChongZhi.layer.masksToBounds = YES;
    ChongZhi.layer.cornerRadius = 2;
    ChongZhi.userInteractionEnabled = YES;
    [self.view addSubview:ChongZhi];

    
    BaseLabel * QueDing = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"确定"];
    QueDing.backgroundColor = RGB(0xf9, 0x71, 0x2c);
    QueDing.layer.masksToBounds = YES;
    QueDing.layer.cornerRadius = 2;
    QueDing.userInteractionEnabled = YES;
    [self.view addSubview:QueDing];
    
    [ChongZhi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(xiaoyanma.mas_bottom).with.offset(20);
        make.left.equalTo(ws.view).with.offset(15);
        make.right.equalTo(QueDing.mas_left).with.offset(-15);

        make.height.mas_equalTo(@44);
    }];
    
    [QueDing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(xiaoyanma.mas_bottom).with.offset(20);
        make.right.equalTo(ws.view).with.offset(-15);

        make.height.mas_equalTo(@44);
        make.width.mas_equalTo(ChongZhi);
    }];
    
    //添加手势
    UITapGestureRecognizer * ChongzhiGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Chongzhi)];
    //将手势添加到需要相应的view中去
    [ChongZhi addGestureRecognizer:ChongzhiGesture];
    
    //添加手势
    UITapGestureRecognizer * Qudingtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadRequestData)];
    //将手势添加到需要相应的view中去
    [QueDing addGestureRecognizer:Qudingtap];
    
}
- (void)huishoujianpan{
    [kaipiantime.textField resignFirstResponder];
    [buhanshuijine.textField resignFirstResponder];
    [fapiaodaima.textField resignFirstResponder];
    [fapiaohaoma.textField resignFirstResponder];
    [xiaoyanma.textField resignFirstResponder];
    
}
- (void)Chongzhi{
    kaipiantime.textField.text = @"";
    buhanshuijine.textField.text = @"";
    fapiaodaima.textField.text = @"";
    fapiaohaoma.textField.text = @"";
    xiaoyanma.textField.text = @"";

}
- (void)loadRequestData{
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
    NSDictionary * dic = @{@"token":Me.token,@"num":@"15",@"fpdm":fapiaodaima.textField.text,@"fphm":fapiaohaoma.textField.text,@"jym":xiaoyanma.textField.text,@"fpje":buhanshuijine.textField.text,@"kprq":kaipiantime.textField.text};
    //
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
    [kaipiantime.textField resignFirstResponder];
    [buhanshuijine.textField resignFirstResponder];
    [fapiaodaima.textField resignFirstResponder];
    [fapiaohaoma.textField resignFirstResponder];
    [xiaoyanma.textField resignFirstResponder];

    WS(weakself);
    self.datePicker =[[[NSBundle mainBundle] loadNibNamed:@"DatePickerView" owner:self options:0] lastObject];
    self.datePicker.frame =CGRectMake(0, self.view.frame.size.height-260, self.view.frame.size.width, 260);
    self.datePicker.Datetitle =@"日期选择";
    self.datePicker.cancelBlock = ^{
        [UIView animateWithDuration:5 animations:^{
            [weakself.datePicker removeFromSuperview];
        }];
    };
    self.datePicker.sureBlock = ^(NSString *selectDateStr) {
        kaipiantime.textField.text = selectDateStr;
        [UIView animateWithDuration:5 animations:^{
            [weakself.datePicker removeFromSuperview];
        }];
    };
    [self.view addSubview:self.datePicker];

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

@end

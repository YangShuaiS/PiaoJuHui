//
//  FaPiaoXQViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FaPiaoXQViewController.h"
#import "CaiDanView.h"
#import "YHPhotoBrowser.h"
@interface FaPiaoXQViewController ()<UIScrollViewDelegate>{
    UIView * nav;
    UIScrollView * scrollView;
    CaiDanView * fp;
}

@end

@implementation FaPiaoXQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addnav];
    [self addview];
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
    
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"发票详情"];
    [self.view addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(nav.mas_bottom).with.offset(-10);
        make.centerX.mas_equalTo(nav.mas_centerX);
    }];
    
//    BaseButton * right = [BaseButton buttonWithType:UIButtonTypeCustom];
//    [right addTarget:self action:@selector(remo) forControlEvents:UIControlEventTouchUpInside];
//    [right setTitle:@"删除" forState:UIControlStateNormal];
//    [right setTitleColor:RGB(0xf9, 0x71, 0x2c) forState:UIControlStateNormal];
//    right.titleLabel.font = TextFont(15);
//
//    [nav addSubview:right];
//    [right mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        //        make.bottom.equalTo(nav.mas_bottom).with.offset(-14);
//        make.centerY.mas_equalTo(left.mas_centerY);
//        
//        make.right.equalTo(ws.view).with.offset(-15);
//        //        make.width.mas_equalTo(@35);
//    }];

}

- (void)leftBarButtonItenAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)remo{
    
}
- (void)addview{
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = RGB(0xee, 0xee, 0xee);

    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_bottom).with.offset(1);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
//    NSMutableArray * xqarray = [NSMutableArray array];
//    for (int i = 0; i<1; i++) {
//        CaiDanView * xqview = [CaiDanView new];
//        xqview.ZK = YES;
//        [scrollView addSubview:xqview];
//        [xqarray addObject:xqview];
//    }
//
//    [xqarray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:0 leadSpacing:10 tailSpacing:10];
//    [xqarray mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws).with.offset(0);
//        make.right.equalTo(ws).with.offset(0);
//    }];
    
    
    CaiDanView * fpxq = [CaiDanView new];
    fpxq.titletxe = @"发票信息";
    fpxq.titlearray = (NSMutableArray*)@[@"发票代码",@"发票号码",@"开票时间",@"校验码",@"不含税金额"];
    fpxq.ZK = NO;
    [scrollView addSubview:fpxq];
    [fpxq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollView).with.offset(10);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
    }];
    
    fp = [CaiDanView new];
    fp.titletxe = @"发票";
    fp.ZK = NO;
    [scrollView addSubview:fp];
    [fp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fpxq.mas_bottom).with.offset(10);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
    }];
    //添加手势
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fpxq)];
    //将手势添加到需要相应的view中去
    [fp addGestureRecognizer:tapGesture];
    
    CaiDanView * zyzt = [CaiDanView new];
    zyzt.titletxe = @"查验状态";
    zyzt.ZK = NO;
    [scrollView addSubview:zyzt];
    [zyzt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fp.mas_bottom).with.offset(10);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        
    }];
    
    CaiDanView * ShangPin = [CaiDanView new];
    ShangPin.titletxe = @"商品信息";
    ShangPin.titlearray = (NSMutableArray*)@[@"名称",@"规格型号",@"单位",@"数量",@"单价",@"金额",@"税率",@"税额",@"合计金额",@"合计税额",@"价税合计"];
    ShangPin.ZK = YES;
    [scrollView addSubview:ShangPin];
    [ShangPin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(zyzt.mas_bottom).with.offset(10);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);

    }];
    
    
        CaiDanView * GouFang = [CaiDanView new];
        GouFang.titletxe = @"购方信息";
        GouFang.titlearray = (NSMutableArray*)@[@"名称",@"纳税识别号",@"地址电话",@"开户行账号"];
        GouFang.ZK = YES;
        [scrollView addSubview:GouFang];
        [GouFang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ShangPin.mas_bottom).with.offset(10);
            make.left.equalTo(ws.view).with.offset(0);
            make.right.equalTo(ws.view).with.offset(0);
        }];
    
        CaiDanView * XIaoFang = [CaiDanView new];
        XIaoFang.titletxe = @"销方信息";
        XIaoFang.titlearray = (NSMutableArray*)@[@"名称",@"纳税识别号",@"地址电话",@"开户行账号"];
        XIaoFang.ZK = YES;
        [scrollView addSubview:XIaoFang];
        [XIaoFang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(GouFang.mas_bottom).with.offset(10);
            make.left.equalTo(ws.view).with.offset(0);
            make.right.equalTo(ws.view).with.offset(0);
        }];
    
        CaiDanView * qita = [CaiDanView new];
        qita.titletxe = @"其他信息";
        qita.titlearray = (NSMutableArray*)@[@"其他"];
        qita.ZK = YES;
        [scrollView addSubview:qita];
        [qita mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(XIaoFang.mas_bottom).with.offset(10);
            make.left.equalTo(ws.view).with.offset(0);
            make.right.equalTo(ws.view).with.offset(0);
            make.bottom.equalTo(scrollView.mas_bottom).with.offset(-5);
        }];
    
    fpxq.typefp = _fptype;
    fp.typefp = _fptype;
    zyzt.typefp = _fptype;
    ShangPin.typefp = _fptype;
    GouFang.typefp = _fptype;
    XIaoFang.typefp = _fptype;
    qita.typefp = _fptype;
    

    if ([_fptype isEqualToString:@"02"]) {
    }
    if ([_fptype isEqualToString:@"03"]) {
        
        fpxq.subtitlearray = (NSMutableArray*)@[_jdcmodel.fpdm,_jdcmodel.fphm,_jdcmodel.kprq,@"",_jdcmodel.jshj];
        ShangPin.subtitlearray = (NSMutableArray*)@[_jdcmodel.cllx,_jdcmodel.cpxh,_jdcmodel.dw,@"1",_jdcmodel.jshj,_jdcmodel.jshj,_jdcmodel.zzssl,_jdcmodel.zzsse,_jdcmodel.jshj,_jdcmodel.zzsse,_jdcmodel.jshj];
        qita.subtitlearray = (NSMutableArray*)@[@"无"];
        XIaoFang.subtitlearray = (NSMutableArray*)@[_jdcmodel.xhdwmc,_jdcmodel.nsrsbh,_jdcmodel.xsf_dzdh,_jdcmodel.xsf_yhzh];
        GouFang.subtitlearray = (NSMutableArray*)@[_jdcmodel.ghdw,_jdcmodel.gfsbh,@"",@""];

        
        fpxq.jdcmodel = _jdcmodel;
        fp.jdcmodel = _jdcmodel;
        zyzt.jypd = _jdcmodel.re_checkresult;
        zyzt.jdcmodel = _jdcmodel;
        ShangPin.jdcmodel = _jdcmodel;
        GouFang.jdcmodel = _jdcmodel;
        XIaoFang.jdcmodel = _jdcmodel;
        qita.jdcmodel = _jdcmodel;
        
    }
    if ([_fptype isEqualToString:@"04"]||[_fptype isEqualToString:@"01"]||[_fptype isEqualToString:@"10"]||[_fptype isEqualToString:@"11"]||[_fptype isEqualToString:@"14"]) {
        xmdataa * da =  _zzptmodel.xmdata[0];
//        if (_zzptmodel.jehj==nil) {
//            _zzptmodel.jehj = @"";
//        }
        fpxq.subtitlearray = (NSMutableArray*)@[_zzptmodel.fpdm,_zzptmodel.fphm,_zzptmodel.kprq,_zzptmodel.jym,da.xmje];

        ShangPin.subtitlearray = (NSMutableArray*)@[da.xmmc,da.ggxh,da.dw,da.xmsl,da.xmdj,da.xmje,da.slv,da.se,_zzptmodel.jehj,_zzptmodel.sehj,_zzptmodel.jshj];
        qita.subtitlearray = (NSMutableArray*)@[_zzptmodel.bz];
        XIaoFang.subtitlearray = (NSMutableArray*)@[_zzptmodel.xfmc,_zzptmodel.xfsbh,_zzptmodel.xfdzdh,_zzptmodel.xfyhzh];
        GouFang.subtitlearray = (NSMutableArray*)@[_zzptmodel.gfmc,_zzptmodel.gfsbh,_zzptmodel.gfdzdh,_zzptmodel.gfyhzh];
        
        
        fpxq.zzptmodel = _zzptmodel;
        fp.zzptmodel = _zzptmodel;
        zyzt.jypd = _zzptmodel.re_checkresult;
        zyzt.zzptmodel = _zzptmodel;
        ShangPin.zzptmodel = _zzptmodel;
        GouFang.zzptmodel = _zzptmodel;
        XIaoFang.zzptmodel = _zzptmodel;
        qita.zzptmodel = _zzptmodel;
    }else{
//        fpxq.subtitlearray = (NSMutableArray*)@[_zzptmodel.fpdm,_zzptmodel.fphm,_zzptmodel.kprq,_zzptmodel.jym,_zzptmodel.jshj];
//        xmdataa * da =  _zzptmodel.xmdata[0];
//        //        if (_zzptmodel.jehj==nil) {
//        //            _zzptmodel.jehj = @"";
//        //        }
//        ShangPin.subtitlearray = (NSMutableArray*)@[da.xmmc,da.ggxh,da.dw,da.xmsl,da.xmdj,da.xmje,da.slv,da.se,_zzptmodel.jehj,_zzptmodel.sehj,_zzptmodel.jshj];
//        qita.subtitlearray = (NSMutableArray*)@[_zzptmodel.bz];
//        XIaoFang.subtitlearray = (NSMutableArray*)@[_zzptmodel.xfmc,_zzptmodel.xfsbh,_zzptmodel.xfdzdh,_zzptmodel.xfyhzh];
//        GouFang.subtitlearray = (NSMutableArray*)@[_zzptmodel.gfmc,_zzptmodel.gfsbh,_zzptmodel.gfdzdh,_zzptmodel.gfyhzh];
//        
//        
//        fpxq.zzptmodel = _zzptmodel;
//        fp.zzptmodel = _zzptmodel;
//        zyzt.jypd = _zzptmodel.re_checkresult;
//        zyzt.zzptmodel = _zzptmodel;
//        ShangPin.zzptmodel = _zzptmodel;
//        GouFang.zzptmodel = _zzptmodel;
//        XIaoFang.zzptmodel = _zzptmodel;
//        qita.zzptmodel = _zzptmodel;
    }
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
- (void)fpxq{
    YHPhotoBrowser *photoView=[[YHPhotoBrowser alloc]init];
    UIView * image = fp.FaPiao;
    
        UIGraphicsBeginImageContextWithOptions(image.frame.size, NO, 0.0);
        [image.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *images = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    photoView.ima = images;
    [photoView show];
}
@end

//
//  MyInvoiceView.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/15.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyInvoiceView.h"

@implementation MyInvoiceView{
    BaseLabel * FaPiaoLeixing ;//发票类型
    BaseLabel * Jqbianhao ;//机器编号
    BaseLabel * Fapiaodaima;//发票代码
    BaseLabel * Fapiaohaoma;//发票号码
    BaseLabel * Kaipiaoriqi;//开票日期
    BaseLabel * Xiaoyanma;//校验码
    BaseLabel * TopName;//上名称
    BaseLabel * TopShiBieHao;//上识别号
    BaseLabel * TopPhone;//上地址电话
    BaseLabel * TopYinHangHao;//上银行账号
    BaseLabel * HuoWu;//货物
    BaseLabel * GuiGe;//规格
    BaseLabel * DanWei;//单位
    BaseLabel * ShuLiang;//数量
    BaseLabel * Danjia;//单价
    BaseLabel * Jine;//金额
    BaseLabel * ShuiLv;//税率
    BaseLabel * ShuiE;//税额
    BaseLabel * JiaShuiHeJi;//价税合计
    BaseLabel * DownName;//上名称
    BaseLabel * DownShiBieHao;//上识别号
    BaseLabel * DownPhone;//上地址电话
    BaseLabel * DownYinHangHao;//上银行账号
    BaseLabel * BeiZhu;//备注
    BaseLabel * ShouKuanRen;//收款人
    BaseLabel * FuHe;//上银行复合号
    BaseLabel * KaiPiaoRen;//开票人
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self buju];
    }
    return self;
}

-(void)buju{
    self.backgroundColor = [UIColor whiteColor];
    static NSString * linshi = @"1239999999999999999999999999999999999999999";
    static CGFloat width = 33;
    static CGFloat minziti = 5 ;
    WS(ws);
    FLAnimatedImageView* erweima = [FLAnimatedImageView new];
    erweima.image = UIIMAGE("1521521080948_.pic_hd");
    [self addSubview:erweima];
    [erweima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(5);
        make.left.equalTo(ws).with.offset(5);
        make.width.mas_equalTo(47);
        make.height.mas_equalTo(47);
    }];
    
    FLAnimatedImageView* tuoyuanzhang = [FLAnimatedImageView new];
    tuoyuanzhang.image = UIIMAGE("1531521080952_.pic_hd");
    [self addSubview:tuoyuanzhang];
    [tuoyuanzhang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(25);
        make.centerX.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
    }];
    
    FaPiaoLeixing = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"增值税普通发票"];
    [self addSubview:FaPiaoLeixing];
    [FaPiaoLeixing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(20);
        make.centerX.equalTo(ws).with.offset(0);
    }];
    
    UIView * onexian = [UIView new];
    onexian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:onexian];
    [onexian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(FaPiaoLeixing.mas_bottom).with.offset(5);
        make.centerX.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(1);

    }];
    
    UIView * twoxian = [UIView new];
    twoxian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:twoxian];
    [twoxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(onexian.mas_bottom).with.offset(1);
        make.centerX.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(1);
        
    }];
    
    BaseLabel * jiqibh = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor blackColor] LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"机器编号:"];
    [self addSubview:jiqibh];
    [jiqibh mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(erweima.mas_bottom).with.offset(3);
        make.left.equalTo(ws).with.offset(5);
    }];
    
    Jqbianhao = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor blackColor] LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"99999999999999999999"];
    [self addSubview:Jqbianhao];
    [Jqbianhao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(erweima.mas_bottom).with.offset(3);
        make.left.equalTo(jiqibh.mas_right).with.offset(5);
        
    }];
    
    BaseLabel * fapiaodaima = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"发票代码:"];
    [self addSubview:fapiaodaima];
    [fapiaodaima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(10);
    make.left.equalTo(onexian.mas_right).with.offset(3);
    }];
    
    Fapiaodaima = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor blackColor] LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"99999999999"];
    [self addSubview:Fapiaodaima];
    [Fapiaodaima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(10);
        make.left.equalTo(fapiaodaima.mas_right).with.offset(3);
    }];
    
    BaseLabel * fapiaohaoma = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"发票号码:"];
    [self addSubview:fapiaohaoma];
    [fapiaohaoma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fapiaodaima.mas_bottom).with.offset(3);
        make.left.equalTo(onexian.mas_right).with.offset(5);
    }];
    Fapiaohaoma = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor blackColor] LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"99999999999"];
    [self addSubview:Fapiaohaoma];
    [Fapiaohaoma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fapiaodaima.mas_bottom).with.offset(3);
        make.left.equalTo(fapiaohaoma.mas_right).with.offset(3);
    }];
    
    BaseLabel * kaipiaoriiq = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"开票日期:"];
    [self addSubview:kaipiaoriiq];
    [kaipiaoriiq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fapiaohaoma.mas_bottom).with.offset(3);
        make.left.equalTo(onexian.mas_right).with.offset(5);
    }];
    
    Kaipiaoriqi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor blackColor] LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"99999999999"];
    [self addSubview:Kaipiaoriqi];
    [Kaipiaoriqi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fapiaohaoma.mas_bottom).with.offset(3);
        make.left.equalTo(kaipiaoriiq.mas_right).with.offset(3);
    }];
    
    BaseLabel *
    xiaoyanma= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"校验码:"];
    [self addSubview:xiaoyanma];
    [xiaoyanma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(kaipiaoriiq.mas_bottom).with.offset(3);
        make.left.equalTo(onexian.mas_right).with.offset(5);
    }];
    
    Xiaoyanma = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor blackColor] LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"999999999990000000000"];
    [self addSubview:Xiaoyanma];
    [Xiaoyanma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(kaipiaoriiq.mas_bottom).with.offset(3);
        make.left.equalTo(xiaoyanma.mas_right).with.offset(3);

    }];
    
#pragma mark -------------- 1层视图
    UIView * oneshuxian = [UIView new];
    oneshuxian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:oneshuxian];
    
    UIView * twoshuxian = [UIView new];
    twoshuxian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:twoshuxian];
    
    
    UIView * oneHengXian = [UIView new];
    oneHengXian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:oneHengXian];
    [oneHengXian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Jqbianhao.mas_bottom).with.offset(5);
        make.left.equalTo(ws).with.offset(5);
        make.right.equalTo(ws).with.offset(-5);
        make.height.mas_equalTo(1);

    }];
    
    BaseLabel *mingcheng = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"名            称:"];
    [self addSubview:mingcheng];
    [mingcheng mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneHengXian.mas_bottom).with.offset(5);
        make.left.equalTo(ws).with.offset(5+23);
        make.width.mas_equalTo(width);
    }];
    
    TopName = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:linshi];
    [self addSubview:TopName];
    [TopName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneHengXian.mas_bottom).with.offset(5);
        make.left.equalTo(mingcheng.mas_right).with.offset(2);

    }];
    
    BaseLabel *nashuirenshibiehao= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"纳税人识别号:"];
    [self addSubview:nashuirenshibiehao];
    [nashuirenshibiehao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mingcheng.mas_bottom).with.offset(1);
        make.left.equalTo(ws).with.offset(5+23);
        make.width.mas_equalTo(width);

    }];
    
    TopShiBieHao = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:linshi];
    [self addSubview:TopShiBieHao];
    [TopShiBieHao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mingcheng.mas_bottom).with.offset(1);
        make.left.equalTo(nashuirenshibiehao.mas_right).with.offset(2);
    }];
    
    BaseLabel *dizhidianhua= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"地  址  电  话:"];
    [self addSubview:dizhidianhua];
    [dizhidianhua mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nashuirenshibiehao.mas_bottom).with.offset(1);
        make.left.equalTo(ws).with.offset(5+23);
        make.width.mas_equalTo(width);

    }];
    
    TopPhone = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:linshi];
    [self addSubview:TopPhone];
    [TopPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nashuirenshibiehao.mas_bottom).with.offset(1);
        make.left.equalTo(dizhidianhua.mas_right).with.offset(2);
    }];
    
    
    BaseLabel *kaihuhangzhanghao= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"开户行  账号 :"];
    [self addSubview:kaihuhangzhanghao];
    [kaihuhangzhanghao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dizhidianhua.mas_bottom).with.offset(1);
        make.left.equalTo(ws).with.offset(5+23);
        make.width.mas_equalTo(width);

    }];
    
    TopYinHangHao = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:linshi];
    [self addSubview:TopYinHangHao];
    [TopYinHangHao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dizhidianhua.mas_bottom).with.offset(1);
        make.left.equalTo(kaihuhangzhanghao.mas_right).with.offset(2);
    }];
    
    
    
    UIView * twoHengXian = [UIView new];
    twoHengXian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:twoHengXian];
    [twoHengXian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(kaihuhangzhanghao.mas_bottom).with.offset(5);
        make.left.equalTo(ws).with.offset(5);
        make.right.equalTo(ws).with.offset(-5);
        make.height.mas_equalTo(1);
        
    }];
    
    UIView * oneonexian = [UIView new];
    oneonexian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:oneonexian];
    [oneonexian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneHengXian.mas_bottom).with.offset(0);
        make.left.equalTo(ws).with.offset(5+20);
        make.width.mas_equalTo(1);
 make.bottom.equalTo(twoHengXian.mas_top).with.offset(0);
    }];
    
    BaseLabel *goumaifang= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"购买方"];
    goumaifang.numberOfLines = 4;
    [self addSubview:goumaifang];
    [goumaifang mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(oneHengXian.mas_bottom).with.offset(0);
        make.left.equalTo(ws).with.offset(5+5);
        make.width.mas_equalTo(10);
    make.bottom.equalTo(twoHengXian.mas_top).with.offset(0);
    }];
    
    UIView * onetwoxian = [UIView new];
    onetwoxian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:onetwoxian];
    [onetwoxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneHengXian.mas_bottom).with.offset(0);
//        make.left.equalTo(ws).with.offset(5+20);
        make.right.equalTo(ws).with.offset(-5-130);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(twoHengXian.mas_top).with.offset(0);
    }];
    
    UIView * onethreexian = [UIView new];
    onethreexian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:onethreexian];
    [onethreexian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneHengXian.mas_bottom).with.offset(0);
        //        make.left.equalTo(ws).with.offset(5+20);
        make.right.equalTo(ws).with.offset(-5-130-20);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(twoHengXian.mas_top).with.offset(0);
    }];
    
    BaseLabel *mimaqu= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"密码区"];
    mimaqu.numberOfLines = 4;
    [self addSubview:mimaqu];
    [mimaqu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneHengXian.mas_bottom).with.offset(0);
        make.left.equalTo(onethreexian.mas_right).with.offset(5);
        make.width.mas_equalTo(10);
        make.bottom.equalTo(twoHengXian.mas_top).with.offset(0);
    }];
    
#pragma mark -------------- 2层视图

    UIView * threeHengXian = [UIView new];
    threeHengXian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:threeHengXian];
    [threeHengXian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(100);
        make.left.equalTo(ws).with.offset(5);
        make.right.equalTo(ws).with.offset(-5);
        make.height.mas_equalTo(1);
    }];
    
    UIView * twoonexian = [UIView new];
    twoonexian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:twoonexian];
    
    UIView * twotwoxian = [UIView new];
    twotwoxian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:twotwoxian];
    
    UIView * twothreexian = [UIView new];
    twothreexian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:twothreexian];
    UIView * twofourxian = [UIView new];
    twofourxian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:twofourxian];
    UIView * twofivexian = [UIView new];
    twofivexian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:twofivexian];
    UIView * twosixian = [UIView new];
    twosixian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:twosixian];
    UIView * twosevenxian = [UIView new];
    twosevenxian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:twosevenxian];
    
    CGFloat twofen = 26;
    [twoonexian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(0);
    make.left.equalTo(oneshuxian.mas_right).with.offset((WIDTH-10)/twofen*6);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(threeHengXian.mas_top).with.offset(0);
    }];
    
    [twotwoxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(0);
        make.left.equalTo(twoonexian.mas_right).with.offset((WIDTH-10)/twofen*4);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(threeHengXian.mas_top).with.offset(0);
    }];
    
    [twothreexian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(0);
        make.left.equalTo(twotwoxian.mas_right).with.offset((WIDTH-10)/23);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(threeHengXian.mas_top).with.offset(0);
    }];
    
    [twofourxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(0);
        make.left.equalTo(twothreexian.mas_right).with.offset((WIDTH-10)/twofen*3);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(threeHengXian.mas_top).with.offset(0);
    }];
    
    [twofivexian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(0);
        make.left.equalTo(twofourxian.mas_right).with.offset((WIDTH-10)/twofen*3);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(threeHengXian.mas_top).with.offset(0);
    }];
    
    [twosixian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(0);
        make.left.equalTo(twofivexian.mas_right).with.offset((WIDTH-10)/twofen*4);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(threeHengXian.mas_top).with.offset(0);
    }];
    
    [twosevenxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(0);
        make.left.equalTo(twosixian.mas_right).with.offset((WIDTH-10)/twofen);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(threeHengXian.mas_top).with.offset(0);
    }];
    
    BaseLabel *huowumingcheng= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"货物或应税劳务，服务名称"];
    huowumingcheng.numberOfLines = 2;
    [self addSubview:huowumingcheng];
    
    HuoWu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:linshi];
    HuoWu.numberOfLines = 4;
    [self addSubview:HuoWu];

    
    BaseLabel *guigexinghao= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"规格型号"];
    guigexinghao.numberOfLines = 4;
    [self addSubview:guigexinghao];
    
    GuiGe = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:linshi];
    GuiGe.numberOfLines = 4;
    [self addSubview:GuiGe];
    
    BaseLabel *danwei= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"单位"];
    danwei.numberOfLines = 2;
    [self addSubview:danwei];
    
    DanWei = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:linshi];
    DanWei.numberOfLines = 4;
    [self addSubview:DanWei];
    
    BaseLabel *shuliang= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"数量"];
    shuliang.numberOfLines = 2;
    [self addSubview:shuliang];
    
    ShuLiang = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:linshi];
    ShuLiang.numberOfLines = 4;
    [self addSubview:ShuLiang];
    
    BaseLabel *danjia= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"单价"];
    danjia.numberOfLines = 2;
    [self addSubview:danjia];
    
    Danjia = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:linshi];
    Danjia.numberOfLines = 4;
    [self addSubview:Danjia];
    
    BaseLabel *jine= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"金额"];
    jine.numberOfLines = 2;
    [self addSubview:jine];
    
    Jine = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:linshi];
    Jine.numberOfLines = 4;
    [self addSubview:Jine];
    
    BaseLabel *shuilv= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"税率"];
    shuilv.numberOfLines = 2;
    [self addSubview:shuilv];
    
    ShuiLv = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:linshi];
    ShuiLv.numberOfLines = 4;
    [self addSubview:ShuiLv];
    
    BaseLabel *shuie= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"税额"];
    shuie.numberOfLines = 2;
    [self addSubview:shuie];
    
    ShuiE = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:linshi];
    ShuiE.numberOfLines = 4;
    [self addSubview:ShuiE];
    
    [huowumingcheng mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(3);
        make.left.equalTo(oneshuxian.mas_right).with.offset(0);
        make.width.mas_equalTo((WIDTH-10)/twofen*6);
    }];
    
    [HuoWu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(huowumingcheng.mas_bottom).with.offset(3);
        make.left.equalTo(oneshuxian.mas_right).with.offset(3);
        make.width.mas_equalTo((WIDTH-10)/twofen*6-6);
    }];
    
    
    
    [guigexinghao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(3);
        make.left.equalTo(twoonexian.mas_right).with.offset(0);
        make.width.mas_equalTo((WIDTH-10)/twofen*3);
    }];
    
    [GuiGe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(guigexinghao.mas_bottom).with.offset(3);
        make.left.equalTo(twoonexian.mas_right).with.offset(3);
        make.width.mas_equalTo((WIDTH-10)/twofen*3-6);
    }];
    
    [danwei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(3);
        make.left.equalTo(twotwoxian.mas_right).with.offset(0);
        make.width.mas_equalTo((WIDTH-10)/twofen);
    }];
    
    [DanWei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(danwei.mas_bottom).with.offset(3);
        make.left.equalTo(twotwoxian.mas_right).with.offset(0);
        make.width.mas_equalTo((WIDTH-10)/twofen);
    }];
    
    
    [shuliang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(3);
        make.left.equalTo(twothreexian.mas_right).with.offset(0);
        make.width.mas_equalTo((WIDTH-10)/twofen*3);
    }];
    
    [ShuLiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shuliang.mas_bottom).with.offset(3);
        make.left.equalTo(twothreexian.mas_right).with.offset(3);
        make.width.mas_equalTo((WIDTH-10)/twofen*3-6);
    }];
    
    [danjia mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(3);
        make.left.equalTo(twofourxian.mas_right).with.offset(0);
        make.width.mas_equalTo((WIDTH-10)/twofen*3);
    }];
    
    [Danjia mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(danjia.mas_bottom).with.offset(3);
        make.left.equalTo(twofourxian.mas_right).with.offset(3);
        make.width.mas_equalTo((WIDTH-10)/twofen*3-6);
    }];
    
    [jine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(3);
        make.left.equalTo(twofivexian.mas_right).with.offset(0);
        make.width.mas_equalTo((WIDTH-10)/twofen*4);
    }];
    
    [Jine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(jine.mas_bottom).with.offset(3);
        make.left.equalTo(twofivexian.mas_right).with.offset(3);
        make.width.mas_equalTo((WIDTH-10)/twofen*4-6);
    }];
    
    [shuilv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(3);
        make.left.equalTo(twosixian.mas_right).with.offset(0);
        make.width.mas_equalTo((WIDTH-10)/twofen);
    }];
    
    [ShuiLv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shuilv.mas_bottom).with.offset(3);
        make.left.equalTo(twosixian.mas_right).with.offset(0);
        make.width.mas_equalTo((WIDTH-10)/twofen);
    }];
    
    
    [shuie mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoHengXian.mas_bottom).with.offset(3);
        make.left.equalTo(twosevenxian.mas_right).with.offset(0);
        make.width.mas_equalTo((WIDTH-10)/twofen*4);
    }];
    
    [ShuiE mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shuie.mas_bottom).with.offset(3);
        make.left.equalTo(twosevenxian.mas_right).with.offset(3);
        make.width.mas_equalTo((WIDTH-10)/twofen*4-12);
    }];
#pragma mark -------------- 3层视图
    BaseLabel *shuijiaheji= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"价税合计"];
    shuijiaheji.numberOfLines = 2;
    [self addSubview:shuijiaheji];
    
    [shuijiaheji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(threeHengXian.mas_bottom).with.offset(5);
        make.left.equalTo(oneshuxian.mas_right).with.offset(0);
        make.width.mas_equalTo((WIDTH-10)/twofen*6);
    }];
    
    JiaShuiHeJi= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:linshi];
    [self addSubview:JiaShuiHeJi];
    
    [JiaShuiHeJi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(threeHengXian.mas_bottom).with.offset(5);
        make.left.equalTo(shuijiaheji.mas_right).with.offset(3);
        make.right.equalTo(twoshuxian.mas_left).with.offset(0);
    }];
#pragma mark -------------- 4层视图

    UIView * fourHengXian = [UIView new];
    fourHengXian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:fourHengXian];
    [fourHengXian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(threeHengXian.mas_bottom).with.offset(30);
        make.left.equalTo(ws).with.offset(5);
        make.right.equalTo(ws).with.offset(-5);
        make.height.mas_equalTo(1);
        
        
    }];

    UIView * fiveHengXian = [UIView new];
    fiveHengXian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:fiveHengXian];
    
    BaseLabel *mingcheng1 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"名            称:"];
    [self addSubview:mingcheng1];
    [mingcheng1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fourHengXian.mas_bottom).with.offset(5);
        make.left.equalTo(ws).with.offset(5+23);
        make.width.mas_equalTo(width);

    }];
    
    DownName = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:linshi];
    [self addSubview:DownName];
    [DownName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fourHengXian.mas_bottom).with.offset(5);
        make.left.equalTo(mingcheng1.mas_right).with.offset(2);
    }];
    
    BaseLabel *nashuirenshibiehao1= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"纳税人识别号:"];
    [self addSubview:nashuirenshibiehao1];
    [nashuirenshibiehao1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mingcheng1.mas_bottom).with.offset(1);
        make.left.equalTo(ws).with.offset(5+23);
        make.width.mas_equalTo(width);

    }];
    
    DownShiBieHao = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:linshi];
    [self addSubview:DownShiBieHao];
    [DownShiBieHao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mingcheng1.mas_bottom).with.offset(1);
        make.left.equalTo(nashuirenshibiehao1.mas_right).with.offset(2);
    }];
    
    
    
    BaseLabel *dizhidianhua1= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"地  址  电  话:"];
    [self addSubview:dizhidianhua1];
    [dizhidianhua1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nashuirenshibiehao1.mas_bottom).with.offset(1);
        make.left.equalTo(ws).with.offset(5+23);
        make.width.mas_equalTo(width);

    }];
    
    DownPhone = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:linshi];
    [self addSubview:DownPhone];
    [DownPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nashuirenshibiehao1.mas_bottom).with.offset(1);
        make.left.equalTo(dizhidianhua1.mas_right).with.offset(2);
    }];
    
    
    BaseLabel *kaihuhangzhanghao1= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:@"开户行  账号 :"];
    [self addSubview:kaihuhangzhanghao1];
    [kaihuhangzhanghao1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dizhidianhua1.mas_bottom).with.offset(1);
        make.left.equalTo(ws).with.offset(5+23);
        make.width.mas_equalTo(width);

    }];
    
    
    DownYinHangHao = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentLeft Text:linshi];
    [self addSubview:DownYinHangHao];
    [DownYinHangHao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dizhidianhua1.mas_bottom).with.offset(1);
        make.left.equalTo(kaihuhangzhanghao1.mas_right).with.offset(2);
    }];
    
    [fiveHengXian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(kaihuhangzhanghao1.mas_bottom).with.offset(5);
        make.left.equalTo(ws).with.offset(5);
        make.right.equalTo(ws).with.offset(-5);
        make.height.mas_equalTo(1);
        
    }];
    
    
    UIView * fouronexian = [UIView new];
    fouronexian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:fouronexian];
    [fouronexian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fourHengXian.mas_bottom).with.offset(0);
        make.left.equalTo(ws).with.offset(5+20);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(fiveHengXian.mas_top).with.offset(0);
    }];
    
    BaseLabel *goumaifang1= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"销售方"];
    goumaifang1.numberOfLines = 4;
    [self addSubview:goumaifang1];
    [goumaifang1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fourHengXian.mas_bottom).with.offset(0);
        make.left.equalTo(ws).with.offset(5+5);
        make.width.mas_equalTo(10);
        make.bottom.equalTo(fiveHengXian.mas_top).with.offset(0);
    }];
    
    UIView * fourtwoxian = [UIView new];
    fourtwoxian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:fourtwoxian];
    [fourtwoxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fourHengXian.mas_bottom).with.offset(0);
        //        make.left.equalTo(ws).with.offset(5+20);
        make.right.equalTo(ws).with.offset(-5-130);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(fiveHengXian.mas_top).with.offset(0);
    }];
    
    UIView * fourthreexian = [UIView new];
    fourthreexian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:fourthreexian];
    [fourthreexian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fourHengXian.mas_bottom).with.offset(0);
        //        make.left.equalTo(ws).with.offset(5+20);
        make.right.equalTo(ws).with.offset(-5-130-20);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(fiveHengXian.mas_top).with.offset(0);
    }];
    UIView * threeShuxian = [UIView new];
    threeShuxian.backgroundColor = RGB(0x88, 0x57, 0x35);
    [self addSubview:threeShuxian];
    [threeShuxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(threeHengXian.mas_bottom).with.offset(0);
        //        make.left.equalTo(ws).with.offset(5+20);
//        make.right.equalTo(ws).with.offset(-5-130-20);
        make.right.mas_equalTo(twoonexian);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(fourHengXian.mas_top).with.offset(0);
    }];
    
    BaseLabel *mimaqu1= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"备注"];
    mimaqu1.numberOfLines = 4;
    [self addSubview:mimaqu1];
    [mimaqu1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fourHengXian.mas_bottom).with.offset(0);
        make.left.equalTo(onethreexian.mas_right).with.offset(5);
        make.width.mas_equalTo(10);
        make.bottom.equalTo(fiveHengXian.mas_top).with.offset(0);
    }];
    
    BeiZhu= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:linshi];
    BeiZhu.numberOfLines = 5;
    [self addSubview:BeiZhu];
    [BeiZhu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fourHengXian.mas_bottom).with.offset(0);
        make.left.equalTo(mimaqu1.mas_right).with.offset(5);
//        make.width.mas_equalTo(50);

       make.right.equalTo(twoshuxian.mas_left).with.offset(-5);
        make.bottom.equalTo(fiveHengXian.mas_top).with.offset(0);
    }];
    
    
    
    [oneshuxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneHengXian.mas_bottom).with.offset(0);
            make.left.equalTo(ws).with.offset(5);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(fiveHengXian.mas_top).with.offset(0);
    }];
    
    [twoshuxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneHengXian.mas_bottom).with.offset(0);
        make.right.equalTo(ws).with.offset(-5);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(fiveHengXian.mas_top).with.offset(0);
    }];
#pragma mark -------------- 尾部
    UIView * oneview = [UIView new];
    [self addSubview:oneview];
    UIView * twoview = [UIView new];
    [self addSubview:twoview];
    UIView * threeview = [UIView new];
    [self addSubview:threeview];
    UIView * fourview = [UIView new];
    [self addSubview:fourview];
//    oneview.backgroundColor = [UIColor redColor];
//    twoview.backgroundColor = [UIColor blackColor];
//    threeview.backgroundColor = [UIColor redColor];
//    fourview.backgroundColor = [UIColor blackColor];

    [oneview mas_makeConstraints:^(MASConstraintMaker *make) {
 make.top.equalTo(fiveHengXian.mas_bottom).with.offset(5);
        make.left.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(20);

        make.bottom.equalTo(ws).with.offset(-5);
    }];
    
    [twoview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fiveHengXian.mas_bottom).with.offset(5);
        make.left.equalTo(oneview.mas_right).with.offset(0);
            make.width.mas_equalTo(oneview.mas_width);
        
                make.height.mas_equalTo(20);
    }];
    [threeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fiveHengXian.mas_bottom).with.offset(5);
        make.left.equalTo(twoview.mas_right).with.offset(0);
        make.width.mas_equalTo(oneview.mas_width);
        
        make.height.mas_equalTo(20);
    }];
    [fourview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fiveHengXian.mas_bottom).with.offset(5);
        make.left.equalTo(threeview.mas_right).with.offset(0);

        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(oneview.mas_width);

    }];
    
    
    BaseLabel *shoukuanren= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"收款人:"];
    [self addSubview:shoukuanren];
    [shoukuanren mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneview.mas_top).with.offset(0);
        make.left.equalTo(oneview.mas_left).with.offset(15);
    }];
    
    ShouKuanRen = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:linshi];
    [self addSubview:ShouKuanRen];
    [ShouKuanRen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneview.mas_top).with.offset(0);
        make.left.equalTo(shoukuanren.mas_right).with.offset(3);
    }];
    
    BaseLabel *fuhe= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"复核:"];
    [self addSubview:fuhe];
    [fuhe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoview.mas_top).with.offset(0);
        make.left.equalTo(twoview.mas_left).with.offset(0);
    }];
    
    FuHe = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:linshi];
    [self addSubview:FuHe];
    [FuHe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoview.mas_top).with.offset(0);
        make.left.equalTo(fuhe.mas_right).with.offset(3);
    }];
    
    BaseLabel *kaipiaoren= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"开票人:"];
    [self addSubview:kaipiaoren];
    [kaipiaoren mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(threeview.mas_top).with.offset(0);
        make.left.equalTo(threeview.mas_left).with.offset(0);
    }];
    
    KaiPiaoRen = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:linshi];
    [self addSubview:KaiPiaoRen];
    [KaiPiaoRen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(threeview.mas_top).with.offset(0);
        make.left.equalTo(kaipiaoren.mas_right).with.offset(3);
    }];
    
    BaseLabel *xiaoshoufang= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x88, 0x57, 0x35) LabelFont:TextFont(minziti) TextAlignment:NSTextAlignmentCenter Text:@"销售方： （章）"];
    [self addSubview:xiaoshoufang];
    [xiaoshoufang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fourview.mas_top).with.offset(0);
        make.left.equalTo(fourview.mas_left).with.offset(0);
    }];
    

}
- (void)updat{
    FaPiaoLeixing.text = @"增值税普通发票";//发票类型
    Jqbianhao.text = @"";//机器编号
    Fapiaodaima.text = @"";//发票代码
    Fapiaohaoma.text = @"";//发票号码
    Kaipiaoriqi.text = @"";//开票日期
    Xiaoyanma.text = @"";//校验码
    TopName.text = @"";//上名称
    TopShiBieHao.text = @"";//上识别号
    TopPhone.text = @"";//上地址电话
    TopYinHangHao.text = @"";//上银行账号
    HuoWu.text = @"";//货物
    GuiGe.text = @"";//规格
    DanWei.text = @"";//单位
    ShuLiang.text = @"";//数量
    Danjia.text = @"";//单价
    Jine.text = @"";//金额
    ShuiLv.text = [NSString stringWithFormat:@"%@",@""];//税率
    ShuiE.text = @"";//税额
    JiaShuiHeJi.text = @"";//价税合计
    DownName.text = @"";//上名称
    DownShiBieHao.text = @"";//上识别号
    DownPhone.text = @"";//上地址电话
    DownYinHangHao.text = @"";//上银行账号
    BeiZhu.text = @"";//备注
    ShouKuanRen.text = @"";//收款人
    FuHe.text = @"";//上银行复合号
    KaiPiaoRen.text = @"";//开票人
}
- (void)setJdcmodel:(FPXQModel *)jdcmodel{
    _jdcmodel = jdcmodel;
    [self updat];
    FaPiaoLeixing.text = @"机动车销售统一发票";//发票类型
    Jqbianhao.text = jdcmodel.skph;//机器编号
    Fapiaodaima.text = jdcmodel.fpdm;//发票代码
    Fapiaohaoma.text = jdcmodel.fphm;//发票号码
    Kaipiaoriqi.text = jdcmodel.kprq;//开票日期
    Xiaoyanma.text = @"";//校验码
    TopName.text = jdcmodel.ghdw;//上名称
    TopShiBieHao.text = jdcmodel.sfzhm;//上识别号
    TopPhone.text = @"";//上地址电话
    TopYinHangHao.text = @"";//上银行账号
    HuoWu.text = jdcmodel.cllx;//货物
    GuiGe.text = @"";//规格
    DanWei.text = @"";//单位
    ShuLiang.text = @"";//数量
    Danjia.text = jdcmodel.jshj;//单价
    Jine.text = jdcmodel.jshj;//金额
    ShuiLv.text = [NSString stringWithFormat:@"%@",jdcmodel.zzssl];//税率
    ShuiE.text = jdcmodel.zzsse;//税额
    JiaShuiHeJi.text = jdcmodel.jshj;//价税合计
    DownName.text = jdcmodel.xhdwmc;//上名称
    DownShiBieHao.text = jdcmodel.nsrsbh;//上识别号
    DownPhone.text = jdcmodel.xsf_dzdh;//上地址电话
    DownYinHangHao.text = jdcmodel.xsf_yhzh;//上银行账号
    BeiZhu.text = @"";//备注
    ShouKuanRen.text = @"";//收款人
    FuHe.text = @"";//上银行复合号
    KaiPiaoRen.text = @"";//开票人
}
- (void)setPdfp:(ZZPTModel *)pdfp{
    _pdfp = pdfp;
    [self updat];
    xmdataa * da = pdfp.xmdata[0];
    if ([pdfp.re_type isEqualToString:@"02"]) {
        FaPiaoLeixing.text = @"货运增值税专用";//发票类型

    }
    if ([pdfp.re_type isEqualToString:@"03"]) {
        FaPiaoLeixing.text = @"机动车销售统一发票";//发票类型
    }
    if ([pdfp.re_type isEqualToString:@"04"]) {
        FaPiaoLeixing.text = @"增值税普通发票";//发票类型

    }
    if ([pdfp.re_type isEqualToString:@"01"]) {
        FaPiaoLeixing.text = @"增值税专用发票";//发票类型
        
    }
    if ([pdfp.re_type isEqualToString:@"10"]) {
        FaPiaoLeixing.text = @"增值税普通发票(电子)";//发票类型

    }
    if ([pdfp.re_type isEqualToString:@"11"]) {
        FaPiaoLeixing.text = @"增值税普通发票（卷式）";//发票类型

    }
    if ([pdfp.re_type isEqualToString:@"14"]) {
        FaPiaoLeixing.text = @"增值税电子普通发票）";//发票类型
    }
    
    Jqbianhao.text = pdfp.jqbh;//机器编号
    Fapiaodaima.text = pdfp.fpdm;//发票代码
    Fapiaohaoma.text = pdfp.fphm;//发票号码
    Kaipiaoriqi.text = pdfp.kprq;//开票日期
    Xiaoyanma.text = pdfp.jym;//校验码
    TopName.text = pdfp.gfmc;//上名称
    TopShiBieHao.text = pdfp.gfsbh;//上识别号
    TopPhone.text = pdfp.gfdzdh;//上地址电话
    TopYinHangHao.text = pdfp.gfyhzh;//上银行账号
    HuoWu.text = da.xmmc;//货物
    GuiGe.text = da.ggxh;//规格
    DanWei.text = da.dw;//单位
    ShuLiang.text = da.xmsl;//数量
    Danjia.text = da.xmdj;//单价
    Jine.text = da.xmje;//金额
    ShuiLv.text = [NSString stringWithFormat:@"%@",da.slv];//税率
    ShuiE.text = da.se;//税额
    JiaShuiHeJi.text = pdfp.jshj;//价税合计
    DownName.text = pdfp.xfmc;//上名称
    DownShiBieHao.text = pdfp.xfsbh;//上识别号
    DownPhone.text = pdfp.xfdzdh;//上地址电话
    DownYinHangHao.text = pdfp.xfyhzh;//上银行账号
    BeiZhu.text = @"";//备注
    ShouKuanRen.text = @"";//收款人
    FuHe.text = @"";//上银行复合号
    KaiPiaoRen.text = @"";//开票人
}
@end

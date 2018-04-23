
//
//  CaiDanView.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "CaiDanView.h"
#import "XQXXView.h"
#import "CYZTView.h"
@implementation CaiDanView{
    BaseLabel * title;
    FLAnimatedImageView* youjiantou ;
    BOOL zhankai;
    UIView * XQView;
    UIView * xian;
    UIView * view;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self buju];
    }
    return self;
}

-(void)buju{
    WS(ws);
    self.backgroundColor = [UIColor whiteColor];
    view = [UIView new];
    view.backgroundColor = RGB(0xf9, 0x71, 0x2c);
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(15);
        make.left.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(4);
        make.height.mas_equalTo(16);

    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@"临时"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(15);
        make.left.equalTo(view.mas_right).with.offset(11);
    }];
    
    youjiantou = [FLAnimatedImageView new];
    youjiantou.image = UIIMAGE("右箭头");
    [self addSubview:youjiantou];
    [youjiantou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(15);
        make.right.equalTo(ws).with.offset(-15);
        make.width.mas_equalTo(14);
        make.height.mas_equalTo(14);
    }];
    
    
    xian = [UIView new];
    xian.backgroundColor = RGB(0xee, 0xee, 0xee);
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).with.offset(15);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    XQView  = [UIView new];
    XQView.backgroundColor = RGB(0xff, 0xff, 0xff);
    [self addSubview:XQView];
    [XQView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(xian.mas_bottom).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
//    [xqview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(XQView.mas_top).with.offset(0);
//        make.left.equalTo(ws).with.offset(0);
//        make.right.equalTo(ws).with.offset(0);
//        make.bottom.equalTo(XQView.mas_bottom).with.offset(0);
//    }];

}
- (void)zhankai{
    WS(ws);
    if (zhankai == YES) {
        youjiantou.hidden = NO;
        zhankai = NO;
        XQView.hidden = YES;
        [xian mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_bottom).with.offset(15);
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.height.mas_equalTo(0.5);
            make.bottom.equalTo(ws).with.offset(0);
        }];
        [XQView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(xian.mas_bottom).with.offset(0);
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
        }];
    }else{
        youjiantou.hidden = YES;
        XQView.hidden = NO;

        [xian mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_bottom).with.offset(15);
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.height.mas_equalTo(0.5);
        }];
        
        [XQView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(xian.mas_bottom).with.offset(0);
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws).with.offset(0);

        }];
        zhankai = YES;
    }
}
- (void)setZK:(BOOL)ZK{
    _ZK = ZK;
    WS(ws);
    if (ZK == NO) {
        youjiantou.hidden = YES;

    }else{
        self.userInteractionEnabled = YES;
        zhankai = NO;
        XQView.hidden = YES;

        [xian mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_bottom).with.offset(15);
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.height.mas_equalTo(0.5);
            make.bottom.equalTo(ws).with.offset(0);
        }];
        [XQView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(xian.mas_bottom).with.offset(0);
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
        }];
        //添加手势
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zhankai)];
        //将手势添加到需要相应的view中去
        [self addGestureRecognizer:tapGesture];
        
    }
}

-(void)setTitletxe:(NSString *)titletxe{
    _titletxe = titletxe;
    title.text = titletxe;
    
}
- (void)setTitlearray:(NSMutableArray *)titlearray{
    _titlearray = titlearray;
}
- (void)setSubtitlearray:(NSMutableArray *)subtitlearray{
    _subtitlearray = subtitlearray;
}
-(void)setLinshi:(NSString *)linshi{
 
}
- (void)addxqview{
    WS(ws);
    NSMutableArray * array = [NSMutableArray array];
    
    if (_titlearray.count>1) {
        for (int i = 0; i<_titlearray.count; i++) {
            XQXXView * xqview = [XQXXView new];
            xqview.titletxe = _titlearray[i];
            xqview.subtitle = _subtitlearray[i];
            [XQView addSubview:xqview];
            [array addObject:xqview];
        }
        
        [array mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
        [array mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
        }];
    }else{
        XQXXView * xqview = [XQXXView new];
        xqview.titletxe = _titlearray[0];
        xqview.subtitle = _subtitlearray[0];

        [XQView addSubview:xqview];
        [xqview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(XQView.mas_top).with.offset(0);
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(XQView.mas_bottom).with.offset(0);
        }];
    }

}
- (void)addFaPiao{
    WS(ws);
    _FaPiao = [MyInvoiceView new];
    [XQView addSubview:_FaPiao];
    [_FaPiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(XQView.mas_top).with.offset(0);
        make.bottom.equalTo(XQView.mas_bottom).with.offset(0);
    }];
    
    if ([_typefp isEqualToString:@"02"]) {
        _FaPiao.pdfp = _zzptmodel;
    }else
    if ([_typefp isEqualToString:@"03"]) {
        _FaPiao.jdcmodel = _jdcmodel;
    }else
    if ([_typefp isEqualToString:@"04"]||[_typefp isEqualToString:@"01"]||[_typefp isEqualToString:@"10"]||[_typefp isEqualToString:@"11"]||[_typefp isEqualToString:@"14"]) {
        _FaPiao.pdfp = _zzptmodel;
    }else{
        _FaPiao.pdfp = _zzptmodel;

    }
}
- (void)addChaYanZhuangTai{
    WS(ws);
    CYZTView * Yanzheng = [CYZTView new];
    [XQView addSubview:Yanzheng];
    [Yanzheng mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(XQView.mas_top).with.offset(0);
        make.height.mas_equalTo(150);
 make.bottom.equalTo(XQView.mas_bottom).with.offset(0);
    }];
    if (_jypd.length == 6) {
        Yanzheng.titlearray = (NSMutableArray *)@[@"税局\n查验",@"作废\n查验",@"购方\n查验",@"报销\n查验",@"禁报\n查验",@"黑名\n单查验"];
    }else if(_jypd.length == 4){
        Yanzheng.titlearray = (NSMutableArray *)@[@"税局\n查验",@"作废\n查验",@"报销\n查验",@"黑名单\n查验"];
    }
    Yanzheng.check = _jypd;
}
-(void)setJdcmodel:(FPXQModel *)jdcmodel{
    _jdcmodel = jdcmodel;
    [self addxinxi];
}
- (void)setZzptmodel:(ZZPTModel *)zzptmodel{
    _zzptmodel = zzptmodel;
    [self addxinxi];
}
- (void)addxinxi{
    WS(ws);
    if ([title.text isEqualToString:@"发票信息"]) {
        [self addxqview];
        FLAnimatedImageView * imageView = [FLAnimatedImageView new];
        if ([_zzptmodel.re_checkresult isEqualToString:PANDUANSHUZHIGEREN]||[_zzptmodel.re_checkresult isEqualToString:PANDUANSHUZHIQIYE]||[_jdcmodel.re_checkresult isEqualToString:PANDUANSHUZHIQIYE]||[_jdcmodel.re_checkresult isEqualToString:PANDUANSHUZHIGEREN]) {
            imageView.image = UIIMAGE("验证通过");
        }else{
            imageView.image = UIIMAGE("验证不通过");

        }

        [XQView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(XQView.mas_top).with.offset(25);
            make.right.equalTo(ws).with.offset(-25);
            make.width.mas_equalTo(84);
            make.height.mas_equalTo(68);
        }];
    }else if ([title.text isEqualToString:@"发票"]){
        [self addFaPiao];
        
    }else if ([title.text isEqualToString:@"查验状态"]){
        [self addChaYanZhuangTai];
        
    }else{
        [self addxqview];
    }
}

@end

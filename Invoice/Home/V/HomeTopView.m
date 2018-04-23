//
//  HomeTopView.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeTopView.h"

@implementation HomeTopView{
    FLAnimatedImageView * geren;
    BaseView * searchView;
    
    UICountingLabel * jidujineall;
    UICountingLabel * jidubaoxiaoall;
    
    UICountingLabel * benyuemoney;
    UICountingLabel * benyueqian;

    
}
- (instancetype)init{
    self = [super init];
    if (self) {
        [self buju];
    }
    return self;
}

- (void)buju{
    self.backgroundColor = RGB(0x46, 0x46, 0x46);
    [self addgeren];
//    [self addsearch];
}
- (void)addgeren{
    WS(ws);
    FLAnimatedImageView * geren = [FLAnimatedImageView new];
    geren.image =UIIMAGE("我的icon");
    geren.userInteractionEnabled = YES;

    [self addSubview:geren];
    [geren mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(15);
        make.top.equalTo(ws).with.offset(12+StatusBar);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];
    
    //添加手势
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(event:)];
    //将手势添加到需要相应的view中去
    [geren addGestureRecognizer:tapGesture];
    //选择触发事件的方式（默认单机触发）
    [tapGesture setNumberOfTapsRequired:1];
    
    
    BaseLabel * wode = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentCenter Text:@"我的"];
    [self addSubview:wode];
    [wode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(10);
        make.top.equalTo(geren.mas_bottom).with.offset(3);
        make.width.mas_equalTo(30);

    }];
    
    BaseLabel * jidujine = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"查验总额(元)"];
    jidujine.alpha = 0.5;
    [self addSubview:jidujine];
    [jidujine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(15);
        make.top.equalTo(wode.mas_bottom).with.offset(22);
    }];
    
    
    jidujineall = [[UICountingLabel alloc] init];
    jidujineall.textAlignment = NSTextAlignmentLeft;
    jidujineall.textColor = RGB(0xff, 0xff, 0xff);
    jidujineall.font = TextFont(32);
    //设置格式
    jidujineall.format = @"%d";
    jidujineall.text = @"";
    //设置变化范围及动画时间
    [self addSubview:jidujineall];
    [jidujineall mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(15);
        make.top.equalTo(jidujine.mas_bottom).with.offset(5);
    }];
    
    
    BaseLabel * jidubaoxiao = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"报销总数(张)"];
    jidubaoxiao.alpha = 0.5;
    [self addSubview:jidubaoxiao];
    [jidubaoxiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(15);
        make.top.equalTo(jidujineall.mas_bottom).with.offset(20);
    }];
    
    jidubaoxiaoall = [[UICountingLabel alloc] init];
    jidubaoxiaoall.textAlignment = NSTextAlignmentCenter;
    jidubaoxiaoall.textColor = RGB(0xff, 0xff, 0xff);
    jidubaoxiaoall.font = TextFont(24);
    //设置格式
    jidubaoxiaoall.format = @"%d";
    jidubaoxiaoall.text = @"";
    //设置变化范围及动画时间
    [self addSubview:jidubaoxiaoall];
    [jidubaoxiaoall mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(15);
        make.top.equalTo(jidubaoxiao.mas_bottom).with.offset(10);
    }];
    
//
    if (![Me.user_type isEqualToString:@"3"]) {
        FLAnimatedImageView * chongzhi = [FLAnimatedImageView new];
        chongzhi.image =UIIMAGE("充值icon");
        chongzhi.userInteractionEnabled = YES;
        
        [self addSubview:chongzhi];
        [chongzhi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(ws).with.offset(-15);
            make.top.equalTo(ws).with.offset(12+StatusBar);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(20);
        }];
        
        //添加手势
        UITapGestureRecognizer * righttapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chongzhi:)];
        //将手势添加到需要相应的view中去
        [chongzhi addGestureRecognizer:righttapGesture];
        //选择触发事件的方式（默认单机触发）
        [righttapGesture setNumberOfTapsRequired:1];
        
        
        BaseLabel * chongzhilabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentRight Text:@"充值"];
        [self addSubview:chongzhilabel];
        [chongzhilabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(ws).with.offset(-15);
            make.top.equalTo(chongzhi.mas_bottom).with.offset(3);
            make.width.mas_equalTo(30);
            
        }];

    }
    

    BaseLabel * allmoney = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"本月查验(元)"];
    allmoney.alpha = 0.5;
    [self addSubview:allmoney];
    [allmoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(jidujine.mas_right).with.offset(15);
        make.top.equalTo(wode.mas_bottom).with.offset(22);
        make.right.equalTo(ws).with.offset(-15);

        make.width.mas_equalTo(jidujine);
    }];
    

    
    benyuemoney = [[UICountingLabel alloc] init];
    benyuemoney.textAlignment = NSTextAlignmentLeft;
    benyuemoney.textColor = RGB(0xff, 0xff, 0xff);
    benyuemoney.font = TextFont(32);
    //设置格式
    benyuemoney.format = @"%d";
    benyuemoney.text = @"";
    //设置变化范围及动画时间
    [self addSubview:benyuemoney];
    [benyuemoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(jidujine.mas_right).with.offset(15);
        make.top.equalTo(allmoney.mas_bottom).with.offset(5);
    }];
    
    
    BaseLabel * benyuezhangshu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"本月张数(张)"];
    benyuezhangshu.alpha = 0.5;
    [self addSubview:benyuezhangshu];
    [benyuezhangshu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(jidujine.mas_right).with.offset(15);
        make.top.equalTo(benyuemoney.mas_bottom).with.offset(20);
    }];

    
    benyueqian = [[UICountingLabel alloc] init];
    benyueqian.textAlignment = NSTextAlignmentCenter;
    benyueqian.textColor = RGB(0xff, 0xff, 0xff);
    benyueqian.font = TextFont(24);
    //设置格式
    benyueqian.format = @"%d";
    benyueqian.text = @"";
    //设置变化范围及动画时间
    [self addSubview:benyueqian];
    [benyueqian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(jidujine.mas_right).with.offset(15);
        make.top.equalTo(benyuezhangshu.mas_bottom).with.offset(10);
        make.bottom.equalTo(ws).with.offset(-64);

    }];
}

- (void)event:(UITapGestureRecognizer *)gesture{
    ALlModel * model = [ALlModel new];
    [self.delegate ClickModel:model Style:ClickPushPerson];
}

- (void)chongzhi:(UITapGestureRecognizer *)gesture{
    ALlModel * model = [ALlModel new];
    [self.delegate ClickModel:model Style:ClickancZhiFu];
}
- (void)setModel:(HomeModel *)model{
    _model = model;
    jidujineall.text = @"0";
    jidubaoxiaoall.text = @"0";
    benyuemoney.text = @"0";
    benyueqian.text = @"0";
    
    [jidujineall countFrom:0
                  to:model.amount
        withDuration:1.0f];
    [jidubaoxiaoall countFrom:0
                        to:model.count
              withDuration:1.0f];
    [benyuemoney countFrom:0
                       to:model.oldamount
             withDuration:1.0f];
    [benyueqian countFrom:0
                           to:model.oldcount
                 withDuration:1.0f];
    
}
@end

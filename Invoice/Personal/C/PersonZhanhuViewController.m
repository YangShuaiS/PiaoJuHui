//
//  PersonZhanhuViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonZhanhuViewController.h"
#import "ChongZhiJiLuViewController.h"
#import "ShiYongJiLuViewController.h"
#import "ChongzhiViewController.h"
@interface PersonZhanhuViewController (){
    UIView * nav;
    UICountingLabel * money;
}

@end

@implementation PersonZhanhuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addnav];
    [self addtopView];
    [self loadRequestData];
    // Do any additional setup after loading the view.
}
- (void)loadRequestData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_WDZH];
    NSDictionary * dic = @{@"token":Me.token};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserZhanHuModel * model = [UserZhanHuModel mj_objectWithKeyValues:responseObject];
   
            if ([model.code isEqualToString:@"200"]) {
                [money countFrom:0
                              to:model.account_residualnumber
                    withDuration:1.0f];
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
    
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"我的账户"];
    [self.view addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(nav.mas_bottom).with.offset(-10);
        make.centerX.mas_equalTo(nav.mas_centerX);
        
    }];
    

}

- (void)leftBarButtonItenAction{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)addtopView{
    WS(ws);
    UIView * topview = [UIView new];
    topview.backgroundColor = RGB(0xf9, 0x71, 0x2c);
    [self.view addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(nav.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(@150);
    }];
    
    BaseLabel * YuE = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGBA(0xff, 0xff, 0xff, 0.8) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"账户余额"];
    [self.view addSubview:YuE];
    [YuE mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topview.mas_top).with.offset(30);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
    }];
    money = [[UICountingLabel alloc] init];
    money.textAlignment = NSTextAlignmentCenter;
    money.textColor = RGBA(0xff, 0xff, 0xff, 1);
    money.font = TextFont(36);
    //设置格式
    money.format = @"%d";
    money.text = @"";
    //设置变化范围及动画时间
    [self.view addSubview:money];
    [money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(YuE.mas_bottom).with.offset(5);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
    }];

    BaseLabel * ChongZhi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"充值"];
    ChongZhi.backgroundColor = RGB(0xf9, 0x71, 0x2c);
    ChongZhi.layer.masksToBounds = YES;
    ChongZhi.layer.cornerRadius = 2;
    ChongZhi.userInteractionEnabled = YES;
    [self.view addSubview:ChongZhi];
    [ChongZhi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topview.mas_bottom).with.offset(30);
        make.left.equalTo(ws.view).with.offset(15);
        make.right.equalTo(ws.view).with.offset(-15);
        make.height.mas_equalTo(@44);

    }];
    
    //添加手势
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Chongzhi)];
    //将手势添加到需要相应的view中去
    [ChongZhi addGestureRecognizer:tapGesture];
    
    
    UIView * xian = [UIView new];
    xian.backgroundColor = RGB(0x33, 0x33, 0x33);
    [self.view addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ChongZhi.mas_bottom).with.offset(31);
        make.width.mas_equalTo(@0.5);
        make.height.mas_equalTo(@14);
        make.centerX.mas_equalTo(ws.view);
    }];
    
    BaseButton * jilu = [BaseButton buttonWithType:UIButtonTypeCustom];
    jilu.backgroundColor=[UIColor whiteColor];
    [jilu setTitleColor:RGB(0x33, 0x33, 0x33) forState:UIControlStateNormal];
    jilu.titleLabel.font = TextFont(12);
    [jilu addTarget:self action:@selector(jilu) forControlEvents:UIControlEventTouchUpInside];
    [jilu setTitle:@"充值记录" forState:UIControlStateNormal];
    [self.view addSubview:jilu];
    [jilu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xian);        make.right.equalTo(xian.mas_left).with.offset(-10);
    }];
    
    
    BaseButton * shiyongjilu = [BaseButton buttonWithType:UIButtonTypeCustom];
    shiyongjilu.backgroundColor=[UIColor whiteColor];
    [shiyongjilu setTitleColor:RGB(0x33, 0x33, 0x33) forState:UIControlStateNormal];
    shiyongjilu.titleLabel.font = TextFont(12);
    [shiyongjilu addTarget:self action:@selector(shiyongjilu) forControlEvents:UIControlEventTouchUpInside];
    [shiyongjilu setTitle:@"使用记录" forState:UIControlStateNormal];
    [self.view addSubview:shiyongjilu];
    [shiyongjilu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xian);
        make.left.equalTo(xian.mas_right).with.offset(10);
    }];
}
- (void)Chongzhi{
    ChongzhiViewController * vc = [ChongzhiViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)jilu{
    ChongZhiJiLuViewController * chongzhi = [ChongZhiJiLuViewController new];
    [self.navigationController pushViewController:chongzhi animated:YES];
}
- (void)shiyongjilu{
    ShiYongJiLuViewController * vc = [ShiYongJiLuViewController new];
    [self.navigationController pushViewController:vc animated:YES];

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

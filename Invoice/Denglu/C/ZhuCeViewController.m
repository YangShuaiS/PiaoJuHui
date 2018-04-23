//
//  ZhuCeViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhuCeViewController.h"
#import "ZhuCeXQViewController.h"
#import "HomeMenuView.h"

@interface ZhuCeViewController (){
    UIView * nav;
}

@end

@implementation ZhuCeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addnav];
    [self addview];
    // Do any additional setup after loading the view.
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
}
- (void)leftBarButtonItenAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)addview{
    WS(ws);
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(30) TextAlignment:NSTextAlignmentLeft Text:@"新用户注册"];
    [self.view addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_bottom).with.offset(5);
        make.left.equalTo(ws.view).with.offset(30);

    }];
    
    
    HomeMenuView * homeMenu = [[HomeMenuView alloc] init];
    homeMenu.titarray = @[@"个人账号",@"公司账号"];
    
    [self.view addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(name.mas_bottom).with.offset(20);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    ZhuCeXQViewController* geren = [[ZhuCeXQViewController alloc] init];
    geren.style = ZHUCESTYLEGEREN;
    [self addChildViewController:geren];
    [childVC addObject:geren];
    
    ZhuCeXQViewController * qiye = [[ZhuCeXQViewController alloc] init];
    qiye.style = ZHUCESTYLEGONGSI;
    [self addChildViewController:qiye];
    [childVC addObject:qiye];
    
    homeMenu.controllerArray = childVC;
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

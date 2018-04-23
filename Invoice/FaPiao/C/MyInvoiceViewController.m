//
//  MyInvoiceViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/15.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyInvoiceViewController.h"
#import "MyInCoicNRViewController.h"
#import "HomeMenuView.h"

@interface MyInvoiceViewController (){
    UIView * nav;
    
}

@end

@implementation MyInvoiceViewController

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
    
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"我的票据"];
    [self.view addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(nav.mas_bottom).with.offset(-10);
        make.centerX.mas_equalTo(nav.mas_centerX);
        
    }];
}
- (void)leftBarButtonItenAction{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)addview{
    WS(ws);
    HomeMenuView * homeMenu = [[HomeMenuView alloc] init];
    homeMenu.titarray = @[@"已查验",@"已报销"];

    [self.view addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(nav.mas_bottom).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    MyInCoicNRViewController* hotview = [[MyInCoicNRViewController alloc] init];
    hotview.type = @"1";
    [self addChildViewController:hotview];
    [childVC addObject:hotview];

    MyInCoicNRViewController * Familiar = [[MyInCoicNRViewController alloc] init];
    Familiar.type = @"3";
    [self addChildViewController:Familiar];
    
    [childVC addObject:Familiar];
//
    homeMenu.controllerArray = childVC;
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
- (void)dealloc{
    [self removeFromParentViewController];
    [nav removeFromSuperview];
    [[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.view removeFromSuperview];
    self.view = nil;
}
@end

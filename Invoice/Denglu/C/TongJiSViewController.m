


//
//  TongJiSViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TongJiSViewController.h"
#import "HomeMenuView.h"
#import "TongjiViewController.h"
@interface TongJiSViewController (){
    UIView * nav;
}

@end

@implementation TongJiSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addnav];    [self addview];

    // Do any additional setup after loading the view.
}
- (void)addview{
    WS(ws);
    HomeMenuView * homeMenu = [[HomeMenuView alloc] init];
    homeMenu.titarray = @[@"本周",@"本月",@"总计"];
    
    [self.view addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(nav.mas_bottom).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    TongjiViewController* hotview = [[TongjiViewController alloc] init];
    hotview.type = @"week";
    [self addChildViewController:hotview];
    [childVC addObject:hotview];
    
    TongjiViewController * yue = [[TongjiViewController alloc] init];
    yue.type = @"month";
    [self addChildViewController:yue];
    [childVC addObject:yue];

    TongjiViewController * Familiar = [[TongjiViewController alloc] init];
    Familiar.type = @"all";
    [self addChildViewController:Familiar];
    
    [childVC addObject:Familiar];
    //
    homeMenu.controllerArray = childVC;
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
    
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"统计"];
    [self.view addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(nav.mas_bottom).with.offset(-10);
        make.centerX.mas_equalTo(nav.mas_centerX);
        
    }];
    
}
- (void)leftBarButtonItenAction{
    [self.navigationController popViewControllerAnimated:YES];
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

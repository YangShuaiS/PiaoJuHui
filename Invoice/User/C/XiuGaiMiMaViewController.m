//
//  XiuGaiMiMaViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "XiuGaiMiMaViewController.h"
#import "ShuRuView.h"
@interface XiuGaiMiMaViewController ()<UIScrollViewDelegate>{
    UIView * nav;
    UIScrollView * scrollView;
    NSMutableArray * Viewarray;
    
    ShuRuView * newPass;
    ShuRuView * qrnewPass;
    ShuRuView * oldPass;
}

@end

@implementation XiuGaiMiMaViewController

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
    
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"修改密码"];
    [self.view addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(nav.mas_bottom).with.offset(-10);
        make.centerX.mas_equalTo(nav.mas_centerX);
        
    }];
    
    BaseButton * right = [BaseButton buttonWithType:UIButtonTypeCustom];
    [right addTarget:self action:@selector(rightBarButtonItenAction) forControlEvents:UIControlEventTouchUpInside];
    [right setTitle:@"保存" forState:UIControlStateNormal];
    [right setTitleColor:RGB(0xf9, 0x71, 0x2c) forState:UIControlStateNormal];
    right.titleLabel.font = TextFont(15);

    [nav addSubview:right];
    [right mas_makeConstraints:^(MASConstraintMaker *make) {

//        make.bottom.equalTo(nav.mas_bottom).with.offset(-14);
        make.centerY.mas_equalTo(left.mas_centerY);

        make.right.equalTo(ws.view).with.offset(-15);
//        make.width.mas_equalTo(@35);
    }];
}
- (void)leftBarButtonItenAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonItenAction{
    

    
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在修改...";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.view.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view.window);
    }];
    if (newPass.textField.text.length<6||qrnewPass.textField.text.length<6||oldPass.textField.text.length<6) {
        mb.mode = MBProgressHUDModeCustomView;
        mb.label.text = @"密码必须大于6位";
        [mb hideAnimated:YES afterDelay:2];
    }else{
        NSMutableArray * NeiRongarray = [NSMutableArray array];
        for (ShuRuView * view in Viewarray) {
            NSString * str = view.textField.text;
            [NeiRongarray addObject:str];
        }
        if ([NeiRongarray[2] isEqualToString:NeiRongarray[1]]) {
            NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_XGMM];
            NSDictionary * dic = @{@"token":Me.token,@"oldpassword":NeiRongarray[0],@"newpassword":NeiRongarray[1]};
            //
            [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
                if (responseObject) {
                    HomeModel * model = [HomeModel mj_objectWithKeyValues:responseObject];
                    mb.label.text = model.message;
                    [mb hideAnimated:YES afterDelay:2];
                    if ([model.code isEqual:@200]) {
                        NSNotification *notification =[NSNotification notificationWithName:kNotificationTuiChuDenglu object:nil userInfo:nil];
                        [[NSNotificationCenter defaultCenter] postNotification:notification];
                    }
                }else{
                    mb.label.text = @"网络请求失败...";
                    [mb hideAnimated:YES afterDelay:2];
                }
            }];
        }else{
            mb.mode = MBProgressHUDModeCustomView;
            mb.label.text = @"两次密码不一致";
            [mb hideAnimated:YES afterDelay:2];
        }
    }
    
    
    
    

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
    oldPass = [ShuRuView new];
    oldPass.style = TextFieldPassword;
    oldPass.title = @"请输入旧密码";
    oldPass.names = @"旧密码";
    [scrollView addSubview:oldPass];
    [oldPass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(scrollView.mas_top).with.offset(0);
    }];
    [Viewarray addObject:oldPass];
    
    newPass = [ShuRuView new];
    newPass.style = TextFieldPassword;
    newPass.title = @"请输入新密码";
    newPass.names = @"新密码";
    [scrollView addSubview:newPass];
    [newPass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(oldPass.mas_bottom).with.offset(0);
    }];
    [Viewarray addObject:newPass];

    
    qrnewPass = [ShuRuView new];
    qrnewPass.style = TextFieldPassword;
    qrnewPass.title = @"请确认新密码";
    qrnewPass.names = @"确认密码";
    [scrollView addSubview:qrnewPass];
    [qrnewPass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(newPass.mas_bottom).with.offset(0);
        make.bottom.equalTo(scrollView.mas_bottom).with.offset(-5);
    }];
    [Viewarray addObject:qrnewPass];

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

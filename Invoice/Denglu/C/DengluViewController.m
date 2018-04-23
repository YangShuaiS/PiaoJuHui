//
//  DengluViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DengluViewController.h"
#import "ShuRuStyleone.h"
#import "ZhuCeViewController.h"

#import "ZhaoHUuiMimaViewController.h"

@interface DengluViewController (){
    ShuRuStyleone* GongSiDianHua;
    ShuRuStyleone* Password;
}

@end

@implementation DengluViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = RGB(0xf0, 0xf0, 0xf0);
    [self install];
    [self addview];
}

- (void)install{
    UIView *statusBar = STAUBARHEIGHT;
    NavHeight = statusBar.frame.size.height+NAVIGATIONHeight;
    TabBarHeight = TABBARHeight;
    StatusBar = statusBar.frame.size.height;
}
- (void)addview{
    WS(ws);
//    UIView * backview = [UIView new];
//    backview.backgroundColor = RGB(0x5c, 0x5c, 0x5c);
//    [self.view addSubview:backview];
//    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.equalTo(ws.view).with.offset(0);
//        make.left.equalTo(ws.view).with.offset(0);
//        make.right.equalTo(ws.view).with.offset(0);
//        make.height.mas_equalTo(300);
//    }];
//
    FLAnimatedImageView * topimageview = [FLAnimatedImageView new];
    topimageview.image = UIIMAGE("登录bg");
    topimageview.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:topimageview];
    [topimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView *backview = [[UIView alloc] init];
    backview.backgroundColor = RGBA(0x0e, 0x06, 0x00, 0.7);
    [topimageview addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(topimageview);

    }];
    
    BaseLabel * Dengluzi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(30) TextAlignment:NSTextAlignmentCenter Text:@"登录"];
        [backview addSubview:Dengluzi];
    [Dengluzi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backview.mas_top).with.offset(17+StatusBar+44);
            make.left.equalTo(backview.mas_left).with.offset(30);
    
        }];
        BaseButton * zhuce = [BaseButton buttonWithType:UIButtonTypeCustom];
        [zhuce addTarget:self action:@selector(zhuce) forControlEvents:UIControlEventTouchUpInside];
        [zhuce setTitle:@"新用户注册" forState:UIControlStateNormal];
    zhuce.titleLabel.font = TextFont(12);
        [zhuce setTintColor:RGB(0xff, 0xff, 0xff)];
        [self.view addSubview:zhuce];
        [zhuce mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(backview.mas_top).with.offset(79+StatusBar);
            make.right.equalTo(backview.mas_right).with.offset(-33);
        }];
    topimageview.userInteractionEnabled = YES;
    GongSiDianHua = [ShuRuStyleone new];
    GongSiDianHua.userInteractionEnabled = YES;
    GongSiDianHua.style = TextFieldShuZi;
    GongSiDianHua.names = @"账号";
    GongSiDianHua.title = @"请输入账号/手机号";
    GongSiDianHua.styleback = TextFieldBackViewWhit;

    [backview addSubview:GongSiDianHua];
    [GongSiDianHua mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backview.mas_left).with.offset(0);
        make.right.equalTo(backview.mas_right).with.offset(0);
        make.top.equalTo(Dengluzi.mas_bottom).with.offset(50);
    }];
    
    Password = [ShuRuStyleone new];
    Password.userInteractionEnabled = YES;
    Password.style = TextFieldPassword;
    Password.names = @"密码";
    Password.title = @"请输入密码";
    Password.styleback = TextFieldBackViewWhit;
    
    [backview addSubview:Password];
    [Password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backview.mas_left).with.offset(0);
        make.right.equalTo(backview.mas_right).with.offset(0);
        make.top.equalTo(GongSiDianHua.mas_bottom).with.offset(15);
    }];
    
        BaseLabel * Denglu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"登录"];
        Denglu.backgroundColor = RGB(0xf9, 0x71, 0x2c);
        Denglu.layer.masksToBounds = YES;
        Denglu.layer.cornerRadius = 2;
        Denglu.userInteractionEnabled = YES;
        [backview addSubview:Denglu];
        [Denglu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(Password.mas_bottom).with.offset(15);
            make.left.equalTo(backview.mas_left).with.offset(30);
            make.right.equalTo(backview.mas_right).with.offset(-30);
            make.height.mas_equalTo(@44);
    
        }];
    
        //添加手势
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Denglu)];
        //将手势添加到需要相应的view中去
        [Denglu addGestureRecognizer:tapGesture];
    
    BaseButton * xiugai = [BaseButton buttonWithType:UIButtonTypeCustom];
    [xiugai addTarget:self action:@selector(xiugai) forControlEvents:UIControlEventTouchUpInside];
    [xiugai setTitle:@"忘记密码" forState:UIControlStateNormal];
    xiugai.titleLabel.font = TextFont(12);
    [xiugai setTintColor:RGB(0xff, 0xff, 0xff)];
    [backview addSubview:xiugai];
    [xiugai mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Denglu.mas_bottom).with.offset(15);
        make.left.equalTo(backview.mas_left).with.offset(30);
    }];
    
 
}

- (void)xiugai{
    ZhaoHUuiMimaViewController * vc = [ZhaoHUuiMimaViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)Denglu{
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在登录...";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.view.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view.window); 
    }];
    
    
    [GongSiDianHua.textField resignFirstResponder];
    [Password.textField resignFirstResponder];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_DL];
    NSDictionary * dic = @{@"phone":GongSiDianHua.textField.text,@"password":Password.textField.text};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            
            NSString *filePatch = [BaseObject AddPathName:UserMe];
            Me = [MeModel mj_objectWithKeyValues:responseObject];

            NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
            NSDictionary * dic = @{@"user_type":Me.user_type,@"enter_id":Me.enter_id,@"token":Me.token,@"code":Me.token,@"message":Me.message};
            [usersDic setObject:dic forKey:UserMe];
            
            [usersDic writeToFile:filePatch atomically:YES];

                if ([Me.code isEqual:@200]) {
                    [mb hideAnimated:NO];
                    NSNotification *notification =[NSNotification notificationWithName:kNotificationDenglu object:nil userInfo:nil];
                    [[NSNotificationCenter defaultCenter] postNotification:notification];
                }else{
                    mb.label.text = Me.message;
                    [mb hideAnimated:NO afterDelay:1];
                }
            
        }else{
             mb.label.text = @"网络请求失败";
            [mb hideAnimated:NO afterDelay:1];

        }
    }];
    

    

}
-(void)zhuce{
    ZhuCeViewController * vc = [ZhuCeViewController new];
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

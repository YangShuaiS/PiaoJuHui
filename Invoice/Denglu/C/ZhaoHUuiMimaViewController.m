//
//  ZhaoHUuiMimaViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhaoHUuiMimaViewController.h"
#import "ShuRuStyleone.h"
#import "YanZhengMa.h"
@interface ZhaoHUuiMimaViewController ()<UIScrollViewDelegate>{
    UIScrollView * scrollView;
    ShuRuStyleone * phone;
    ShuRuStyleone * yanzhengma;
    ShuRuStyleone * password;
    ShuRuStyleone * newpassword;
    UIView * nav;
    NSString * content;
}

@end

@implementation ZhaoHUuiMimaViewController

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
    scrollView = [UIScrollView new];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(30) TextAlignment:NSTextAlignmentLeft Text:@"找回密码"];
    [self.view addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollView.mas_top).with.offset(0);
        make.left.equalTo(ws.view).with.offset(30);
    }];
    
    phone = [ShuRuStyleone new];
    phone.userInteractionEnabled = YES;
    phone.style = TextFieldShuZi;
    phone.names = @"手机号码";
    phone.title = @"请输入手机号";
    phone.styleback = TextFieldBackViewBack;
    [scrollView addSubview:phone];
    
    yanzhengma = [ShuRuStyleone new];
    yanzhengma.userInteractionEnabled = YES;
    yanzhengma.style = TextFieldShuZi;
    yanzhengma.names = @"验证码";
    yanzhengma.title = @"请输入验证码";
    yanzhengma.styleback = TextFieldBackViewBack;
    [scrollView addSubview:yanzhengma];
    
    YanZhengMa * yzm = [YanZhengMa new];
    yzm.delegate = self;
    [yanzhengma addSubview:yzm];
    
    password = [ShuRuStyleone new];
    password.userInteractionEnabled = YES;
    password.style = TextFieldPassword;
    password.names = @"新密码";
    password.title = @"请输入新密码";
    password.styleback = TextFieldBackViewBack;
    [scrollView addSubview:password];
    
    newpassword = [ShuRuStyleone new];
    newpassword.userInteractionEnabled = YES;
    newpassword.style = TextFieldPassword;
    newpassword.names = @"密码确认";
    newpassword.title = @"请再次输入密码";
    newpassword.styleback = TextFieldBackViewBack;
    [scrollView addSubview:newpassword];
    
    [phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(scrollView.mas_top).with.offset(50);
        
    }];
    [yanzhengma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(phone.mas_bottom).with.offset(5);
        
    }];
    [yzm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(yanzhengma.mas_right).with.offset(-30);
        make.bottom.equalTo(yanzhengma.mas_bottom).with.offset(-5);
        
    }];
    
    [password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(yanzhengma.mas_bottom).with.offset(5);
        
    }];
    
    [newpassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(password.mas_bottom).with.offset(5);
        
    }];
    
    BaseLabel * Denglu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"注册"];
    Denglu.backgroundColor = RGB(0xf9, 0x71, 0x2c);
    Denglu.layer.masksToBounds = YES;
    Denglu.layer.cornerRadius = 2;
    Denglu.userInteractionEnabled = YES;
    [scrollView addSubview:Denglu];
    [Denglu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(newpassword.mas_bottom).with.offset(15);
        make.left.equalTo(ws.view).with.offset(30);
        make.right.equalTo(ws.view).with.offset(-30);
        make.height.mas_equalTo(@44);
        make.bottom.equalTo(scrollView.mas_bottom).with.offset(-300);

    }];
    
    //添加手势
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Denglu)];
    //将手势添加到需要相应的view中去
    [Denglu addGestureRecognizer:tapGesture];
    
}
- (void)Denglu{
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
    
    if (phone.textField.text.length == 0) {
        mb.mode = MBProgressHUDModeCustomView;
        mb.label.text = @"手机号不能为空...";
        [mb hideAnimated:YES afterDelay:2];

    }else if (![BaseObject valiMobile:phone.textField.text]){
        mb.mode = MBProgressHUDModeCustomView;
        mb.label.text = @"手机号格式不正确";
        [mb hideAnimated:YES afterDelay:2];
    }else if (yanzhengma.textField.text.length == 0){
        mb.mode = MBProgressHUDModeCustomView;
        mb.label.text = @"验证码不能为空...";
        [mb hideAnimated:YES afterDelay:2];
        
    }else if (password.textField.text.length == 0){
        mb.mode = MBProgressHUDModeCustomView;
        mb.label.text = @"新密码不能为空...";
        [mb hideAnimated:YES afterDelay:2];
        
    }else if (newpassword.textField.text.length == 0){
        mb.mode = MBProgressHUDModeCustomView;
        mb.label.text = @"确认密码不能为空...";
        [mb hideAnimated:YES afterDelay:2];
    }else if (![newpassword.textField.text isEqualToString:password.textField.text]){
        mb.mode = MBProgressHUDModeCustomView;
        mb.label.text = @"两次密码不一致";
        [mb hideAnimated:YES afterDelay:2];
    }else if (password.textField.text.length < 6 ||newpassword.textField.text.length<6){
        mb.mode = MBProgressHUDModeCustomView;
        mb.label.text = @"密码必须大于6位";
        [mb hideAnimated:YES afterDelay:2];
    }
    else if (![yanzhengma.textField.text isEqualToString:content]){
        mb.mode = MBProgressHUDModeCustomView;
        mb.label.text = @"验证码不对";
        [mb hideAnimated:YES afterDelay:2];
    }else{
        [self zhmi:mb];
    }
 
}

- (void)zhmi:(MBProgressHUD *)mb{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ZHMM];
    NSDictionary * dic = @{@"phone":phone.textField.text,@"newpassword":newpassword.textField.text};
    //
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomeModel * model = [HomeModel mj_objectWithKeyValues:responseObject];
            mb.label.text = model.message;
            [mb hideAnimated:YES afterDelay:2];
            mb.mode = MBProgressHUDModeCustomView;
            if ([model.code isEqual:@200]) {
                [self.navigationController popViewControllerAnimated:YES];
            }
 
        }else{
            mb.label.text = @"网络请求失败...";
            [mb hideAnimated:YES afterDelay:2];
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//发送验证码
- (void)ClickModel:(ALlModel *)model Style:(Click)style{
    switch (style) {
        case ClickancFSYZM:
            [self loadyzm];
            break;
            
        default:
            break;
    }
}
- (void)loadyzm{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FSYZM];
    NSDictionary * dic = @{@"phone":phone.textField.text};
    //
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomeModel * model = [HomeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                content = model.content;
            }else{

            }
        }else{
            
        }
    }];
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

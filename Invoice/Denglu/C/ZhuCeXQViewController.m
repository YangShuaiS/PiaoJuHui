//
//  ZhuCeXQViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhuCeXQViewController.h"
#import "ShuRuStyleone.h"
#import "YanZhengMa.h"

@interface ZhuCeXQViewController ()<UIScrollViewDelegate>
{
    UIScrollView * scrollView;
    ShuRuStyleone * danweiname;
    ShuRuStyleone * nashuiren;
    ShuRuStyleone * name;
    ShuRuStyleone * mima;
    ShuRuStyleone * qurenmima;
    ShuRuStyleone * phone;
    ShuRuStyleone * yanzhengma;
    ShuRuStyleone * yaoqingma;

    BaseLabel * Denglu;
    YanZhengMa * yzm;
    NSString * content;

}
@end

@implementation ZhuCeXQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addscroview];

    // Do any additional setup after loading the view.
}
- (void)addscroview{
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    danweiname = [ShuRuStyleone new];
    danweiname.userInteractionEnabled = YES;
    danweiname.style = TextFieldNULL;
    danweiname.names = @"单位名称";
    danweiname.title = @"请输入单位名称";
    danweiname.styleback = TextFieldBackViewBack;
    [scrollView addSubview:danweiname];
    
    nashuiren = [ShuRuStyleone new];
    nashuiren.userInteractionEnabled = YES;
    nashuiren.style = TextFieldShuZi;
    nashuiren.names = @"纳税人识别号";
    nashuiren.title = @"请输入纳税人识别号";
    nashuiren.styleback = TextFieldBackViewBack;
    [scrollView addSubview:nashuiren];
    
    name = [ShuRuStyleone new];
    name.userInteractionEnabled = YES;
    name.style = TextFieldNULL;
    name.names = @"用户姓名";
    name.title = @"请输入姓名";
    name.styleback = TextFieldBackViewBack;
    [scrollView addSubview:name];
    
    mima = [ShuRuStyleone new];
    mima.userInteractionEnabled = YES;
    mima.style = TextFieldPassword;
    mima.names = @"登录密码";
    mima.title = @"请输入密码";
    mima.styleback = TextFieldBackViewBack;
    [scrollView addSubview:mima];
    
    qurenmima = [ShuRuStyleone new];
    qurenmima.userInteractionEnabled = YES;
    qurenmima.style = TextFieldPassword;
    qurenmima.names = @"密码确认";
    qurenmima.title = @"请再次输入密码";
    qurenmima.styleback = TextFieldBackViewBack;
    [scrollView addSubview:qurenmima];
    
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
    
    yzm = [YanZhengMa new];
    yzm.delegate = self;
    [yanzhengma addSubview:yzm];
    
    yaoqingma = [ShuRuStyleone new];
    yaoqingma.userInteractionEnabled = YES;
    yaoqingma.style = TextFieldNULL;
    yaoqingma.names = @"邀请码";
    yaoqingma.title = @"请输入邀请码";
    yaoqingma.styleback = TextFieldBackViewBack;
    [scrollView addSubview:yaoqingma];
    
    Denglu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"注册"];
    Denglu.backgroundColor = RGB(0xf9, 0x71, 0x2c);
    Denglu.layer.masksToBounds = YES;
    Denglu.layer.cornerRadius = 2;
    Denglu.userInteractionEnabled = YES;
    [scrollView addSubview:Denglu];

    
    //添加手势
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Denglu)];
    //将手势添加到需要相应的view中去
    [Denglu addGestureRecognizer:tapGesture];
    
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(huishoujianpan)];
    //将手势添加到需要相应的view中去
    scrollView.userInteractionEnabled = YES;
    [scrollView addGestureRecognizer:tapGesture1];
    switch (_style) {
        case ZHUCESTYLEGEREN:
            [self geren];
            break;
        case ZHUCESTYLEGONGSI:
            [self qiye];
            break;
        default:
            break;
    }

}
- (void)setStyle:(ZHUCESTYLE)style{
    _style = style;

}
- (void)geren{
    WS(ws);

    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(scrollView.mas_top).with.offset(5);
        
    }];
    [mima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(name.mas_bottom).with.offset(15);
        
    }];
    [qurenmima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(mima.mas_bottom).with.offset(15);
        
    }];
    [phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(qurenmima.mas_bottom).with.offset(15);
        
    }];
    [yanzhengma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(phone.mas_bottom).with.offset(15);
        
    }];
    
    [yzm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(yanzhengma.mas_right).with.offset(-30);
        make.bottom.equalTo(yanzhengma.mas_bottom).with.offset(-5);
        
    }];
 
    [Denglu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(yanzhengma.mas_bottom).with.offset(15);
        make.left.equalTo(ws.view).with.offset(30);
        make.right.equalTo(ws.view).with.offset(-30);
        make.height.mas_equalTo(@44);
        make.bottom.equalTo(scrollView.mas_bottom).with.offset(-300);
        
    }];

}

- (void)qiye{
    WS(ws);
    [danweiname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(scrollView.mas_top).with.offset(5);

    }];
    [nashuiren mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(danweiname.mas_bottom).with.offset(15);
        
    }];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
 make.top.equalTo(nashuiren.mas_bottom).with.offset(15);
        
    }];
    [mima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(name.mas_bottom).with.offset(15);

    }];
    [qurenmima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(mima.mas_bottom).with.offset(15);

    }];
    [phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(qurenmima.mas_bottom).with.offset(15);

    }];
    [yanzhengma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(phone.mas_bottom).with.offset(15);

    }];
    
    [yzm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(yanzhengma.mas_right).with.offset(-30);
        make.bottom.equalTo(yanzhengma.mas_bottom).with.offset(-5);
        
    }];

    [yaoqingma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(yanzhengma.mas_bottom).with.offset(15);
        
    }];
    
    [Denglu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(yaoqingma.mas_bottom).with.offset(15);
        make.left.equalTo(ws.view).with.offset(30);
        make.right.equalTo(ws.view).with.offset(-30);
        make.height.mas_equalTo(@44);
        make.bottom.equalTo(scrollView.mas_bottom).with.offset(-300);

    }];

}
- (void)Denglu{
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在注册...";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.view.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view.window);
    }];

    switch (_style) {
        case ZHUCESTYLEGEREN:
            if (name.textField.text.length == 0) {
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"用户姓名不能为空...";
                [mb hideAnimated:YES afterDelay:2];
                
            }else if (mima.textField.text.length == 0){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"登录密码不能为空...";
                [mb hideAnimated:YES afterDelay:2];
                
            }else if (qurenmima.textField.text.length == 0){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"确认密码不能为空...";
                [mb hideAnimated:YES afterDelay:2];
            }else if (mima.textField.text.length < 6 ||qurenmima.textField.text.length<6){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"密码必须大于6位";
                [mb hideAnimated:YES afterDelay:2];
            }
            else if (phone.textField.text.length == 0){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"手机号不能为空...";
                [mb hideAnimated:YES afterDelay:2];
            }else if (![BaseObject valiMobile:phone.textField.text]){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"手机号格式不正确";
                [mb hideAnimated:YES afterDelay:2];
            }else if (phone.textField.text.length == 0){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"手机号不能为空...";
                [mb hideAnimated:YES afterDelay:2];
            }else if (yanzhengma.textField.text.length == 0){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"验证码不能为空...";
                [mb hideAnimated:YES afterDelay:2];
            }else if (![yanzhengma.textField.text isEqualToString:content]){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"验证码不对";
                [mb hideAnimated:YES afterDelay:2];
            }else{
                [self zhmi:mb];

            }
            break;
        case ZHUCESTYLEGONGSI:
            if (danweiname.textField.text.length == 0) {
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"单位名不能为空...";
                [mb hideAnimated:YES afterDelay:2];
            }else if (nashuiren.textField.text.length == 0){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"纳税人不能为空...";
                [mb hideAnimated:YES afterDelay:2];
            }else if (name.textField.text.length == 0) {
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"用户姓名不能为空...";
                [mb hideAnimated:YES afterDelay:2];
                
            }else if (mima.textField.text.length == 0){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"登录密码不能为空...";
                [mb hideAnimated:YES afterDelay:2];
                
            }else if (qurenmima.textField.text.length == 0){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"确认密码不能为空...";
                [mb hideAnimated:YES afterDelay:2];
            }else if (mima.textField.text.length < 6 ||qurenmima.textField.text.length<6){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"密码必须大于6位";
                [mb hideAnimated:YES afterDelay:2];
            }
            else if (phone.textField.text.length == 0){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"手机号不能为空...";
                [mb hideAnimated:YES afterDelay:2];
            }else if (![BaseObject valiMobile:phone.textField.text]){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"手机号格式不正确";
                [mb hideAnimated:YES afterDelay:2];
            }else if (phone.textField.text.length == 0){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"手机号不能为空...";
                [mb hideAnimated:YES afterDelay:2];
            }else if (![yanzhengma.textField.text isEqualToString:content]){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"验证码不对";
                [mb hideAnimated:YES afterDelay:2];
            }else if (yanzhengma.textField.text.length == 0){
                mb.mode = MBProgressHUDModeCustomView;
                mb.label.text = @"验证码不能为空...";
                [mb hideAnimated:YES afterDelay:2];
            }else{
                [self zhmi:mb];
            }
            break;
        default:
            break;
    }
    
}

- (void)huishoujianpan{
    [danweiname.textField resignFirstResponder];
    [nashuiren.textField resignFirstResponder];
    [name.textField resignFirstResponder];
    [mima.textField resignFirstResponder];
    [qurenmima.textField resignFirstResponder];
    [phone.textField resignFirstResponder];
    [yanzhengma.textField resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)zhmi:(MBProgressHUD *)mb{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ZC];
    NSDictionary  * dic = [NSDictionary dictionary];
    switch (_style) {
        case ZHUCESTYLEGEREN:
            dic = @{@"username":name.textField.text,@"password":mima.textField.text,@"phone":phone.textField.text,@"r_type":@"1"};
            break;
        case ZHUCESTYLEGONGSI:
            dic = @{@"username":name.textField.text,@"password":mima.textField.text,@"phone":phone.textField.text,@"entername":danweiname.textField.text,@"taxpayernum":nashuiren.textField.text,@"r_type":@"2",@"superior":yaoqingma.textField.text};
            break;
        default:
            break;
    }
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            Message * message = [Message mj_objectWithKeyValues:responseObject];
            if ([message.code isEqual:@200]) {
                [mb hideAnimated:NO afterDelay:1];
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                mb.label.text = message.message;
                [mb hideAnimated:NO afterDelay:1];
                UIView * view = [BaseObject AddTipView:message.message];
                [self.view.window addSubview:view];
            }
            
        }else{
            mb.label.text = @"注册失败";
            [mb hideAnimated:NO afterDelay:1];
        }
    }];
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
@end

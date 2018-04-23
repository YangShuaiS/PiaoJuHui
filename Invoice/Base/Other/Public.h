//
//  Public.h
//  LOL
//
//  Created by Kean on 16/7/1.
//  Copyright © 2016年 Kean. All rights reserved.
//

#ifndef Public_h
#define Public_h
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT  [UIScreen mainScreen].bounds.size.height
#define MENU  44
#define PAGENUMBER  15


#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;



//#define ZSFWQ @"http://192.168.1.12"
#define ZSFWQ @"https://api.piaojuhui.net"
#define FPZY @"https://api.piaojuhui.net"

#define JK_DL @"/login" //登录
#define JK_ZC @"/register" //注册
#define JK_GRZX @"/usercenter" //个人中心
#define JK_WDZH @"/useraccount" //我的账户
#define JK_CZJG @"/rechargepage" //充值
#define JK_CZJG @"/rechargepage" //充值价格
#define JK_CZLB @"/rechargerecord"//充值列表
#define JK_HOME @"/homepage"//首页接口
#define JK_TJ   @"/count"//统计
#define JK_FPLB @"/invoicelist"//发票列表
#define JK_FPBX @"/reimbursement"//发票报销
#define JK_XGMM @"/changepassword"//修改密码
#define JK_FSYZM @"/sendmessage"//验证码
#define JK_ZHMM @"/findpassword"//找回密码
#define JK_TCDL @"/loginout"//退出登录
#define JK_FPTT @"/enterinfo"//发票抬头
#define JK_ZZJKrecharge @"/recharge"//充值接口
#define JK_SCTP @"/uploadimg"//上传图片

#define JK_FPCY @"/checkticket"//发票查验

#define JK_TOKENJY @"/checktoken"//token检验


// 相对iphone6S 屏幕比
#define KWidth_ScaleW [UIScreen mainScreen].bounds.size.width/414.0f
#define KWidth_ScaleH [UIScreen mainScreen].bounds.size.height/736.0f

// tabBar的背景色
#define TabBar_T_Color RGB(191, 31, 31)
#define TABBARHeight self.tabBarController.tabBar.frame.size.height
#define NAVIGATIONHeight self.navigationController.navigationBar.frame.size.height
#define STAUBARHEIGHT [[UIApplication sharedApplication]  valueForKey:@"statusBar"];

// RGB
#define RGBA(r, g, b, a)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)  RGBA(r, g, b, 1.0f)

// 系统版本
#define SYTEM_VERSION [[UIDevice currentDevice].systemVersion floatValue]

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

//通知名称
#define kNotificationDenglu        @"kNotificationDenglu"
#define kNotificationTuiChuDenglu        @"kNotificationTuiChuDenglu"

//字体大小
#define TextFont(f) [UIFont systemFontOfSize:f]
//跟视图数量
#define ChildViewControllersCount self.navigationController.childViewControllers.count
//plist文件
#define GKanJiLu @"GKanJiLu.plist"
#define UserMe @"UserMe.plist"

#define XAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//展位图
#define UIIMAGE(image) [UIImage imageNamed:@image]

#define PANDUANSHUZHIGEREN @"1111"
#define PANDUANSHUZHIQIYE @"111111"

#import "BaseENUM.h"
#import "ALlModel.h"
#import "BaseObject.h"
#import "InvoiceFooter.h"

#import "BaseAppRequestManager.h"
#endif /* Public_h */

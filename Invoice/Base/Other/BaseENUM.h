//
//  BaseENUM.h
//  ACMfun
//
//  Created by 杨帅 on 2018/1/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark -------------- 返回时间
typedef NS_ENUM(NSInteger, Click) {
    ClickPushQrcode = 1,   //跳转二维码页面
    ClickPushPerson = 2,   //跳转个人中心页面
    ClickancCehng = 3,   //完成通知
    ClickancTime = 4,   //弹出选择时间键盘
    ClickancZhiFu = 5,  //跳转支付页面
    ClickancFSYZM = 6,  //发送验证吗
    ClickancZFXX = 7,  //获取支付信息


};
typedef NS_ENUM(NSInteger, HomeCenter) {
    HomeCentertwo = 2,   //4张
    HomeCenterthree = 3  //3张
};
typedef NS_ENUM(NSInteger, TextFieldENUM) {
    TextFieldPassword = 1,   //密码
    TextFieldTime = 2 ,   //时间
    TextFieldShuZi = 3,//  数字
    TextFieldNULL = 4, //无要求
};

typedef NS_ENUM(NSInteger, TextFieldBackViewENUM) {
    TextFieldBackViewWhit = 1,   //白字
    TextFieldBackViewBack = 2 ,   //黑子
};
typedef NS_ENUM(NSInteger, ZHUCESTYLE) {
    ZHUCESTYLEGEREN = 1,   //个人
    ZHUCESTYLEGONGSI = 2 ,   //公司
};

typedef NS_ENUM(NSInteger, BingTuDownColor) {
    BingTuDownWeiheyan = 1,   //未核验
    BingTuDownYiHeYan = 2 ,   //已核验
    BingTuDownYiBaoXio = 3 ,   //已报销

};
#pragma mark -------------- Native样式
typedef NS_ENUM(NSInteger, NativeStyle) {
    LeftImageCenterLableRightLableClick = 1,
    LeftImageCenterLableRightImage = 2,
    LeftNilCenterLableRightImage = 3,
    LeftNilCenterLableRightLableClick = 4,
    LeftImageCenterNilRightLableClick = 5,
    LeftImageCenterNilRightImage = 6,
    LeftImageCenterLableClickRightNil = 7,
    LeftImageCenterLableRightNil = 8
};
#pragma mark -------------- 内容显示多少
typedef NS_ENUM(NSInteger, ContentAccordingToSome) {
    ContentTheWholeShow = 1,//全显示
    ContentPartOfADisplay = 2,//部分显示
};
@interface BaseENUM : NSObject

@end

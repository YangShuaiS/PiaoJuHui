//
//  BaseObject.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseObject.h"
CGFloat NavHeight = 0;
CGFloat TabBarHeight = 0;
CGFloat StatusBar = 0;
MeModel * Me = nil;

@implementation BaseObject
+ (NSInteger)CellLine:(NSInteger)Cont XX:(float)xx{
    float f = Cont/xx;
    NSInteger a;
    a = ceil(f);
    return a;
    
}

+ (NSString *)AddPathName:(NSString *)path{
    //获取路径对象
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *paths = [pathArray objectAtIndex:0];
    
    //获取文件的完整路径
    NSString *filePatch = [paths stringByAppendingPathComponent:path];
    
    
    return filePatch;
}

#pragma mark ~~~~~~~~~~~~创建全局提示框~~~~~~~~~~~~~~~

+(UIView *)AddTipView:(NSString *)string{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = RGB(0x05, 0x06, 0x08);
    view.layer.cornerRadius = 10;
    view.alpha = 0.8;
    
    // 声明一个 UILabel 对象
    BaseLabel * tipLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(WIDTH/2-60, HEIGHT-180, 120, 60) LabelTxteColor:[UIColor whiteColor] LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:string];
    // 设置提示内容
    tipLabel.layer.cornerRadius = 5;
    tipLabel.layer.masksToBounds = YES;
    // ~~~~~~~~~~~~以下是最新根据文字个数创建视图
    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    CGSize size = [tipLabel.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    tipLabel.frame = CGRectMake(10,  0, size.width+20, 36);
    view.frame = CGRectMake(WIDTH/2-size.width/2-20, HEIGHT - 32-36-TabBarHeight, size.width+40, 36);
    [view addSubview:tipLabel];
    // 设置时间和动画效果
    [UIView animateWithDuration:2.0 animations:^{
        view.alpha = 0.0;
    } completion:^(BOOL finished) {
        // 动画完毕从父视图移除
        [view removeFromSuperview];
    }];
    return view;
}

+ (NSArray *)TiemArray:(NSString *)time
                String:(NSString *)string{
    NSArray *array = [time componentsSeparatedByString:string]; //从字符A中分隔成2个元素的数组
//    NSArray *timearray = [array[0] componentsSeparatedByString:@"-"]; //从字符A中分隔成2个元素的数组
    return array;
}
+(UIView *)AddBackView{
    UIView * bacview = [UIView new];
    UIView * topview = [UIView new];
    topview.backgroundColor = RGB(0x0e, 0x06, 0x00);
    topview.alpha = 0.7;
    [bacview addSubview:bacview];
//    WS(ws);
//    [bacview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(ws);
//    }];
//    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(bacview);
//    }];
    return bacview;
}

#pragma mark - 判断手机号码格式是否正确
+ (BOOL)valiMobile:(NSString *)mobile
{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}
//获取当前的时间

+(NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"YYYYMMddHHmmss"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    MJExtensionLog(@"currentTimeString =  %@",currentTimeString);
    
    return currentTimeString;
    
}
@end

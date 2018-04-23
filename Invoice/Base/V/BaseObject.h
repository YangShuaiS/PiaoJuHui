//
//  BaseObject.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseButton.h"
#import "BaseLabel.h"
#import "UICountingLabel.h"
#import "BaseTableView.h"
#import "BaseTableViewCell.h"
#import <FLAnimatedImageView.h>
#import "MeModel.h"
extern CGFloat NavHeight;
extern CGFloat TabBarHeight;
extern CGFloat StatusBar;
extern MeModel const * Me;

@interface BaseObject : NSObject
//返回几个
+ (NSInteger)CellLine:(NSInteger)Cont XX:(float)xx;
//路径
+ (NSString *)AddPathName:(NSString *)path;
#pragma mark - 创建提示视图
+(UIView *)AddTipView:(NSString *)string;
+(UIView *)AddBackView;

#pragma mark - 时间截取
+ (NSArray *)TiemArray:(NSString *)time
                String:(NSString *)string;

+ (BOOL)valiMobile:(NSString *)mobile;

+(NSString*)getCurrentTimes;
@end

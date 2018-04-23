//
//  MeModel.h
//  ACMfun
//
//  Created by 杨帅 on 2017/12/19.
//  Copyright © 2017年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"
#import "UserModel.h"
#import "UserZhanHuModel.h"
#import "ChongZhiTCModel.h"
#import "ChongZhiModel.h"
#import "ChongZhiJLXQModel.h"
#import "FPModel.h"
#import "xmdataa.h"
#import "HomeModel.h"
#import "TongJiModel.h"
#import "SYMODEL.h"
#import "FPTTModel.h"
@interface MeModel : NSObject
@property (nonatomic, copy) NSNumber *code;
@property (nonatomic, copy) NSString *enter_id;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *user_type;
+ (MeModel *)SharedModel;
- (MeModel *)ADDvalue;
@end

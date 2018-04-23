//
//  FPModel.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FPXQModel.h"
#import "ZZPTModel.h"
@interface FPModel : NSObject
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) FPXQModel *data;//公司
@property (nonatomic, strong) NSNumber *countpage;//公司

@end

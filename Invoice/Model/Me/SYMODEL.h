//
//  SYMODEL.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYJLModel.h"
@interface SYMODEL : NSObject
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSNumber *countpage;//公司

@end

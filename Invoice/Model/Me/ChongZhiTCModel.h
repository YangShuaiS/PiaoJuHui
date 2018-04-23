//
//  ChongZhiTCModel.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ChongZhiTCModel : NSObject
@property (nonatomic, copy) NSNumber *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) NSMutableArray *discount;
@property (nonatomic, strong) NSMutableArray *rechargerecord;

@end



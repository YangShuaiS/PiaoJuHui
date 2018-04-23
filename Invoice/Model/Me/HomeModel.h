//
//  HomeModel.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject
@property (nonatomic, assign) CGFloat amount;
@property (nonatomic, copy) NSNumber *code;
@property (nonatomic, assign) CGFloat count;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) CGFloat oldamount;
@property (nonatomic, assign) CGFloat oldcount;
@property (nonatomic, copy) NSString *content;

@end

//
//  UserModel.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *user_department;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, copy) NSString *user_position;

@end

//
//  ZZPTModel.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/26.
//  Copyright © 2018年 YS. All rights reserved.
// 增值税普通发票

#import "ZZPTModel.h"

@implementation ZZPTModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}
- (void)setValue:(id)value forKey:(NSString *)key{
    if ([value isEqual:[NSNull null]]||[value isKindOfClass:[NSNull class]]||value==nil||[value  isEqual: @""]) {
        value = @"";

    }

    [super setValue:value forKey:key];
    
}
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([oldValue isEqual:[NSNull null]]||[oldValue isKindOfClass:[NSNull class]]||oldValue==nil||[oldValue  isEqual: @""]) {
        return @"";  // 以字符串类型为例
    }
    return oldValue;
}
@end

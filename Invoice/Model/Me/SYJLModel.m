

//
//  SYJLModel.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "SYJLModel.h"

@implementation SYJLModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (void)setValue:(id)value forKey:(NSString *)key{
    if (value == nil || value == NULL) {
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

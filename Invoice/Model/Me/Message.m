//
//  Message.m
//  ACMfun
//
//  Created by 杨帅 on 2018/1/18.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "Message.h"

@implementation Message
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

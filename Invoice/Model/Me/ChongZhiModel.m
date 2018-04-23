

//
//  ChongZhiModel.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ChongZhiModel.h"

@implementation ChongZhiModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (void)setValue:(id)value forKey:(NSString *)key{

    [super setValue:value forKey:key];
    
}
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([oldValue isEqual:[NSNull null]]||[oldValue isKindOfClass:[NSNull class]]||oldValue==nil||[oldValue  isEqual: @""]) {
        return @"";  // 以字符串类型为例
    }
    return oldValue;
}
@end

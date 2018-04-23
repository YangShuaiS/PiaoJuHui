//
//  MeModel.m
//  ACMfun
//
//  Created by 杨帅 on 2017/12/19.
//  Copyright © 2017年 YS. All rights reserved.
//

#import "MeModel.h"
static MeModel * model = nil;

@implementation MeModel
+ (MeModel *)SharedModel{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        model = [[MeModel alloc] init];
    });
    return model;
}
- (MeModel *)ADDvalue{
    NSString *filePatch = [BaseObject AddPathName:UserMe];
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
    NSDictionary *dictionary = dataDictionary[UserMe];
        model = [MeModel mj_objectWithKeyValues:dictionary];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (void)setValue:(id)value forKey:(NSString *)key{
    if (value == nil || value == NULL) {
        value = @"";
    }
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"id"]) {
        
    }
}
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([oldValue isEqual:[NSNull null]]||[oldValue isKindOfClass:[NSNull class]]||oldValue==nil||[oldValue  isEqual: @""]) {
        return @"";  // 以字符串类型为例
    }
    return oldValue;
}
@end

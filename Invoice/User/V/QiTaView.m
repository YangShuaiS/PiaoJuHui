//
//  QiTaView.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "QiTaView.h"

@implementation QiTaView
- (instancetype)init{
    self = [super init];
    [self addview];
    return self;
}
- (void)addview{
    WS(ws);
    //    self.backgroundColor = [UIColor redColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 2;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [RGB(0xf9, 0x71, 0x2c) CGColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

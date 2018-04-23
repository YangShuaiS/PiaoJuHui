//
//  HuoDOng.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HuoDOng.h"

@implementation HuoDOng{
    BaseLabel * money ;
    BaseLabel * taocan ;
}
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
    self.layer.borderColor = [RGB(0xe6, 0xe6, 0xe6) CGColor];
    
    money = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x66, 0x66, 0x66) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"¥50"];
    [self addSubview:money];
    
    taocan = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x66, 0x66, 0x66) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"套餐"];
    [self addSubview:taocan];
    
    [money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(15);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
    }];
    
    [taocan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(money.mas_bottom).with.offset(10);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        
    }];
    
}

- (void)DidNotclick{
    money.textColor = RGB(0x66, 0x66, 0x66);
    taocan.textColor = RGB(0x66, 0x66, 0x66);
    self.layer.borderColor = [RGB(0xe6, 0xe6, 0xe6) CGColor];

}
- (void)DidClick{

    money.textColor = RGB(0xf9, 0x71, 0x2c);
    taocan.textColor = RGB(0xf9, 0x71, 0x2c);
    self.layer.borderColor = [RGB(0xf9, 0x71, 0x2c) CGColor];

}

- (void)setModel:(ChongZhiModel *)model{
    _model = model;
    money.text = [NSString stringWithFormat:@"¥%@",model.recharge];
    taocan.text = [NSString stringWithFormat:@"%@:%@张",model.dis_describe,model.dis_votes];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

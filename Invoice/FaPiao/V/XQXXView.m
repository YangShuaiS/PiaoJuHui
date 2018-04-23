//
//  XQXXView.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/21.
//  Copyright © 2018年 YS. All rights reserved.
//详情信息

#import "XQXXView.h"

@implementation XQXXView{
    BaseLabel * title;
    BaseLabel * name;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        [self buju];
    }
    return self;
}

-(void)buju{
    WS(ws);
    static NSString * str = @"999999999";
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x99, 0x99, 0x99) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"名称"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws);
        make.left.equalTo(ws).with.offset(15);
        make.width.mas_equalTo(100);
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:str];
    name.numberOfLines = 0;
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(10);
        make.left.equalTo(title.mas_right).with.offset(12);
        make.right.equalTo(ws).with.offset(-15);
        make.bottom.equalTo(ws).with.offset(-10);

    }];
}
- (void)setTitletxe:(NSString *)titletxe{
    _titletxe = titletxe;
    title.text = titletxe;
}
- (void)setSubtitle:(NSString *)subtitle{
    _subtitle = subtitle;
    name.text = subtitle;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

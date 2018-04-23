//
//  ZhanBiXQView.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhanBiXQView.h"

@implementation ZhanBiXQView{
    UIView * leftview;
    BaseLabel * leftlabel;
    BaseLabel * centerlabel;
    BaseLabel * rightlabel;

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
    self.backgroundColor = RGB(0xff, 0xff, 0xff);
    leftview = [UIView new];
    leftview.backgroundColor = [UIColor redColor];
    [self addSubview:leftview];
    
    leftlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x99, 0x99, 0x99) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"无"];
    [self addSubview:leftlabel];
    
    centerlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x99, 0x99, 0x99) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"0"];
    [self addSubview:centerlabel];

    rightlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x99, 0x99, 0x99) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentRight Text:@"0%"];
    [self addSubview:rightlabel];
    
    
    [leftview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(17);
        make.left.equalTo(ws).with.offset(15);
        make.width.mas_equalTo(6);
        make.height.mas_equalTo(6);
        make.bottom.equalTo(ws).with.offset(-17);
    }];
    
    [leftlabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(leftview.mas_right).with.offset(10);
        make.centerY.equalTo(ws);
    }];
    
    [centerlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws);
        make.centerX.equalTo(ws);
    }];
    
    [rightlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(-15);
        make.centerY.equalTo(ws);
    }];
}

- (void)setStyle:(BingTuDownColor)style{
    _style = style;
    switch (style) {
        case BingTuDownYiHeYan:
            [self yiheyan];
            break;
        case BingTuDownWeiheyan:
            [self weiheyan];
            break;
        case BingTuDownYiBaoXio:
            [self yibaoxiao];
            break;
        default:
            break;
    }
}
- (void)yiheyan{
    UIColor * color = RGB(0x45, 0xc1, 0x86);
    leftlabel.text = @"已核验";
    [self reload:color];
    centerlabel.text = [NSString stringWithFormat:@"%.0f",_model.countone];
    rightlabel.text = [NSString stringWithFormat:@"%.0f%%",_model.countone/_model.count*100];
}



- (void)weiheyan{
    UIColor * color = RGB(0x46, 0x87, 0xff);
    leftlabel.text = @"提交未报销";
    [self reload:color];
    centerlabel.text = [NSString stringWithFormat:@"%.0f",_model.counttwo];
    rightlabel.text = [NSString stringWithFormat:@"%.0f%%",_model.counttwo/_model.count*100];
}

- (void)yibaoxiao{
    UIColor * color = RGB(0xfd, 0x80, 0x40);
    leftlabel.text = @"已报销";
    [self reload:color];
    centerlabel.text = [NSString stringWithFormat:@"%.0f",_model.countthree];
    rightlabel.text = [NSString stringWithFormat:@"%.0f%%",_model.countthree/_model.count*100];


}
- (void)reload:(UIColor *)color{
    leftview.backgroundColor = color;
    leftlabel.textColor = color;
    centerlabel.textColor = color;
    rightlabel.textColor = color;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

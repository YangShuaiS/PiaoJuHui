
//
//  BingTuView.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BingTuView.h"

@implementation BingTuView
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
    UIView *leftview = [[UIView alloc] init];
    leftview.backgroundColor = RGB(0xf9, 0x71, 0x2c);
    [self addSubview:leftview];
    
    BaseLabel * fapiaozhanbi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"发票报销占比"];
    fapiaozhanbi.userInteractionEnabled = YES;
    [self addSubview:fapiaozhanbi];
    
    BaseLabel * danwei = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x99, 0x99, 0x99) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"单位：张"];
    danwei.userInteractionEnabled = YES;
    [self addSubview:danwei];
    
    self.pieView = [LCPieView pieView];
    _pieView.frame = CGRectMake(0, 46, WIDTH, 80);

    [self addSubview:_pieView];
//        [self resetData];

    
    [leftview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(15);
        make.left.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(4);
        make.height.mas_equalTo(16);

    }];
    
    [fapiaozhanbi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(15);
        make.left.equalTo(leftview.mas_right).with.offset(11);
    }];
    
    [danwei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fapiaozhanbi.mas_bottom).with.offset(10);
        make.left.equalTo(leftview.mas_right).with.offset(11);
        
        make.bottom.equalTo(ws).with.offset(-160);


    }];
    
    [_pieView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(46+40);
    make.left.equalTo(leftview.mas_right).with.offset(0);

    }];
}
- (void)resetData {

//    LCPieViewModel *modelP0 = [LCPieViewModel modelWithValue:788 color:RGB(0x46, 0x87, 0xff) text:@"99组"];
    LCPieViewModel *modelP1 = [LCPieViewModel modelWithValue:456 color:RGB(0x45, 0xc1, 0x86) text:@"已核验"];
    LCPieViewModel *modelP2 = [LCPieViewModel modelWithValue:237 color:RGB(0xfd, 0x80, 0x40) text:@"已报销"];
    [self.pieView showPieViewWithDataSource:@[modelP1, modelP2]];

}
- (void)setModel:(TongJiModel *)model{
    _model = model;
//    [self resetData];
    if (model.countone == 0) {
        model.countone = 0.0001;
    }
    if (model.countthree == 0) {
        model.countthree = 0.0001;
    }
    if (model.counttwo == 0) {
        model.counttwo = 0.0001;
    }
    LCPieViewModel *modelP1 = [LCPieViewModel modelWithValue:model.countone color:RGB(0x45, 0xc1, 0x86) text:@"已核验"];
    LCPieViewModel *modelP2 = [LCPieViewModel modelWithValue:model.countthree color:RGB(0xfd, 0x80, 0x40) text:@"已报销"];
    LCPieViewModel *modelP3 = [LCPieViewModel modelWithValue:model.counttwo color:RGB(0x46, 0x87, 0xff) text:@"提交未报销"];

    [self.pieView showPieViewWithDataSource:@[modelP1, modelP2,modelP3]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

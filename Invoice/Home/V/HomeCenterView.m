//
//  HomeCenterView.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeCenterView.h"

@implementation HomeCenterView
- (void)setCenters:(HomeCenter)centers{
    _centers = centers;
    self.backgroundColor = RGB(0xff, 0xff, 0xff);
    switch (centers) {
        case HomeCentertwo:
            [self addfour];
            break;
        case HomeCenterthree:
            [self addthree];
            break;
        default:
            break;
    }
}

- (void)addfour{
    WS(ws);
    NSInteger count = 4;
    FLAnimatedImageView * oneimageview = [FLAnimatedImageView new];
    oneimageview.image = UIIMAGE("我的发票");
    [self addSubview:oneimageview];
    [oneimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(30);
        make.left.equalTo(ws).with.offset(WIDTH/count/2-25);
        
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(50);
    }];
    
    BaseLabel * onelable = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"我的发票"];
    [self addSubview:onelable];
    [onelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneimageview.mas_bottom).with.offset(10);
        make.left.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(WIDTH/count);
        
    }];
    BaseButton * onebutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [onebutton addTarget:self action:@selector(onebutton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:onebutton];
    [onebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(WIDTH/count);
    }];
    
    
    FLAnimatedImageView * twoimageview = [FLAnimatedImageView new];
    twoimageview.image = UIIMAGE("发票核验");
    [self addSubview:twoimageview];
    [twoimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(30);
        make.left.equalTo(oneimageview.mas_right).with.offset(WIDTH/count-50);
        
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(50);
    }];
    
    BaseLabel * twolable = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"发票核验"];
    [self addSubview:twolable];
    
    [twolable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneimageview.mas_bottom).with.offset(10);
        make.width.mas_equalTo(WIDTH/count);
        
        make.left.equalTo(onelable.mas_right).with.offset(0);
    }];
    
    BaseButton * twobutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [twobutton addTarget:self action:@selector(twobutton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:twobutton];
    [twobutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(onelable.mas_right).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(WIDTH/count);
    }];
    
    FLAnimatedImageView * threeimageview = [FLAnimatedImageView new];
    threeimageview.image = UIIMAGE("发票抬头");
    [self addSubview:threeimageview];
    [threeimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(30);
        make.left.equalTo(twoimageview.mas_right).with.offset(WIDTH/count-50);

        make.height.mas_equalTo(50);
        make.width.mas_equalTo(50);
    }];
    
    BaseLabel * threelable = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"发票抬头"];
    [self addSubview:threelable];
    
    [threelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneimageview.mas_bottom).with.offset(10);
        make.width.mas_equalTo(WIDTH/count);
        
        make.left.equalTo(twolable.mas_right).with.offset(0);
    }];
    
    BaseButton * threebutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [threebutton addTarget:self action:@selector(threebutton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:threebutton];
    [threebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(WIDTH/count);
        make.left.equalTo(twolable.mas_right).with.offset(0);

    }];
    
    FLAnimatedImageView * fourimageview = [FLAnimatedImageView new];
    fourimageview.image = UIIMAGE("拍照识别");
    [self addSubview:fourimageview];
    [fourimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(30);
        make.right.equalTo(ws).with.offset(-(WIDTH/count/2-25));
        
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(50);
    }];
    
    BaseLabel * fourlable = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"拍照识别"];
    [self addSubview:fourlable];
    
    [fourlable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneimageview.mas_bottom).with.offset(10);
        make.width.mas_equalTo(WIDTH/count);
        
        make.right.equalTo(ws).with.offset(0);
    }];
    
    BaseButton * fourbutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [fourbutton addTarget:self action:@selector(fourbutton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:fourbutton];
    [fourbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(WIDTH/count);
    }];
    
    UIView * xian = [UIView new];
    xian.backgroundColor =RGB(0xee, 0xee, 0xee);
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_bottom).with.offset(0);
        make.right.equalTo(ws).with.offset(-15);
        make.left.equalTo(ws).with.offset(15);
        make.height.mas_equalTo(0.5);

    }];
}
- (void)addthree{
    WS(ws);
    FLAnimatedImageView * oneimageview = [FLAnimatedImageView new];
    oneimageview.image = UIIMAGE("我的发票");
    [self addSubview:oneimageview];
    [oneimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(30);
        make.left.equalTo(ws).with.offset(WIDTH/3/2-25);
        
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(50);
    }];
    
    BaseLabel * onelable = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"我的发票"];
    [self addSubview:onelable];
    [onelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneimageview.mas_bottom).with.offset(10);
        make.left.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(WIDTH/3);
        
    }];
    BaseButton * onebutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [onebutton addTarget:self action:@selector(onebutton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:onebutton];
    [onebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(WIDTH/3);
    }];
    
    
    FLAnimatedImageView * twoimageview = [FLAnimatedImageView new];
    twoimageview.image = UIIMAGE("发票核验");
    [self addSubview:twoimageview];
    [twoimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(30);
        make.left.equalTo(oneimageview.mas_right).with.offset(WIDTH/3-50);
        
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(50);
    }];
    
    BaseLabel * twolable = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"发票核验"];
    [self addSubview:twolable];
    
    [twolable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneimageview.mas_bottom).with.offset(10);
        make.width.mas_equalTo(WIDTH/3);
        
        make.left.equalTo(onelable.mas_right).with.offset(0);
    }];
    
    BaseButton * twobutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [twobutton addTarget:self action:@selector(twobutton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:twobutton];
    [twobutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(onelable.mas_right).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(WIDTH/3);
    }];
    
    FLAnimatedImageView * threeimageview = [FLAnimatedImageView new];
    threeimageview.image = UIIMAGE("拍照识别");
    [self addSubview:threeimageview];
    [threeimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(30);
        make.right.equalTo(ws).with.offset(-(WIDTH/3/2-25));
        
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(50);
    }];
    
    BaseLabel * threelable = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"拍照识别"];
    [self addSubview:threelable];
    
    [threelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneimageview.mas_bottom).with.offset(10);
        make.width.mas_equalTo(WIDTH/3);
        
        make.right.equalTo(ws).with.offset(0);
    }];
    
    BaseButton * threebutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [threebutton addTarget:self action:@selector(fourbutton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:threebutton];
    [threebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(WIDTH/3);
    }];
    
//    
//    UIView * xian = [UIView new];
//    xian.backgroundColor =RGB(0xee, 0xee, 0xee);
//
//    [self addSubview:xian];
//    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(ws.mas_bottom).with.offset(0);
//        make.right.equalTo(ws).with.offset(-15);
//        make.left.equalTo(ws).with.offset(15);
//        make.height.mas_equalTo(1);
//        
//    }];
}

- (void)onebutton{
    [self.delegate oneButtonClick];
}
- (void)twobutton{
    [self.delegate twoButtonClick];
}
- (void)threebutton{
    [self.delegate threeButtonClick];
}
- (void)fourbutton{
    [self.delegate fourButtonClick];

}
@end

//
//  BoLangView.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BoLangView.h"
#import "BoLang.h"
@implementation BoLangView{
    BoLang * bolang;
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
    self.clipsToBounds=YES;
    UIImage * backimage = UIIMAGE("波浪1");

    bolang = [BoLang new];
    [self addSubview:bolang];
    [bolang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(backimage.size.height);

    }];
}
-(void)setStare:(BOOL)stare{
    _stare = stare;
    bolang.stare = stare;

}
/*
// Only override drawRect: if you/Users/yangshuai/Desktop/wave-bot.png/Users/yangshuai/Desktop/wave-mid.png/Users/yangshuai/Desktop/wave-top.png perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

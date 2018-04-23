//
//  ChongZhiXuanXiang.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ChongZhiXuanXiang.h"
#import "HuoDOng.h"
#import "QiTaView.h"
@implementation ChongZhiXuanXiang{
    NSMutableArray * allarray;
    HuoDOng * lasthuodong;
    QiTaView * lastqita;
    UIScrollView * scrollView;

}

- (instancetype)init{
    self = [super init];
    allarray = [NSMutableArray array];
    return self;
}
- (void)setDiscount:(NSMutableArray *)discount{
    _discount = discount;
    self.backgroundColor = RGB(0xff, 0xff, 0xff);
    [self addview];

}
- (void)addview{
    WS(ws);
    UIView *lastView;
    NSInteger count = _discount.count;
    int c = 0;
    NSInteger a = [BaseObject CellLine:count XX:2.0];
    for (int i = 0 ; i < a; i++) {
        NSMutableArray * viewarray = [NSMutableArray array];
        UIView * huodong = [UIView new];
        [self addSubview:huodong];
        [huodong mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastView ? lastView.mas_bottom : @15);
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.width.mas_equalTo(ws);
            make.height.mas_equalTo(@90);
        }];
        if (i == a-1) {
            [huodong mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(ws).with.offset(0);
            }];
            
            if (a * 2 != count) {
                HuoDOng * HuoDOng1 = [HuoDOng new];
                HuoDOng1.model = _discount[c];
                [huodong addSubview:HuoDOng1];
                UIView * qita = [UIView new];
                [huodong addSubview:qita];
//                lastqita = qita;
                BaseButton *onebutton = [BaseButton buttonWithType:UIButtonTypeCustom];
                onebutton.tag = 100+c;
                [onebutton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
                [HuoDOng1 addSubview:onebutton];
                c++;
//                BaseButton *twobutton = [BaseButton buttonWithType:UIButtonTypeCustom];
//                twobutton.tag = 100+c;
//                [twobutton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//                [qita addSubview:twobutton];
                c++;
                [onebutton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(HuoDOng1);
                }];
//                [twobutton mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.edges.equalTo(qita);
//                }];
                
                [viewarray addObject:HuoDOng1];
                [viewarray addObject:qita];
                [allarray addObject:HuoDOng1];
                [allarray addObject:qita];
                    [viewarray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:15 leadSpacing:15 tailSpacing:15];
                [viewarray mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(0);
                        make.height.mas_equalTo(@75);
                }];

            }else{
                for (int i = 0; i < 2; i++) {
                    HuoDOng * huodong1 = [HuoDOng new];
                    [huodong addSubview:huodong1];
                    [viewarray addObject:huodong1];
                    [allarray addObject:huodong1];
                    huodong1.model = _discount[c];

                    BaseButton *onebutton = [BaseButton buttonWithType:UIButtonTypeCustom];
                    onebutton.tag = 100+c;
                    [onebutton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
                    [huodong1 addSubview:onebutton];
                    c++;
                    [onebutton mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.edges.equalTo(huodong1);
                    }];
                }
                
                [viewarray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:15 leadSpacing:15 tailSpacing:15];
                [viewarray mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(0);
                    make.height.mas_equalTo(@75);
                }];
            }
        }else{
            for (int i = 0; i < 2; i++) {
                HuoDOng * huodong1 = [HuoDOng new];
                huodong1.model = _discount[c];

                [huodong addSubview:huodong1];
                [viewarray addObject:huodong1];
                [allarray addObject:huodong1];
                BaseButton *onebutton = [BaseButton buttonWithType:UIButtonTypeCustom];
                onebutton.tag = 100+c;
                [onebutton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
                [huodong1 addSubview:onebutton];
                c++;
                [onebutton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(huodong1);
                }];
            }
            
            [viewarray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:15 leadSpacing:15 tailSpacing:15];
            [viewarray mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(0);
                make.height.mas_equalTo(@75);
            }];
        }
    lastView = huodong;

    }
    [self reload];
}

- (void)click:(BaseButton *)button{
    NSInteger i = button.tag-100;
    ALlModel * model = [ALlModel new];
    model.inter = i;
    [self.delegate ClickModel:model Style:ClickancZFXX];
    [lasthuodong DidNotclick];

    if (i == allarray.count) {
    }else{
        lasthuodong = allarray[i];
        [lasthuodong DidClick];
    }

}

- (void)reload{
    lasthuodong = allarray[0];
    [lasthuodong DidClick];
}
@end

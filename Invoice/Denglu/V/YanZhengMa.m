
//
//  YanZhengMa.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "YanZhengMa.h"

@implementation YanZhengMa{
    BaseLabel * name;
    UIView * bakView;
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
    
    bakView = [UIView new];
    bakView.layer.masksToBounds = YES;
    bakView.layer.cornerRadius = 2;
    bakView.backgroundColor = RGB(0xf9, 0x71, 0x2c);
    bakView.alpha = 0.1;
    [self addSubview:bakView];
    [bakView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws);
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xf9, 0x71, 0x2c) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"获取验证码"];
    name.userInteractionEnabled = YES;
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(11);
        make.bottom.equalTo(ws).with.offset(-11);
        make.left.equalTo(ws).with.offset(8);
        make.right.equalTo(ws).with.offset(-8);
    }];
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(HQYZM)];
    [name addGestureRecognizer:labelTapGestureRecognizer];
    
}

- (void)HQYZM{
    [self.delegate ClickModel:nil Style:ClickancFSYZM
     ];
    __block NSInteger time = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                name.text = @"获取验证码";
                name.textColor = RGB(0xf9, 0x71, 0x2c);
                name.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                name.text = [NSString stringWithFormat:@"%.2d秒后可点击", seconds];
                name.textColor = RGB(0xb3, 0xb3, 0xb3);
                bakView.backgroundColor = RGB(0x99, 0x99,0x99);
                name.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}
@end

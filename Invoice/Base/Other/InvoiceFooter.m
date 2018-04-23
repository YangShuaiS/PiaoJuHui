//
//  InvoiceFooter.m
//  Invoice
//
//  Created by 杨帅 on 2018/4/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "InvoiceFooter.h"

@implementation InvoiceFooter
- (void)prepare
{
    [super prepare];

    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    switch (state) {
        case MJRefreshStateIdle:
            //                DH = NO;
            
            break;
        case MJRefreshStatePulling:
            //            DH = YES;
            //            [self startAnimation];
            
            break;
        case MJRefreshStateRefreshing:
            
            break;
        case MJRefreshStateWillRefresh:
            
            break;
        default:
            break;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

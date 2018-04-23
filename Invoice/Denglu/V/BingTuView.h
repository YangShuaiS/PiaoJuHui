//
//  BingTuView.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "LCPieView.h"

@interface BingTuView : BaseView

@property (strong, nonatomic) LCPieView *pieView;
@property (nonatomic, strong) TongJiModel *model;

@end

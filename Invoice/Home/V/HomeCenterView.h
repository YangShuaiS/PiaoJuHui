//
//  HomeCenterView.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
@protocol HomeCenterDelegate // 代理传值方法
- (void)oneButtonClick;
- (void)threeButtonClick;
- (void)twoButtonClick;
- (void)fourButtonClick;

@end
@interface HomeCenterView : BaseView
@property (nonatomic, assign) HomeCenter centers;
@property (nonatomic, weak) id <HomeCenterDelegate> delegate;

@end

//
//  BaseView.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BaseViewDelegate // 代理传值方法
- (void)ClickModel:(ALlModel *)model
             Style:(Click)style;
@end
@interface BaseView : UIView
// 委托代理人，代理一般需使用弱引用(weak)
@property (nonatomic, weak) id <BaseViewDelegate> delegate;
@end

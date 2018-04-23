//
//  BaseViewController.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
@interface BaseViewController : UIViewController<BaseViewDelegate>
@property(nonatomic,strong)dispatch_queue_t RequestDataQueue;

@end

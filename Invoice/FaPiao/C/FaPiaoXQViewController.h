//
//  FaPiaoXQViewController.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseViewController.h"

@interface FaPiaoXQViewController : BaseViewController
@property (nonatomic, strong) NSString *fptype;//发票type

@property (nonatomic, strong) FPXQModel *jdcmodel;//机动车
@property (nonatomic, strong) ZZPTModel *zzptmodel;//增值普通

@end
